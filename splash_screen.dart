import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiledevelopment/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Get.to(()=>HomeScreen());
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/screenshot.jpg', // Your splash screen image
          height: 70,
          width: 190,
        ),
      ),
    );
  }
}
