import 'package:dio/dio.dart';
import 'package:final1/posts/postList_text.dart';
import 'package:final1/posts/post_model.dart';
import 'package:flutter/material.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  ScrollController _scrollController = ScrollController();
  final Dio dio = Dio();
  List<Posts> posts = [];
  int totalPosts = 1000;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPosts();
    _scrollController.addListener(loadMorePosts);
  }

  void loadMorePosts() async {
    if (_scrollController.offset ==
        _scrollController.position.maxScrollExtent) {
      getPosts();
    }
  }

  void getPosts() async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await dio.get("https://dummyjson.com/posts");
      final List data = response.data['posts'];
      final List<Posts> newPost = data.map((p) => Posts.fromJson(p)).toList();
      setState(() {
        isLoading = false;
        totalPosts = response.data['total'];
        posts.addAll(newPost);
      });
    } catch (e) {
      print("No availabel post");
    }
  }

  void updatePost(Posts updatedPost) {
    setState(() {
      int index = posts.indexWhere((post) => post.id == updatedPost.id);
      if (index != -1) {
        posts[index] = updatedPost;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ListTile(
                      leading: Text(post.id.toString()),
                      title: Text(post.userId.toString()),
                      subtitle: Text(post.title!),
                      trailing: Text(post.views.toString()),
                      onTap: () async{
                        final updatedPost =await
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostText(
                                      post: post,
                                    )));
                        if(updatedPost != null){
                          updatePost(updatedPost);
                        }
                      },
                    );
                  })),
        ],
      ),
    );
  }
}


