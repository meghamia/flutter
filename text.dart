

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: MyTextPage(),
    );
  }
}
class MyTextPage extends StatelessWidget{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("welcome to my widget")
      ),
      body:Center(
        child:Text("welcome")
      ),
    );

  }
}

