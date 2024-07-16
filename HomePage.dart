import 'package:flutter/material.dart';
import 'package:mobiledevelopment/sharedpref/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});






  Future<Map<String, String>> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name') ?? "";
    String email = prefs.getString('email') ?? "";
    String password = prefs.getString('password') ?? "";
    return {"name": name, "email": email, "password": password};
  }

  // void _showDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("abhi na jao chorr kar"),
  //           content: Text("tuc ja re ho?"),
  //           actions: [
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text('nhi jaenga na tu')),
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                   Navigator.pushReplacement(context,
  //                       MaterialPageRoute(builder: (context) => LoginPage()));
  //                   ;
  //                 },
  //                 child: Text("chall ja"))
  //           ],
  //         );
  //       });
  // }
  void _showDialog(BuildContext context){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Are you sure you want to exit?"),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("no")),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
          }, child: Text("Yes")),


        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hdhdh"),

      ),
      body: FutureBuilder<Map<String, String>>(
          future: _loadData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("error${snapshot.hasError}"),
              );
            } else {
              final userData = snapshot.data!;
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("name${userData['name']}"),
                    Text("email${userData['email']}"),
                    Text("password${userData['password']}")
                  ],
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(context),
        child: Icon(Icons.login_rounded),
      ),
    );
  }
}

