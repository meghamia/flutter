import 'package:flutter/material.dart';

class Post {
  final String id;
  final ImageProvider<Object> imageUrl;
  final String title;
  final String description;
  Set<String> likedBy;

  Post({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    Set<String>? likedBy,
  }) : likedBy = likedBy ?? {};
}

class PostModel extends StatefulWidget {
  @override
  _PostModelState createState() => _PostModelState();
}

class _PostModelState extends State<PostModel> {
  final List<Post> posts = [
    Post(
      id: '1',
      imageUrl: NetworkImage(
          'https://cdn.pixabay.com/photo/2023/09/01/05/12/moon-8226250_1280.jpg'),
      title: 'Post 1',
      description: 'This is the first post.',
    ),
    Post(
      id: '2',
      imageUrl: NetworkImage(
          'https://cdn.pixabay.com/photo/2023/09/01/05/12/moon-8226250_1280.jpg'),
      title: 'Post 2',
      description: 'This is the second post.',
    ),
    Post(
      id: '3',
      imageUrl: NetworkImage(
          'https://cdn.pixabay.com/photo/2023/09/01/05/12/moon-8226250_1280.jpg'),
      title: 'Post 3',
      description: 'This is the third post.',
    ),
    Post(
      id: '4',
      imageUrl: NetworkImage(
          'https://cdn.pixabay.com/photo/2023/09/01/05/12/moon-8226250_1280.jpg'),
      title: 'Post 4',
      description: 'This is the fourth post.',
    ),
    Post(
      id: '5',
      imageUrl: NetworkImage(
          'https://cdn.pixabay.com/photo/2023/09/01/05/12/moon-8226250_1280.jpg'),
      title: 'Post 5',
      description: 'This is the fifith post.',
    ),
    Post(
      id: '6',
      imageUrl: NetworkImage(
          'https://cdn.pixabay.com/photo/2023/09/01/05/12/moon-8226250_1280.jpg'),
      title: 'Post 6',
      description: 'This is the sixth post.',
    ),
    // ... (add more posts here)
  ];

  ImageProvider<Object>? _selectedImage;

  void _showModalBottomSheet(BuildContext context, Post post) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0, // Adjust this height as needed
                child: Image(
                  image: post.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                post.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                post.description,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final gridItemWidth = screenWidth / 2 - 16;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _showModalBottomSheet(
                    context,
                    Post(
                      id: 'new',
                      imageUrl: NetworkImage(
                          'https://cdn.pixabay.com/photo/2023/09/01/05/12/moon-8226250_1280.jpg'),
                      title: 'New Post',
                      description: 'This is a new post.',
                    ));
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: gridItemWidth / 250,
                ),
                itemCount: posts.length,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      _showModalBottomSheet(context, posts[index]);
                    },
                    child: buildPostCard(posts[index], gridItemWidth),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPostCard(Post post, double gridItemWidth) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: gridItemWidth,
            height: gridItemWidth,
            child: Image(
              image: post.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: post.likedBy.contains('user_id_here')
                      ? Colors.deepPurpleAccent
                      : null,
                ),
                onPressed: () {
                  setState(() {
                    if (post.likedBy.contains('user_id_here')) {
                      post.likedBy.remove('user_id_here');
                    } else {
                      post.likedBy.add('user_id_here');
                    }
                  });
                },
              ),
              Text('${post.likedBy.length} Likes'),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  post.description,
                  style: TextStyle(decoration: TextDecoration.none),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(PostModel());
}

