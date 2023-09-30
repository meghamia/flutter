import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:test1/series1.dart';
import 'package:test1/series2.dart';
import 'package:test1/series3.dart';
import 'package:test1/series6.dart';
class Laundrystore extends StatefulWidget {
  @override
  _LaundrystoreState createState() => _LaundrystoreState();
}

class _LaundrystoreState extends State<Laundrystore> {
  int _currentIndex = 0;
  List<Widget> _listbottom =<Widget>[
     Laundrystore1(),
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Laundary store'),
        ),
        body:_listbottom.elementAt(_currentIndex),

        bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.shopping_cart, size: 30),
            Icon(Icons.person, size: 30),
          ],
          color: Colors.teal, // Make the background transparent
          buttonBackgroundColor: Colors.pinkAccent,
          backgroundColor: Colors.brown,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            }
            );
          },
        ),
      ),
    );
  }
}