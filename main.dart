import 'package:flutter/material.dart';
import 'package:test1/BMI.dart';
import 'package:test1/imagecropper.dart';

void main() {
  runApp(
      MainWidget());

}

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });





  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          children:[
            ElevatedButton(
              child: Text("click here"),
                onPressed:
                   ()=> Navigator.push(context,
                     MaterialPageRoute(builder: (context) => Imagecropper()),
          ),
      ),
            ElevatedButton(
              child: Text("Calculate BMI"),
              onPressed:
                  ()=> Navigator.push(context,
                MaterialPageRoute(builder: (context) => BMIcalculator()),
              ),
            )
          ]
        )


        ),
      );
     // This trailing comma makes auto-formatting nicer for build methods.
  }
}




