import 'package:bloc_tasks/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterExampleScreen extends StatefulWidget {
  const CounterExampleScreen({super.key});

  @override
  State<CounterExampleScreen> createState() => _CounterExampleScreenState();
}

class _CounterExampleScreenState extends State<CounterExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Example"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  context.read<CounterBloc>().add(decrementCounterEvent());
                },
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                  size: 40,
                )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.counter.toString(),
                    style: TextStyle(fontSize: 30),
                  );
                },
              ),
            ),
            IconButton(
                onPressed: () {
                  context.read<CounterBloc>().add(incrementCounterEvent());
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.green,
                  size: 40,
                )),
          ],
        ),
      ),
    );
  }
}
