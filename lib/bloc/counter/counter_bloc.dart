import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<incrementCounterEvent>(_increment);
    on<decrementCounterEvent>(_decrement);
  }
  // ----------------------------------------------
  // Increment Function
  void _increment(incrementCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(count: state.counter + 1));
  }

  // Decrement Function
  void _decrement(decrementCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(count: state.counter - 1));
  }
  // ----------------------------------------------
}
