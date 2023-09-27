import 'package:counter_app_initial_proj/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/dart_imports.dart';

class CounterAppMainScreen extends StatelessWidget {
  const CounterAppMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('I got rebuilt!');
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state is IncrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Successfully Increased!'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              } else if (state is DecrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Succcessfully Decreased!'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Center(
                child: Text(
                  'Counter Value is ${state.countValue}!',
                  style: const TextStyle(fontSize: 20),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterDecrementEvent()),
                child: const Text(
                  'Decrease!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterIncrementEvent()),
                child: const Text(
                  'Increase',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
