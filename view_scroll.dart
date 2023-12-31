
import 'package:flutter/material.dart';

class scrollpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horizontal and Vertical ListView"),
        backgroundColor: Colors.pinkAccent[700],
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      height: 100,
                      width: 100,
                      margin:EdgeInsets.all(10),
                      child: Center(
                        child: Text("Card $index"),
                      ),
                      color: Colors.green[700],
                    ),
              ),
              ),
              Flexible(
                child: ListView.builder(
                itemCount:15,
                physics:NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:(context, index) => ListTile(
                title: Text("List $index"),
              ),
              ),
              ),
            ],
          ),
        )
      ),
    );
  }

}