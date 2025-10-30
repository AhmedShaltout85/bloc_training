part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}
final class IncrementCounterEvent extends CounterEvent {}
final class DecrementCounterEvent extends CounterEvent {}
final class ResetCounterEvent extends CounterEvent {}
final class ErrorCounterEvent extends CounterEvent {}

