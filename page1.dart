import 'package:firstproject/pg1_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFile extends GetView<MyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('next'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'The value is ${controller.count1.value}',
                  style: TextStyle(fontSize: 24),
                )),
            Obx(() => Text(
              'The value is ${controller.count2.value}',
              style: TextStyle(fontSize: 24),
            )),
            Obx(() => Text(
              'The value is ${controller.list.value}',
              style: TextStyle(fontSize: 24),
            )),
            ElevatedButton(
              child: Text("click here"),
              onPressed: () => controller.increment(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text("Home"),
              onPressed: () =>
                  // Get.to(Home()),
                  Get.toNamed("/page2"),
            ),
          ],
        ),
      ),
    );
  }
}
