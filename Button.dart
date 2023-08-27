
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
   _MyAppState createState()=>_MyAppState();
}

class _MyAppState  extends State<MyApp>{
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title: Text("Flutter Elevated Button"),

        ),
        body:Center(
          child:Column(
            children:<Widget>[
              Container(
                margin:EdgeInsets.all(25),
                child:ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    textStyle:TextStyle(fontSize:20.0),
                    backgroundColor:Colors.pinkAccent,
                    foregroundColor:Colors.black,
                  ),
                  onPressed: () {},
                  child:Text("SignUp"),
                ),
              ),
              Container(
                margin:EdgeInsets.all(25),
                child:ElevatedButton(
                  style:ElevatedButton.styleFrom(textStyle:TextStyle(fontSize:20.0),backgroundColor:Colors.blueGrey,),
                  onPressed:() {},
                  child:Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
