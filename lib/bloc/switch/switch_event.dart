part of 'switch_bloc.dart';

sealed class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotificationEvent extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  double value;

  SliderEvent({required this.value});
  @override
  List<Object> get props => [value];
}
