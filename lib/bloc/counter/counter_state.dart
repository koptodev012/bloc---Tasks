part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({this.counter = 0});

  CounterState copyWith({int? count}) {
    return CounterState(counter: count ?? counter);
  }

  @override
  List<Object> get props => [counter];
}
