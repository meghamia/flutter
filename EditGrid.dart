import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';

class PostModel {
  final String imageUrl;
  final String title;
  final String description;
  bool isLiked;

  PostModel(this.imageUrl, this.title, this.description, {this.isLiked = false});
}

class MyApp5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid View Example',
      home: GridConcept2(),
    );
  }
}

class GridConcept2 extends StatefulWidget {
  const GridConcept2({Key? key}) : super(key: key);

  @override
  _GridConceptState createState() => _GridConceptState();
}

class _GridConceptState extends State<GridConcept2> {
  final List<PostModel> posts = [];
  File? _selectedImage;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int? _editingIndex; // Track the index of the item being edited

  void _addPost(String imageUrl, String title, String description) {
    setState(() {
      posts.add(PostModel(imageUrl, title, description));
      _selectedImage = null;
    });
    Navigator.pop(context); // Close the bottom sheet
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState1) {
            Future openGallery(ImageSource source) async {
              final image = await ImagePicker().pickImage(source: source);
              if (image != null) {
                final croppedImage = await ImageCropper().cropImage(
                  sourcePath: image.path,
                  aspectRatioPresets: [
                    CropAspectRatioPreset.square,
                    CropAspectRatioPreset.ratio3x2,
                    CropAspectRatioPreset.original,
                    CropAspectRatioPreset.ratio4x3,
                    CropAspectRatioPreset.ratio16x9,
                    CropAspectRatioPreset.ratio7x5,
                  ],
                  uiSettings: [
                    AndroidUiSettings(
                      toolbarTitle: 'Cropper',
                      toolbarColor: Theme.of(context).colorScheme.primary,
                      toolbarWidgetColor: Theme.of(context).colorScheme.onPrimary,
                      initAspectRatio: CropAspectRatioPreset.original,
                      lockAspectRatio: false,
                      cropFrameColor: Theme.of(context).colorScheme.primary,
                      cropGridColor: Colors.red,
                      showCropGrid: false,
                    ),
                  ],
                );

                if (croppedImage != null) {
                  setState1(() {
                    _selectedImage = File(croppedImage.path);
                  });
                }
              }
              return;
            }

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (_selectedImage != null)
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(_selectedImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  openGallery(ImageSource.gallery);
                                },
                                icon: Icon(Icons.edit), // Use the Edit icon here
                              ),
                            ],
                          ),
                        )
                      else
                        ElevatedButton(
                          onPressed: () {
                            openGallery(ImageSource.gallery);
                          },
                          child: Text('Select Image'),
                        ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: 'Enter Title',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          hintText: 'Enter Description',
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_selectedImage != null &&
                              titleController.text.isNotEmpty &&
                              descriptionController.text.isNotEmpty) {
                            if (_editingIndex != null) {
                              setState(() {
                                posts[_editingIndex!] = PostModel(
                                  _selectedImage!.path,
                                  titleController.text,
                                  descriptionController.text,
                                );
                              });
                              Navigator.pop(context); // Close the bottom sheet
                            } else {
                              // Add a new post
                              _addPost(
                                _selectedImage!.path,
                                titleController.text,
                                descriptionController.text,
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please select an image and fill all fields.',
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                            _editingIndex != null ? 'Update' : 'Add'),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      setState(() {
        _selectedImage = null;
        titleController.clear();
        descriptionController.clear();
        _editingIndex = null; // Clear editing mode
      });
    });
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this post?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                _deletePost(index);
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _deletePost(int index) {
    setState(() {
      posts.removeAt(index);
      _selectedImage = null;
    });
  }

  void _toggleLike(int index) {
    setState(() {
      posts[index].isLiked = !posts[index].isLiked;
    });
  }
  void _editPost(int index) {
    setState(() {
      _editingIndex = index;
      _selectedImage = File(posts[index].imageUrl);
      titleController.text = posts[index].title;
      descriptionController.text = posts[index].description;
    });
    _showBottomSheet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showBottomSheet();
            },
          ),
        ],
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(45),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Column(
                        children: [
                          Image(
                            image: FileImage(File(posts[index].imageUrl)),
                            height: 90,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          Text(posts[index].title),
                          Text(posts[index].description),
                        ],
                      ),
                      Positioned(
                        top: 19,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            _showDeleteConfirmationDialog(index);
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.black,
                            size: 21.0,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            _toggleLike(index);
                          },
                          child: Icon(
                            posts[index].isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: posts[index].isLiked
                                ? Colors.red
                                : Colors.black,
                            size: 19.0,
                          ),
                        ),
                      ),
                      // Add an edit icon for editing the post
                      Positioned(
                        top: 40,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            _editPost(index);
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


