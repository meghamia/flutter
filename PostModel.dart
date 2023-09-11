/*import 'package:flutter/material.dart';

class Post {
  final String id;
  final ImageProvider<Object> imageUrl;
  final String title;
  final String description;
  bool isLiked;

  Post({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.isLiked = false,
  });
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
          'https://cdn.pixabay.com/photo/2023/09/01/05/12/moon-8226250_1280.jpg'), // Updated image URL
      title: 'Post 1',
      description: 'This is the first post.',
    ),
    Post(
      id: '2',
      imageUrl: NetworkImage(
          'https://cdn.pixabay.com/photo/2023/09/01/05/12/moon-8226250_1280.jpg'), // Updated image URL
      title: 'Post 2',
      description: 'This is the second post.',
    ),
    Post(
      id: '3',
      imageUrl: NetworkImage(
          'https://cdn.pixabay.com/photo/2023/09/01/05/12/moon-8226250_1280.jpg'), // Updated image URL
      title: 'Post 3',
      description: 'This is the third post.',
    ),
    Post(
      id: '4',
      imageUrl: NetworkImage(
          'https://cdn.pixabay.com/photo/2023/09/01/05/12/moon-8226250_1280.jpg'), // Updated image URL
      title: 'Post 4',
      description: 'This is the fourth post.',
    ),
    // Add more posts here
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final gridItemWidth = screenWidth / 2 - 16; // Adjust spacing as needed

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: gridItemWidth / 250, // Adjust 250 as needed for the aspect ratio
          ),
          itemCount: posts.length,
          itemBuilder: (ctx, index) {
            return buildPostCard(posts[index], gridItemWidth);
          },
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
          IconButton(
            icon: Icon(
              post.isLiked ? Icons.favorite : Icons.favorite_border,
              color: post.isLiked ? Colors.deepPurpleAccent : null,
            ),
            onPressed: () {
              // Toggle the like status
              setState(() {
                post.isLiked = !post.isLiked;
              });
            },
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
*/

import 'package:flutter/material.dart';

class Post {
  final String id;
  final ImageProvider<Object> imageUrl;
  final String title;
  final String description;
  Set<String> likedBy; // Use a Set to track users who have liked the post

  Post({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    Set<String>? likedBy, // Initialize likedBy as an empty Set
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
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final gridItemWidth = screenWidth / 2 - 16;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: gridItemWidth / 250,
          ),
          itemCount: posts.length,
          itemBuilder: (ctx, index) {
            return buildPostCard(posts[index], gridItemWidth);
          },
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
                  color: post.likedBy.contains('user_id_here') // Check if the user has liked this post
                      ? Colors.deepPurpleAccent
                      : null,
                ),
                onPressed: () {
                  // Toggle the like status
                  setState(() {
                    if (post.likedBy.contains('user_id_here')) {
                      post.likedBy.remove('user_id_here'); // Unlike the post
                    } else {
                      post.likedBy.add('user_id_here'); // Like the post
                    }
                  });
                },
              ),
              Text('${post.likedBy.length} Likes'), // Display the number of likes
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
