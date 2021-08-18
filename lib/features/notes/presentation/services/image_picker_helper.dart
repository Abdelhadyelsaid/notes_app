import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerApi {
  static ImagePicker _picker =  ImagePicker();

  static Future<File> pickImage({ImageSource source = ImageSource.camera}) async {
   
    final XFile? pickedImage = await _picker.pickImage(source: source);

    return File(pickedImage!.path);
  }
}
