
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/app_image_picker.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  File? image;

  pickImage(ImageSource source) {
    AppImagePicker(source: source).pick(onPick: (File? image) {
      setState(() {
        this.image = image;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick image"),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
                label: Text('Camera'),
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                icon: Icon(Icons.photo),
                label: Text("Gallery"),
              ),
            ],
          ),
          SizedBox(height: 16),
          if (image != null)
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: Image.file(image!),
            ),
          if (image != null)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  this.image = null; // Clear the selected image
                });
              },
              child: Text("Select Another Image"),
            ),
        ],
      ),
    );
  }
}


