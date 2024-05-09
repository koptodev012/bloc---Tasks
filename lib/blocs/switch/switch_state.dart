part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  bool isSwitch;
  double sliderValue;

  SwitchState({this.isSwitch = false, this.sliderValue = 1.0});

  SwitchState copyWith({bool? tempSwitch, double? tempSlider}) {
    return SwitchState(
        isSwitch: tempSwitch ?? isSwitch,
        sliderValue: tempSlider ?? sliderValue);
  }

  @override
  List<Object> get props => [isSwitch,sliderValue];
}
