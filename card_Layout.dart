import 'package:flutter/material.dart';

void main() {
  runApp(_cardLayout());
}

class _cardLayout extends StatefulWidget {
  cardLayout createState() => cardLayout();
}

class cardLayout extends State<_cardLayout> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Elevated Button"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              CardButton(
                backgroundColor: Colors.pinkAccent,
                buttonText: "SignUp",
              ),
              CardButton(
                backgroundColor: Colors.blueGrey,
                buttonText: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final Color backgroundColor;
  final String buttonText;

  CardButton({required this.backgroundColor, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: Card(
        elevation: 5,
        shadowColor: Colors.lightGreen, // Set the shadow color here
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 20.0),
              backgroundColor: backgroundColor,
              foregroundColor: Colors.black,
            ),
            onPressed: () {},
            child: Text(buttonText),
          ),
        ),
      ),
    );
  }
}
