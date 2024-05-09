import 'package:bloc_tasks/blocs/counter/counter_bloc.dart';
import 'package:bloc_tasks/blocs/imagePicker/image_picker_bloc.dart';
import 'package:bloc_tasks/blocs/login/login_bloc.dart';
import 'package:bloc_tasks/blocs/switch/switch_bloc.dart';
import 'package:bloc_tasks/utils/imagePicker_utils.dart';

import 'package:bloc_tasks/views/loginExample_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(), // Bloc 1
        ),
        BlocProvider(
          create: (context) => SwitchBloc(), // Bloc 2
        ),
        BlocProvider(
          create: (context) => ImagePickerBloc(ImagePickerUtils()), // Bloc 3
        ),
         BlocProvider(
          create: (context) => LoginBloc(), // Bloc 4
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc - Tasks',
        home: LoginExampleScreen(),
      ),
    );
  }
}
