import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yalla/blocks/model/user_auth_model.dart';
import 'package:yalla/main.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

 static  UserAuthModel? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return UserAuthModel(user.uid, user.phoneNumber);
  }

  Stream<UserAuthModel?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserAuthModel?> verifyOTP(BuildContext context, _verificationID,String smsCode) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ));
    final credential = PhoneAuthProvider.credential(
        verificationId: _verificationID, smsCode: smsCode);
    await _firebaseAuth.signInWithCredential(credential).then((value) async {
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: Text('Login successful for id:  ${_firebaseAuth.currentUser!.uid}')));
        Navigator.pushNamed(context, '/dash_board', arguments: _firebaseAuth.currentUser!.uid);
    }).onError((error, stackTrace) {
      print(error);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    return _userFromFirebase(_firebaseAuth.currentUser);
  }


  Future<UserAuthModel?> createUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    final credential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pushNamed(context, '/bottom_navigation');
    }).onError((error, stackTrace) {
      print(error);
    });
    return _userFromFirebase(credential.user!);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
