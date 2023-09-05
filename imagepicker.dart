/*import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: ImagePickerWidget(),
  ));
}

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  Future<void> _getImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    } catch (e) {
      print("Error picking image from camera: $e");
    }
  }

  Future<void> _getImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    } catch (e) {
      print("Error picking image from gallery: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          children: [
            if (_image != null)
              Image.file(
                _image!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _getImageFromCamera,
              child: Text("Pick Image from Camera"),
            ),
            ElevatedButton(
              onPressed: _getImageFromGallery,
              child: Text("Pick Image from Gallery"),
            ),
          ],
        ),
      ),
    );
  }
}*/


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: ImagePickerWidget(),
  ));
}

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  Future<void> _getImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        File? croppedFile = await _cropImage(File(image.path));
        if (croppedFile != null) {
          setState(() {
            _image = croppedFile;
          });
        }
      }
    } catch (e) {
      print("Error picking image from camera: $e");
    }
  }

  Future<void> _getImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        File? croppedFile = await _cropImage(File(image.path));
        if (croppedFile != null) {
          setState(() {
            _image = croppedFile;
          });
        }
      }
    } catch (e) {
      print("Error picking image from gallery: $e");
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    File? croppedFile = (await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1), // You can adjust the aspect ratio as needed
      maxWidth: 800, // Maximum width of the cropped image
      maxHeight: 800, // Maximum height of the cropped image
    )) as File?;
    return croppedFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          children: [
            if (_image != null)
              Image.file(
                _image!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _getImageFromCamera,
              child: Text("Pick Image from Camera"),
            ),
            ElevatedButton(
              onPressed: _getImageFromGallery,
              child: Text("Pick Image from Gallery"),
            ),
          ],
        ),
      ),
    );
  }
}
