import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasky_app/constants/constant.dart';

abstract class FireBaseUser {
  static Future<String?> loginFireBase(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log(userCredential.user?.uid ?? 'null');
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == Constant.userNotFound) {
        log('No user found for that email.');
      } else if (e.code == Constant.wrongPassword) {
        log('Wrong password provided for that user.');
      }
    }
    return null;
  }

  static Future<UserCredential?> registerFireBase(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == Constant.weakPassword) {
        log('The password provided is too weak.');
      } else if (e.code == Constant.emailAlreadyInUse) {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
