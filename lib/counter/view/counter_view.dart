import 'package:bloc_training/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Counter Screen with BLoC',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                context.read<CounterBloc>().add(IncrementCounterEvent());
              },
              child: const Text(
                'PLUS',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  );
                } else if (state is CounterInitialState) {
                  return CounterTextRefactor(
                    counterValue: state.counterValue,
                    textColor: Colors.black,
                  );
                } else if (state is CounterDecrementState) {
                  return CounterTextRefactor(
                      counterValue: state.counterValue, textColor: Colors.orange);
                } else if (state is CounterIncrementState) {
                  return CounterTextRefactor(
                      counterValue: state.counterValue,
                      textColor: Colors.green);
                } else {
                  return CounterTextRefactor(
                      counterValue: state.counterValue,
                      textColor: Colors.black);
                }
              },
            ),
            MaterialButton(
              onPressed: () {
                context.read<CounterBloc>().add(DecrementCounterEvent());
              },
              child: const Text(
                'MINUS',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterTextRefactor extends StatelessWidget {
  final int counterValue;
  final Color textColor;
  const CounterTextRefactor({
    super.key,
    required this.counterValue,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$counterValue',
      style: TextStyle(
          fontSize: 70, fontWeight: FontWeight.bold, color: textColor),
    );
  }
}
