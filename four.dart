

import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    var arrNames=['A' , 'B' , 'C' , 'D', 'E' , 'F' , 'G' , 'H' , 'I' , 'J'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Click Here"),
      ),
      body: ListView.separated(itemBuilder: (context, index) {
        return ListTile(
        leading: Text('${index+1}'),
        title: Text(arrNames[index]),
        subtitle: Text('Number'),
        trailing: Icon(Icons.add),

        );
    },
    itemCount: arrNames.length,
    separatorBuilder: (context, index){
        return Divider(
        height: 30, thickness: 1,);

       },
      )
    );
  }
}