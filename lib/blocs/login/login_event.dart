part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginTextChangedEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;

  LoginTextChangedEvent(
      {required this.emailValue, required this.passwordValue});
}

class LoginSubmitedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitedEvent({required this.email, required this.password});
}
