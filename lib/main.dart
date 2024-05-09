import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:firebase_core/firebase_core.dart'; // New
import 'package:bloc_tasks/blocs/counter/counter_bloc.dart';
import 'package:bloc_tasks/blocs/imagePicker/image_picker_bloc.dart';
import 'package:bloc_tasks/blocs/login/login_bloc.dart';
import 'package:bloc_tasks/blocs/switch/switch_bloc.dart';
import 'package:bloc_tasks/utils/imagePicker_utils.dart';
import 'package:bloc_tasks/views/phone_authentication/phoneAuthExample_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey:
              "AIzaSyCoyvc0Oq5NNK-GZB6KldVNwIJzWcMWEtI", // google-services.json
          appId:
              "1:363670364151:android:8040a03949846e9df698f2", // firebase --> project setting --> general
          messagingSenderId:
              "363670364151", // firebase --> project setting --> Cloud messaging
          projectId:
              "phone-authentication-96cee", // firebase --> project setting --> general
          storageBucket: "phone-authentication-96cee.appspot.com", // google-services.json
        ))
      : await Firebase.initializeApp();

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
        home: PhoneAuthExampleScreen(),
      ),
    );
  }
}
