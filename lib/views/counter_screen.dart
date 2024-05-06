import 'package:bloc_tasks/data/my_data.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Example - Bloc"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: () {}, child: Icon(Icons.add)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  counterValue,
                  style: TextStyle(color: Colors.red, fontSize: 35),
                ),
              ),
              OutlinedButton(onPressed: () {}, child: Icon(Icons.remove)),
            ],
          )
        ],
      ),
    );
  }
}
