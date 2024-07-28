import 'package:final1/posts/post_list.dart';
import 'package:final1/posts/post_model.dart';
import 'package:flutter/material.dart';

class PostText extends StatefulWidget {
  const PostText({Key? key, required this.post}) : super(key: key);

  final Posts post;

  @override
  State<PostText> createState() => _PostTextState();
}

class _PostTextState extends State<PostText> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController(text: widget.post.title);
    bodyController = TextEditingController(text: widget.post.body);
    userIdController = TextEditingController(text: widget.post.userId?.toString()?? '');
    idController = TextEditingController(text: widget.post.id.toString());

  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    bodyController.dispose();
    userIdController.dispose();
    idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ddhhd"),
      ),
      body: Center(
        child: Container(
          width: 310,
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: InputDecoration(hintText: "Id:${widget.post.id}"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: titleController ,
                decoration:
                    InputDecoration(hintText: "title:${widget.post.title}"),
              ),
              TextField(
                controller: userIdController,
                decoration:
                InputDecoration(hintText: "title:${widget.post.userId}"),
              ),


              ElevatedButton(
                  onPressed: () {
                    widget.post.id = int.tryParse(idController.text);
                   widget.post.title = titleController.text;
                   widget.post.body = bodyController.text;
                   widget.post.userId = int.tryParse(userIdController.text);

                   Navigator.pop(context,widget.post);
                  },
                  child: Text("update"))
            ],
          ),
        ),
      ),
    );
  }
}

