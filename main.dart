import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/Login_Page.dart';
import 'package:untitled/Text_cont.dart';
import 'package:untitled/five.dart';
import 'package:untitled/four.dart';
import 'package:untitled/list_view.dart';
import 'package:untitled/vestimate_ui.dart';
import 'package:untitled/view_scroll.dart';


void main() {
  runApp(
      MainWidget());

}


class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: "Navigation Test",
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          //bodyMedium: GoogleFonts.aBeeZee(textStyle: textTheme.bodyMedium),)),
            bodyLarge: GoogleFonts.redHatMono(textStyle: textTheme.bodyMedium),)),
      home: MyNavigation(),
    );
  }
}
class MyNavigation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyNavigation();
  }

}
class _MyNavigation extends State<MyNavigation>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Navigation Tutorial"),
      ),
      body: Center(
        child:Column(
          children:[
          ElevatedButton(
            child:Text("press Here"),
            onPressed:
                () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyList()),

            ),
          ),
            ElevatedButton(
              child:Text("tap here"),
              onPressed:
                  () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyList1()),

              ),
            ),
            ElevatedButton(
              child:Text("click here"),
              onPressed:
                  () => Navigator.push(context,
                MaterialPageRoute(builder: (context) =>Scrolllist()),

              ),
            ),
            ElevatedButton(
              child:Text("click me"),
              onPressed:
                  () => Navigator.push(context,
                MaterialPageRoute(builder: (context) =>scrollpage()),

              ),
            ),
            ElevatedButton(
              child:Text("click me"),
              onPressed:
                  () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => VestimateApp()),

              ),
            ),
            ElevatedButton(
              child:Text("click me"),
              onPressed:
                  () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginApp()),

              ),
            ),ElevatedButton(
              child:Text("click me"),
              onPressed:
                  () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyText()),

              ),
            ),







          ]
        )

    ),

    );
  }
}

