import 'package:flutter/material.dart';
import 'package:mobiledevelopment/sharedpref/save_profile.dart';

class SaveData extends StatelessWidget {
  const SaveData({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('save data'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffa6c0fe),Color(0xfffccb90),Color(0xffcfd9df)
              ]
            )
          ),
          child: Center(
            child: Container(
              
              width: 310,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dashboard",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "name",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.blueGrey)
                      )
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SaveProfile(nameController.text.toString()),
                            ));
                      },
                      child: Text("My Profile"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
