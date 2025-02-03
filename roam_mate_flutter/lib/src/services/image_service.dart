import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';

class ImageService {
  final ImagePicker imagePicker;
  final Logger log = Logger("Image Service");
  ImageService({required this.imagePicker});
  Future<File> getSingleImage() async {
    try {
      final result = await imagePicker.pickImage(source: ImageSource.gallery);
      if (result != null) {
        return File(result.path);
      } else {
        log.info("Failed to pick Image");
        throw "Failed to pick image";
      }
    } catch (e) {
      log.severe(e);
      throw "Something went wrong while trying to pick image";
    }
  }

  Future<List<File>> getManyImages() async {
    try {
      final result = await imagePicker.pickMultiImage();
      return result.map<File>((image) => File(image.path)).toList();
    } catch (e) {
      log.severe(e);
      throw "Something went wrong while trying to pick image";
    }
  }
}
