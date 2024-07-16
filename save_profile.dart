import 'package:flutter/material.dart';

class SaveProfile extends StatelessWidget {
  var nameFromProfile;
  SaveProfile(this.nameFromProfile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ghh"),
      ),
      body: Container(
        color: Colors.orange,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcom $nameFromProfile",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w200),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("presssssssss"))
            ],
          ),
        ),
      ),
    );
  }
}


