class Posts {
  int? id;
  String? title;
  String? body;
  List<String>? tags;
  Reactions? reactions;
  int? views;
  int? userId;

  Posts(
      {this.id,
        this.title,
        this.body,
        this.tags,
        this.reactions,
        this.views,
        this.userId});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    tags = json['tags'].cast<String>();
    reactions = json['reactions'] != null
        ? new Reactions.fromJson(json['reactions'])
        : null;
    views = json['views'];
    userId = json['userId'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['tags'] = this.tags;
    if (this.reactions != null) {
      data['reactions'] = this.reactions!.toJson();
    }
    data['views'] = this.views;
    data['userId'] = this.userId;
    return data;
  }
}

class Reactions {
  int? likes;
  int? dislikes;

  Reactions({this.likes, this.dislikes});

  Reactions.fromJson(Map<String, dynamic> json) {
    likes = json['likes'];
    dislikes = json['dislikes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    return data;
  }
}




//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: NameFrequencyScreen(),
//     );
//   }
// }
//
// class NameFrequencyScreen extends StatefulWidget {
//   @override
//   _NameFrequencyScreenState createState() => _NameFrequencyScreenState();
// }
//
// class _NameFrequencyScreenState extends State<NameFrequencyScreen> {
//   // Sample list of names
//   final List<String> names = ['Alice', 'Bob', 'Alice', 'Charlie', 'Bob', 'Alice'];
//
//   // Function to count the frequency of names
//   Map<String, int> countFrequency(List<String> names) {
//     Map<String, int> frequencyMap = {};
//
//     for (var name in names) {
//       if (frequencyMap.containsKey(name)) {
//         frequencyMap[name] = frequencyMap[name]! + 1;
//       } else {
//         frequencyMap[name] = 1;
//       }
//     }
//
//     return frequencyMap;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Get the frequency map
//     Map<String, int> frequency = countFrequency(names);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Name Frequency'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: frequency.entries.map((entry) {
//             return Text('${entry.key}: ${entry.value}', style: TextStyle(fontSize: 18));
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
