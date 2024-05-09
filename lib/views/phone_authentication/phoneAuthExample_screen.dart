import 'package:bloc_tasks/views/phone_authentication/verifyPhone_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PhoneAuthExampleScreen extends StatefulWidget {
  const PhoneAuthExampleScreen({super.key});

  @override
  State<PhoneAuthExampleScreen> createState() => _PhoneAuthExampleScreenState();
}

class _PhoneAuthExampleScreenState extends State<PhoneAuthExampleScreen> {
  TextEditingController phoneController = TextEditingController();
  String code = "+91";
  late String countryCode;

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
              onChanged: (val) {
                countryCode = code + val;
                print(countryCode);
              },
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
            GestureDetector(
              // ------ Phone verification code -----------------
              onTap: () async {
                
                await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential crediential) {},
                    verificationFailed: (FirebaseAuthException ex) {},
                    codeSent:
                        (String verificationId, int? forceResendingToken) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyPhoneNumerScreen(
                                    verificationID: verificationId,
                                  )));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                    phoneNumber: countryCode);
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
                      "Log In",
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
