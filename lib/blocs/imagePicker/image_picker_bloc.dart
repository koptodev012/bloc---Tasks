import 'package:bloc/bloc.dart';
import 'package:bloc_tasks/utils/imagePicker_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_tasks/blocs/imagePicker/image_picker_state.dart';
import 'package:image_picker/image_picker.dart';
part 'image_picker_event.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils; // function calling

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    on<CameraCaptureEvent>(_cameraCapture);
  }

  // Camera Capture Function
  void _cameraCapture(
      CameraCaptureEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(tempFile:file));
  }
}
