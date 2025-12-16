import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:game_grid/model/auth_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static final AuthServices instance = AuthServices._internal();

  AuthServices._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseFunctions _functions = FirebaseFunctions.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<AuthModel?> signUp({
    required String email,
    required String password,
    required String name,
    String? phone,
  }) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      AuthModel user = AuthModel(
        uid: cred.user!.uid,
        email: email,
        name: name,
        phone: phone,
        isEmailVerified: false,
        createdAt: DateTime.now(),
      );

      await _firestore.collection("users").doc(user.uid).set(user.toMap());

      // await sendEmailOtp();

      return user;
    } catch (e) {
      throw ("Signup Error $e");
    }
  }

  Future<String> sendEmailOtp() async {
    try {
      final callable = _functions.httpsCallable('sendEmailOtp');
      final result = await callable.call();
      return result.data['message'] ?? "OTP sent.";
    } on FirebaseFunctionsException catch (e) {
      return "Error: ${e.message}";
    } catch (e) {
      return "Unexpected error: $e";
    }
  }

  Future<String> verifyEmailOtp(String otp) async {
    try {
      final callable = _functions.httpsCallable('verifyEmailOtp');
      final result = await callable.call({'otp': otp});
      if (result.data['success'] == true) {
        return "Email verified successfully!";
      } else {
        return result.data['message'] ?? "Verification failed.";
      }
    } on FirebaseFunctionsException catch (e) {
      return "Error: ${e.message}";
    } catch (e) {
      return "Unexpected error: $e";
    }
  }

  Future<AuthModel?> fetchCurrentUserDetails(String uid) async {
    try {
      final docSnapshot = await _firestore.collection("users").doc(uid).get();

      if (docSnapshot.exists && docSnapshot.data() != null) {
        return AuthModel.fromMap(docSnapshot.data()!);
      } else {
        return null;
      }
    } catch (e) {
      throw ("Error fetching user data: $e");
    }
  }

  Future<AuthModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      DocumentSnapshot snap =
          await _firestore.collection("users").doc(cred.user!.uid).get();

      return AuthModel.fromMap(snap.data() as Map<String, dynamic>);
    } catch (e) {
      throw ("Login Error $e");
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw ("Reset password error: $e");
    }
  }

  Future<AuthModel?> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snap =
          await _firestore.collection("users").doc(user.uid).get();
      return AuthModel.fromMap(snap.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> checkEmailVerified() async {
    User? user = await _auth.currentUser;

    user!.reload();

    if (user.emailVerified) {
      await _firestore
          .collection("users")
          .doc(user.uid)
          .update({"isEmailVerified": true});
    }
  }

  Future<AuthModel?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final firebaseUser = userCredential.user;

      if (firebaseUser == null || firebaseUser.email == null) {
        throw ("Google sign-in failed: missing user information.");
      }

      final email = firebaseUser.email!;
      final userDoc =
          await _firestore.collection("users").doc(firebaseUser.uid).get();

      if (userDoc.exists && userDoc.data() != null) {
        return AuthModel.fromMap(userDoc.data()!);
      }

      final newUser = AuthModel(
        uid: firebaseUser.uid,
        email: email,
        name: firebaseUser.displayName,
        photoUrl: firebaseUser.photoURL,
        phone: firebaseUser.phoneNumber,
        isEmailVerified: firebaseUser.emailVerified,
        createdAt: DateTime.now(),
      );

      await _firestore.collection("users").doc(newUser.uid).set(newUser.toMap());
      return newUser;
    } catch (e) {
      throw ("Google sign-in error: $e");
    }
  }

  Future<AuthModel?> updateProfile({
    required String uid,
    String? name,
    String? email,
    String? phone,
    File? imageFile,
  }) async {
    try {
      String? imageUrl;

      // Upload only if a new image is provided
      if (imageFile != null) {
        if (!await imageFile.exists()) {
          throw ("Selected profile image could not be read.");
        }
        final ref = _storage.ref().child('profile_images').child('$uid.jpg');
        final uploadTask = ref.putFile(imageFile);
        final snapshot = await uploadTask;
        imageUrl = await snapshot.ref.getDownloadURL();
      }

      final Map<String, dynamic> updates = {
        'updatedAt': FieldValue.serverTimestamp(),
      };

      if (name != null && name.trim().isNotEmpty) {
        updates['name'] = name.trim();
      }
      if (email != null && email.trim().isNotEmpty) {
        updates['email'] = email.trim();
      }
      if (phone != null && phone.trim().isNotEmpty) {
        updates['phone'] = phone.trim();
      }
      if (imageUrl != null) {
        updates['photoUrl'] = imageUrl;
      }

      if (email != null &&
          email.trim().isNotEmpty &&
          _auth.currentUser != null &&
          _auth.currentUser!.email != email.trim()) {
        await _auth.currentUser!.verifyBeforeUpdateEmail(email.trim());
      }

      await _firestore.collection("users").doc(uid).update(updates);

      final snap = await _firestore.collection("users").doc(uid).get();
      if (snap.data() == null) return null;
      return AuthModel.fromMap(snap.data()!);
    } catch (e) {
      throw ("Update profile error: $e");
    }
  }
}
