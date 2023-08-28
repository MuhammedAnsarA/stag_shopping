import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<UsernameEvent>(_usernameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    // on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }

  FutureOr<void> _usernameEvent(
      UsernameEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(username: event.username));
  }

  FutureOr<void> _emailEvent(EmailEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _passwordEvent(
      PasswordEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.password));
  }

  // FutureOr<void> _confirmPasswordEvent(
  //     ConfirmPasswordEvent event, Emitter<SignUpState> emit) {
  //   emit(state.copyWith(confirmPassword: event.confirmPassword));
  // }
}
