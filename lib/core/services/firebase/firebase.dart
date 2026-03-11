// ignore_for_file: avoid_print

import 'package:bazar/core/services/Sharedprefs/sharedprefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      await SharedPrefs.setsignIn();

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      await credential.user!.updateDisplayName(name);

      await SharedPrefs.setsignIn();

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await SharedPrefs.logout();
  }

  // Future<void> resetPassword({required String email}) async {
  //   return await _auth.sendPasswordResetEmail(email: email);
  // }

  Future<String?> resetPassword({
    required String email,

  }) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email.trim(),
      );


      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }



  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
