import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final String message;

  ResultPage({required this.bmi, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your BMI is:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Text(
              message,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
