import 'package:bloc_tasks/cubit/phone_Auth/auth_cubit_cubit.dart';
import 'package:bloc_tasks/routes.dart';
import 'package:bloc_tasks/views/phone_auth(cubit)/verifyPhone_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login with Phone",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: phoneController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                counterText: "",
                hintText: "Phone Number",
                prefixIcon: Icon(Icons.phone),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              maxLength: 10,
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthCubitCubit, AuthCubitState>(
              listener: (context, state) {
                Navigator.pushNamed(context, verifyphone_s);
              },
              builder: (context, state) {
                if (state is AuthCubitLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                      backgroundColor: Colors.blue,
                    ),
                  );
                }

                return GestureDetector(
                  onTap: () {
                    String phoneNum = "+91" + phoneController.text;
                    BlocProvider.of<AuthCubitCubit>(context).sendOTP(phoneNum);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 20, color: Colors.white),
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
