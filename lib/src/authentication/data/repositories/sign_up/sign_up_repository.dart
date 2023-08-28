import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stag_shopping/src/authentication/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:stag_shopping/utils/constants/toast_info.dart';

class SignUpController {
  final BuildContext context;
  SignUpController({
    required this.context,
  });
  Future<void> handleSignUp() async {
    final state = context.read<SignUpBloc>().state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    // String confirmPassword = state.confirmPassword;
    if (username.isEmpty) {
      toastInfo(msg: "Username can't be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can't be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can't be empty");
      return;
    }
    // if (confirmPassword.isEmpty) {
    //   toastInfo(msg: "Confirm Password can't be empty");
    //   return;
    // }
    try {
      final navigator = Navigator.of(context);
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        toastInfo(
            msg:
                "Email has been sent to your registered email. To activate it please check your inbox and click on link");
        navigator.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        toastInfo(
            msg: "already exists an account with the given email address");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "email address is not valid");
      } else if (e.code == "weak-password") {
        toastInfo(msg: "password is not strong enough");
      }
    }
  }
}
