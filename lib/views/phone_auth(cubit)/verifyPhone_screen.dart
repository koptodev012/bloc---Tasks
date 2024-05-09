import 'package:bloc_tasks/cubit/phone_Auth/auth_cubit_cubit.dart';
import 'package:bloc_tasks/views/phone_auth(cubit)/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({super.key});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verify Phone Number",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: otpController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                counterText: "",
                hintText: "6 Digit OTP",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthCubitCubit, AuthCubitState>(
              listener: (context, state) {
                if (state is AuthCubitLogedInState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScr()));
                } else if (state is AuthCubitErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                    duration: Duration(milliseconds: 2000),
                  ));
                }
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
                    BlocProvider.of<AuthCubitCubit>(context)
                        .verifyOTP(otpController.text);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Verify",
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
