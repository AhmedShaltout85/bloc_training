import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitialState(counterValue: 0)) {
    on<CounterEvent>((event, emit) {
      if (event is IncrementCounterEvent) {
        emit(CounterIncrementState(counterValue: state.counterValue + 1));
      } else if (event is DecrementCounterEvent) {
        if(state.counterValue < 1)return;
        emit(CounterDecrementState(counterValue: state.counterValue - 1));
      } else if (event is ResetCounterEvent) {
        emit(const CounterInitialState(counterValue: 0));
      }else{
        emit(CounterErrorState(counterValue: state.counterValue, errorMessage: "Error"));
      }
    });
  }
}
