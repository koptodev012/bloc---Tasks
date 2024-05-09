part of 'auth_cubit_cubit.dart';

abstract class AuthCubitState {}

class AuthCubitInitialState extends AuthCubitState {}

class AuthCubitVerifiedState extends AuthCubitState {}

class AuthCubitLogedInState extends AuthCubitState {
  final User firebasUser;
  AuthCubitLogedInState({required this.firebasUser});
}

class AuthCubitLogedOutState extends AuthCubitState {}

class AuthCubitErrorState extends AuthCubitState {
  late String errorMessage;
  AuthCubitErrorState({required this.errorMessage});
}

class AuthCubitCodeSentState extends AuthCubitState {}

class AuthCubitLoadingState extends AuthCubitState {}
