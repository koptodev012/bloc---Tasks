import 'package:bloc_tasks/cubit/phone_Auth/auth_cubit_cubit.dart';
import 'package:bloc_tasks/views/phone_auth(cubit)/homeScreen.dart';
import 'package:bloc_tasks/views/phone_auth(cubit)/phoneAuth_screen.dart';
import 'package:bloc_tasks/views/phone_auth(cubit)/verifyPhone_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String home_s = "/HomeScr";
String phone_s = "/PhoneAuthScr";
String verifyphone_s = "/VerifyPhoneScr";

class Routes {
  static Route? myRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/HomeScr":
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => AuthCubitCubit(),
                  child: HomeScr(),
                )));
      case "/PhoneAuthScr":
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => AuthCubitCubit(),
                  child: PhoneAuthScreen(),
                )));
      case "/VerifyPhoneScr":
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => AuthCubitCubit(),
                  child: VerifyPhone(),
                )));

      default:
        return null;
    }
  }
}
