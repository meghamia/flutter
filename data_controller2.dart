import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'databack2.dart';

class GetxMethod extends StatelessWidget {
  const GetxMethod({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SecondPage>(
        init: SecondPage(),
        builder: (todocontroller){
          return Scaffold(
            appBar: AppBar(
              title: Text('Getbuilder Method'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                todocontroller.addlist();
              },
              backgroundColor: Colors.pink,
              child: Icon(Icons.add),
            ),
            body:ListView.builder(
                itemCount: todocontroller.todoitems.length,
                itemBuilder: (BuildContext context ,int index){
                  return TodoListTile(
                      todoTitle: todocontroller.todoitems[index]);

                }),
          );
        }
    );
  }
}
class TodoListTile extends StatelessWidget {
  final String todoTitle;

  TodoListTile({required this.todoTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todoTitle),
      leading: Icon(Icons.star),
      onTap: () {
        Get.back();
      },
    );
  }
}




