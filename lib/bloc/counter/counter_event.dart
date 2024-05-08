part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class incrementCounterEvent extends CounterEvent {
  
}
class decrementCounterEvent extends CounterEvent {
  
}


