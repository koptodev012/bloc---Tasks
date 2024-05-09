import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  AuthCubitCubit() : super(AuthCubitInitialState()) {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      // LoggedIn
      emit(AuthCubitLogedInState(firebasUser: currentUser));
    } else {
      // LoggedOut
      emit(AuthCubitLogedOutState());
    }
  }

  // ----------------- Functions -----------------------

// sendOTP
  void sendOTP(String phoneNumber) async {
    emit(AuthCubitLoadingState());
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        emit(AuthCubitCodeSentState());
      },
      verificationCompleted: (phoneAuthCredential) {
        loginWithPhone(phoneAuthCredential);
      },
      verificationFailed: (error) {
        emit(AuthCubitErrorState(errorMessage: error.message.toString()));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
  }

// verifyOTP
  void verifyOTP(String otp) async {
    emit(AuthCubitLoadingState());

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);

    loginWithPhone(credential);
  }

// loginWithPhone
  void loginWithPhone(PhoneAuthCredential credential) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        emit(AuthCubitLogedInState(firebasUser: userCredential.user!));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthCubitErrorState(errorMessage: e.message.toString()));
    }
  }

// logOut
  void logOut() async {
    await _auth.signOut();
    emit(AuthCubitLogedOutState());
  }
  // ===================================================
}
