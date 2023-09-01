
import 'package:flutter/material.dart';

import 'image_screen.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter image',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const ImageScreen(),
    );
  }
}

