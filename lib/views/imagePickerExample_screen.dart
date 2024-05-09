import 'dart:io';
import 'package:bloc_tasks/blocs/imagePicker/image_picker_bloc.dart';
import 'package:bloc_tasks/blocs/imagePicker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ImagePickerExampleScreen extends StatefulWidget {
  const ImagePickerExampleScreen({super.key});

  @override
  State<ImagePickerExampleScreen> createState() =>
      _ImagePickerExampleScreenState();
}

class _ImagePickerExampleScreenState extends State<ImagePickerExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker Example"),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            state.file == null
                ? Container(
                    color: Colors.green,
                    height: 300,
                  )
                : Container(
                    color: Colors.red,
                    height: 300,
                    child: Image.file(
                      File(state.file!.path.toString()),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: GestureDetector(
                onTap: () {
                  print("tapped.");
                  context.read<ImagePickerBloc>().add(CameraCaptureEvent());
                },
                child: CircleAvatar(
                  child: Icon(Icons.camera_enhance_rounded),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
