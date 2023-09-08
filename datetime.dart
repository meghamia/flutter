import 'package:flutter/material.dart';

void main() {
  runApp(MyTextPage());
}

class MyTextPage extends StatefulWidget {
  const MyTextPage({Key? key}) : super(key: key);

  State<MyTextPage> createState() => _MyTextPageState();
}

class _MyTextPageState extends State<MyTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, World App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Date',
              style: TextStyle(fontSize: 25),
            ),
            Material(
              // Add a Material widget around ElevatedButton
              child: ElevatedButton(
                onPressed: () async {
                  DateTime? datePicked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2024),
                  );

                  if (datePicked != null) {
                    print(
                        'Date Selected: ${datePicked.day}-${datePicked.month}-${datePicked.year}');
                  }
                },
                child: Text('Show'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
