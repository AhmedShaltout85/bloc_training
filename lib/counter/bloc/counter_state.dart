part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int counterValue;
  const CounterState({required this.counterValue});
}

final class CounterInitialState extends CounterState {
  const CounterInitialState({required super.counterValue});
}

final class CounterIncrementState extends CounterState {
  const CounterIncrementState({required super.counterValue});
}

final class CounterDecrementState extends CounterState {
  const CounterDecrementState({required super.counterValue});
}

final class CounterErrorState extends CounterState {
  final String errorMessage;
  const CounterErrorState({required super.counterValue, required this.errorMessage});
}