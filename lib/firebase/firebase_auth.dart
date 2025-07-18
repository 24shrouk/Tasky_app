import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasky_app/constants/constant.dart';
import 'package:tasky_app/core/utils/app_shared_pref.dart';
import 'package:tasky_app/firebase/firebase_database.dart';
import 'package:tasky_app/models/user_model.dart';

abstract class FireBaseUser {
  static Future<String?> loginFireBase(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      AppSharedPref.saveData('id', userCredential.user?.uid);
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
    String userName,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FireBaseDatabase.createUser(
        UserModel(
          id: credential.user?.uid,
          email: email,
          name: userName,
          password: password,
        ),
      );
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
