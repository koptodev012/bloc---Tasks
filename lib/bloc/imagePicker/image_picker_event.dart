part of 'image_picker_bloc.dart';

sealed class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class CameraCaptureEvent extends ImagePickerEvent {}

class GallaryImagePickerEvent extends ImagePickerEvent {}
