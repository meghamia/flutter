import 'dart:async';
import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 45, hours: 8));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Difference'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: updateTimeDifference(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Time Difference:',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    snapshot.data ?? '',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Stream<String> updateTimeDifference() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      DateTime now = DateTime.now();
      Duration difference = endDate.difference(now);

      int months = difference.inDays ~/ 30;
      int days = difference.inDays % 30;
      int hours = difference.inHours % 24;
      int minutes = (difference.inMinutes % 60);
      int seconds = (difference.inSeconds % 60);

      yield '$months : $days : $hours : $minutes : $seconds ';
    }
  }
}