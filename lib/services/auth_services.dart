import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:game_grid/model/auth_model.dart';

class AuthServices {

  static final AuthServices instance = AuthServices._internal();

  AuthServices._internal();


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

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



  Future<AuthModel?> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snap =
          await _firestore.collection("users").doc(user.uid).get();
      return AuthModel.fromMap(snap.data() as Map<String, dynamic>);
    }
    return null;
  }


  Future<void> checkEmailVerified() async{

    User? user = await _auth.currentUser;
    
    user!.reload();

    if(user.emailVerified){
      await _firestore.collection("users").doc(user.uid).update({
        "isEmailVerified" : true
      });
    }
  
  }

}