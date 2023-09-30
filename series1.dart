import 'package:flutter/material.dart';
class FirstPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_bus)),
                  Tab(icon: Icon(Icons.directions_train)),
                ],
            ),
            title: Text('Tab Demo'),
            backgroundColor: Colors.blueGrey,
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text(' carRide'),
              ),
              Icon(Icons.directions_bus),
              Icon(Icons.directions_train),
            ],
          ),
        ),
      ),
    );
  }
}

