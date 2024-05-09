import 'package:bloc_tasks/blocs/switch/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Example"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 20),
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return Switch(
                        value: state.isSwitch,
                        onChanged: (val) {
                          context
                              .read<SwitchBloc>()
                              .add(EnableOrDisableNotificationEvent());
                          print("Switch..");
                        });
                  },
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.sliderValue),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Slider(
                    value: state.sliderValue,
                    onChanged: (val) {
                      context.read<SwitchBloc>().add(SliderEvent(value: val));
                      print("Slider..");
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
