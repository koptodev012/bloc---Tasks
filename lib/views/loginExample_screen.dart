import 'package:bloc_tasks/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginExampleScreen extends StatefulWidget {
  const LoginExampleScreen({super.key});

  @override
  State<LoginExampleScreen> createState() => _LoginExampleScreenState();
}

class _LoginExampleScreenState extends State<LoginExampleScreen> {
  // -------------------------------
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // -------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "L O G I N",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30.0, bottom: 10, right: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginErrorState) {
                  return Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            TextFormField(
              controller: emailController,
              onChanged: (val) {
                BlocProvider.of<LoginBloc>(context).add(LoginTextChangedEvent(
                    emailValue: emailController.text,
                    passwordValue: passwordController.text));
              },
              decoration: InputDecoration(hintText: "Email Address"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              onChanged: (val) {
                BlocProvider.of<LoginBloc>(context).add(LoginTextChangedEvent(
                    emailValue: emailController.text,
                    passwordValue: passwordController.text));
              },
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                      backgroundColor: Colors.blue,
                    ),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    if (state is LoginValidState) {
                      BlocProvider.of<LoginBloc>(context).add(
                          LoginSubmitedEvent(
                              email: emailController.text,
                              password: passwordController.text));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: (state is LoginValidState)
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
