import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotificationEvent>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  // Switch Function
  void _enableOrDisableNotification(
      EnableOrDisableNotificationEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(tempSwitch: !state.isSwitch));
  }

  // Slider Function
  void _slider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(tempSlider: event.value));
  }
}
