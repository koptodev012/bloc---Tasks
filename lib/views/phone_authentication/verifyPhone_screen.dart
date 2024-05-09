import 'package:bloc_tasks/views/phone_authentication/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerifyPhoneNumerScreen extends StatefulWidget {
  String verificationID;
  VerifyPhoneNumerScreen({super.key, required this.verificationID});

  @override
  State<VerifyPhoneNumerScreen> createState() => _VerifyPhoneNumerScreenState();
}

class _VerifyPhoneNumerScreenState extends State<VerifyPhoneNumerScreen> {
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
            GestureDetector(
              // ------ OTP Handler code -----------------
              onTap: () async {
                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.verificationID,
                          smsCode: otpController.text.toString());

                  FirebaseAuth.instance.signInWithCredential(credential).then(
                      (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen())));
                } catch (e) {
                  print(e);
                }
                // ------------------------------------------
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
            )
          ],
        ),
      ),
    );
  }
}
