// ignore_for_file: avoid_print

import 'package:bazar/core/services/Sharedprefs/sharedprefs.dart';
import 'package:bazar/features/Atef/Success/Success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      await SharedPrefs.setsignIn();

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => Success()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No user found");
      }

      if (e.code == 'wrong-password') {
        print("Wrong password");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      await SharedPrefs.setsignIn();

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => Success()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("Password is weak");
      }

      if (e.code == 'email-already-in-use') {
        print("Email already exists");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> resetPassword({
    required String email,
    required String password,
  }) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }
}
