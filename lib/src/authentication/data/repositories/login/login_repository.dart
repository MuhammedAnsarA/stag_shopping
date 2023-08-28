import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stag_shopping/src/authentication/presentation/blocs/login/login_bloc.dart';
import 'package:stag_shopping/utils/constants/toast_info.dart';

import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/resources/global.dart';

class LoginController {
  final BuildContext context;
  LoginController({
    required this.context,
  });
  Future<void> handleLogin() async {
    final state = context.read<LoginBloc>().state;
    String email = state.email;
    String password = state.password;
    if (email.isEmpty) {
      toastInfo(msg: "Email can't be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can't be empty");
      return;
    }
    try {
      final navigator = Navigator.of(context);
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user == null) {
        toastInfo(msg: "User does not exist");
        return;
      }
      if (!credential.user!.emailVerified) {
        toastInfo(msg: "Please verify email");
        return;
      }

      final user = credential.user;
      if (user != null) {
        Global.storageService
            .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
        navigator.pushNamedAndRemoveUntil("/homepage", (route) => false);
      } else {
        toastInfo(msg: "Currently you are not user");
        return;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        toastInfo(msg: "Email address is not valid");
      } else if (e.code == "user-not-found") {
        toastInfo(msg: "no user corresponding to the given email");
      } else if (e.code == "wrong-password") {
        toastInfo(msg: "password is invalid for the given email");
      }
    }
  }
}
