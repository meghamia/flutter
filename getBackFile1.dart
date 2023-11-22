import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Next Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(Get.arguments['name']),
            Text(Get.arguments['class']),
            Container(
                child:
                ElevatedButton(
                  onPressed: (){
                    Get.back();
                  },
                  child: Text('back Screen'),

                )
            ),
          ],
        ),
      ),
    );
  }
}
