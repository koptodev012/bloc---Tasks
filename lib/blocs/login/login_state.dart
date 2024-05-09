part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitialState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;

  const LoginErrorState({required this.errorMessage});
}

class LoginLoadingState extends LoginState {}
