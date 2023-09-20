import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class PostModel {
  final String imageUrl;
  final String title;
  final String description;

  PostModel(this.imageUrl, this.title, this.description);
}

class MyApp extends StatelessWidget {
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
  String title = '';
  String description = '';

  void _addPost(String imageUrl, String title, String description) {
    setState(() {
      posts.add(PostModel(imageUrl, title, description));
      _selectedImage = null; // Clear selected image after adding a post
    });
    Navigator.pop(context); // Close the bottom sheet
  }

  Future<void> _openGallery() async {
    final picker = ImagePicker();

    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _selectedImage = File(pickedImage.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  void _showBottomSheet() {
    String tempTitle = '';
    String tempDescription = '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView( // Wrap with SingleChildScrollView
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                        )
                      else
                        ElevatedButton(
                          onPressed: () {
                            _openGallery();
                          },
                          child: Text('Select Image'),
                        ),
                      SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value) {
                          tempTitle = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Title',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value) {
                          tempDescription = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Description',
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_selectedImage != null &&
                              tempTitle.isNotEmpty &&
                              tempDescription.isNotEmpty) {
                            _addPost(
                                _selectedImage!.path, tempTitle, tempDescription);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Please fill in all fields and select an image.'),
                              ),
                            );
                          }
                        },
                        child: Text('Add'),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    ).whenComplete(() {
      // Reset the selected image and text fields when the bottom sheet closes
      setState(() {
        _selectedImage = null;
        title = '';
        description = '';
      });
    });
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
      body: SingleChildScrollView( // Wrap the GridView with SingleChildScrollView
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: posts.length,
          shrinkWrap: true, // Add this line
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  Image(
                    image: FileImage(File(posts[index].imageUrl)),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Text(posts[index].title),
                  Text(posts[index].description),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
