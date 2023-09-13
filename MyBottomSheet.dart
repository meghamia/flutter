import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: ImageSelectionScreen(),
  ));
}

class ImageSelectionScreen extends StatefulWidget {
  @override
  _ImageSelectionScreenState createState() => _ImageSelectionScreenState();
}

class _ImageSelectionScreenState extends State<ImageSelectionScreen> {
  List<SelectedImage> selectedImages = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void _showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a Photo'),
                onTap: () async {
                  final image = await ImagePicker().getImage(source: ImageSource.camera);
                  if (image != null) {
                    _handleSelectedImage(
                      File(image.path),
                      titleController.text,
                      descriptionController.text,
                    );
                  }
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Choose from Gallery'),
                onTap: () async {
                  final image = await ImagePicker().getImage(source: ImageSource.gallery);
                  if (image != null) {
                    _handleSelectedImage(
                      File(image.path),
                      titleController.text,
                      descriptionController.text,
                    );
                  }
                  Navigator.of(context).pop();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleSelectedImage(File imageFile, String title, String description) {
    setState(() {
      selectedImages.add(
        SelectedImage(
          imageFile: imageFile,
          title: title,
          description: description,
        ),
      );
    });
    // Clear the text input fields after selecting an image.
    titleController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Selection'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              _showImagePickerBottomSheet(context);
            },
            child: Text('Select Images'),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: selectedImages.map((image) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 3 - 16,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.file(
                          image.imageFile,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 100.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(image.title),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(image.description),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}

class SelectedImage {
  final File imageFile;
  final String title;
  final String description;

  SelectedImage({
    required this.imageFile,
    required this.title,
    required this.description,
  });
}