const functions = require('firebase-functions');
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');
const crypto = require('crypto');

admin.initializeApp();
const db = admin.firestore();

// Gmail account for sending mails
const gmailUser = "zonerfordev@gmail.com";
const gmailPass = "epzb srzn ieip spdf"; // app password

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: gmailUser,
    pass: gmailPass,
  },
});

// Helper: hash OTP
function hashOtp(otp) {
  return crypto.createHash('sha256').update(otp).digest('hex');
}

// Helper: generate 6-digit OTP
function genOtp() {
  return Math.floor(100000 + Math.random() * 900000).toString();
}

// 🔹 Send OTP Function
exports.sendEmailOtp = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError('unauthenticated', 'Sign in required');
  }

  const uid = context.auth.uid;
  const email = context.auth.token.email || data.email;
  if (!email) {
    throw new functions.https.HttpsError('invalid-argument', 'Email is required');
  }

  const otp = genOtp();
  const otpHash = hashOtp(otp);
  const now = admin.firestore.Timestamp.now();
  const expiresAt = admin.firestore.Timestamp.fromMillis(Date.now() + 10 * 60 * 1000); 


  await db.collection('users').doc(uid).set({
    emailOtp: {
      otpHash,
      createdAt: now,
      expiresAt,
      attempts: 0,
    }
  }, { merge: true });

  // Send mail
  const mailOptions = {
    from: gmailUser,
    to: email,
    subject: 'Your SaveKey verification code',
    text: `Your verification code is: ${otp}. It expires in 10 minutes.`,
    html: `<p>Your verification code is: <strong>${otp}</strong></p><p>It expires in 10 minutes.</p>`
  };

  try {
    await transporter.sendMail(mailOptions);
    return { success: true, message: 'OTP sent' };
  } catch (err) {
    console.error(err);
    throw new functions.https.HttpsError('internal', 'Failed to send OTP email');
  }
});

// 🔹 Verify OTP Function
exports.verifyEmailOtp = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError('unauthenticated', 'Sign in required');
  }

  const uid = context.auth.uid;
  const otp = data.otp;

  if (!otp || typeof otp !== 'string') {
    throw new functions.https.HttpsError('invalid-argument', 'OTP is required');
  }

  const userRef = db.collection('users').doc(uid);
  const userDoc = await userRef.get();

  if (!userDoc.exists) {
    throw new functions.https.HttpsError('not-found', 'User not found');
  }

  const userData = userDoc.data();
  const emailOtp = userData.emailOtp;

  if (!emailOtp) {
    throw new functions.https.HttpsError('not-found', 'No OTP found');
  }

  // expiry check
  if (emailOtp.expiresAt.toMillis() < Date.now()) {
    await userRef.update({ emailOtp: admin.firestore.FieldValue.delete() });
    throw new functions.https.HttpsError('deadline-exceeded', 'OTP expired');
  }

  // attempt count
  let attempts = (emailOtp.attempts || 0) + 1;
  await userRef.update({ 'emailOtp.attempts': attempts });

  if (attempts > 5) {
    await userRef.update({ emailOtp: admin.firestore.FieldValue.delete() });
    throw new functions.https.HttpsError('resource-exhausted', 'Too many attempts');
  }

  // check hash
  const otpHash = hashOtp(otp);
  if (otpHash !== emailOtp.otpHash) {
    throw new functions.https.HttpsError('invalid-argument', 'Incorrect OTP');
  }

  // ✅ Success
  await userRef.update({
    emailVerified: true,
    emailOtp: admin.firestore.FieldValue.delete(),
  });

  return { success: true, message: 'Email verified' };
});
