// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:stag_shopping/utils/constants/toast_info.dart';

import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/resources/global.dart';

class GoogleController {
  final BuildContext context;
  GoogleController({
    required this.context,
  });
  // Future<void> signInWithGoogle() async {
  //   try {
  //     final navigator = Navigator.of(context);
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.accessToken,
  //     );
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //     Global.storageService
  //         .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
  //     navigator.pushNamedAndRemoveUntil("/homepage", (route) => false);
  //   } catch (e) {
  //     toastInfo(msg: e.toString());
  //   }
  // }

  Future<void> signOut() async {
    try {
      final navigator = Navigator.of(context);
      await FirebaseAuth.instance.signOut();
      Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
      navigator.pushNamedAndRemoveUntil("/login", (route) => false);
    } catch (e) {
      toastInfo(msg: e.toString());
    }
  }
}
