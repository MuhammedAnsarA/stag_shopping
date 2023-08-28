import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  FutureOr<void> _emailEvent(EmailEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _passwordEvent(PasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
