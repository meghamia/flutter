import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class MyModel {
  final String imageUrl;
  final String title;
  final String description;
  bool isLiked;

  MyModel(this.imageUrl,
      {this.title = "", this.description = "", this.isLiked = false});
}

void main() {
  runApp(GridImage());
}

class GridImage extends StatefulWidget {
  @override
  GridImageState createState() => GridImageState();
}

class GridImageState extends State<GridImage> {
  final List<MyModel> posts = <MyModel>[];

  File? _selectedImage;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  void liked(int index) {
    setState(() {
      posts[index].isLiked = !posts[index].isLiked;
    });
  }

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet is scrollable
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: _selectedImage != null
                            ? Image.file(_selectedImage!, fit: BoxFit.cover)
                            : Center(
                          child: Text('No Image Selected'),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.camera),
                                    title: Text('Camera'),
                                    onTap: () {
                                      _pickImageFromCamera();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo),
                                    title: Text('Gallery'),
                                    onTap: () {
                                      _pickImageFromGallery();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.add,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Create a new post and add it to the list
                      final newPost = MyModel(
                        _selectedImage != null ? _selectedImage!.path : '',
                        title: _titleController.text,
                        description: _descriptionController.text,
                      );
                      setState(() {
                        posts.add(newPost);
                      });

                      // Clear the input fields and reset the selected image
                      _titleController.clear();
                      _descriptionController.clear();
                      _selectedImage = null;

                      Navigator.pop(context);
                    },
                    child: Text('Add Post'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Grid View',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              _showBottomSheet(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          itemCount: posts.length,
          itemBuilder: (ctx, index) {
            return Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: Image.file(
                            File(posts[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(posts[index].title),
                      Text(posts[index].description),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


