// import 'dart:typed_data';

// import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

 pickImage(ImageSource source) async {
  XFile? file = await _picker.pickImage(source: source);
  if (file != null) {
    return file.readAsBytes();
  }
}
