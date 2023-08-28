part of 'sign_up_bloc.dart';

class SignUpState {
  final String username;
  final String email;
  final String password;
  // final String confirmPassword;
  SignUpState({
    this.username = "",
    this.email = "",
    this.password = "",
    // this.confirmPassword = "",
  });

  SignUpState copyWith({
    String? username,
    String? email,
    String? password,
    // String? confirmPassword,
  }) {
    return SignUpState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      // confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
