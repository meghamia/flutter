import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiledevelopment/config/my_theme.dart';
import 'package:mobiledevelopment/screens/home_screen.dart';
import 'package:mobiledevelopment/screens/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: lightTheme,
      darkTheme: darkTheme,

      home: SplashScreen(),
    );
  }
}
