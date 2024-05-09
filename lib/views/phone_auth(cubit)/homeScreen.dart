import 'package:bloc_tasks/cubit/phone_Auth/auth_cubit_cubit.dart';
import 'package:bloc_tasks/views/phone_auth(cubit)/phoneAuth_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({super.key});

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: BlocConsumer<AuthCubitCubit, AuthCubitState>(
          listener: (context, state) {
            if (state is AuthCubitLogedOutState) {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => PhoneAuthScreen()));
            }
          },
          builder: (context, state) {
            return CupertinoButton(
                child: Text("LogOut"),
                onPressed: () {
                  BlocProvider.of<AuthCubitCubit>(context).logOut();
                });
          },
        ),
      ),
    );
  }
}
