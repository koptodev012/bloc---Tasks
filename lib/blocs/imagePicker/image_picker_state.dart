import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerState extends Equatable {
  XFile? file;
  ImagePickerState({this.file});

  ImagePickerState copyWith({XFile? tempFile}) {
    return ImagePickerState(file: tempFile ?? file);
  }

  @override
  List<Object?> get props => [file];
}
