import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    // LoginTextChangedEvent
    on<LoginTextChangedEvent>((event, emit) {
      if (event.emailValue.isEmpty &&
          EmailValidator.validate(event.emailValue) == false) {
        emit(LoginErrorState(
            errorMessage: "Please Enter a valid email address"));
      } else if (event.passwordValue.length <= 7) {
        emit(LoginErrorState(errorMessage: "Please enter a valid password"));
      } else {
        emit(LoginValidState());
      }
    });

// LoginSubmitedEvent
    on<LoginSubmitedEvent>((event, emit) {
      emit(LoginLoadingState());
    });
  }
}
