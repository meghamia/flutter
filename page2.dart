

import 'package:firstproject/pg2_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class Home extends GetView<HomeControllerBinding>{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(()=> Text(
                'the value  is ${controller.count}',
                style: TextStyle(fontSize: 25),
              )),


              ElevatedButton(
                child: Text("click here"),
                onPressed:
                    () =>
                    controller.increment(),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                child: Text("Back"),
                onPressed:
                    () =>
                    Get.back(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}