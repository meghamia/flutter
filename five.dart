

import 'package:flutter/material.dart';

class MyList1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var arrNames = ['one' , 'two' , 'three' , 'four' , 'five' , 'six' , 'seven' , 'eight' ,'nine' ];
    return Scaffold(
      appBar: AppBar(
        title: Text("click Here"),


      ),
      /*body: ListView(
        //scrollDirection: Axis.horizontal,
        scrollDirection:Axis.vertical,
        reverse: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('one', style: TextStyle(fontSize:21,fontWeight: FontWeight.w500),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('two', style: TextStyle(fontSize:21,fontWeight: FontWeight.w500),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('three', style: TextStyle(fontSize:21,fontWeight: FontWeight.w500),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('four', style: TextStyle(fontSize:21,fontWeight: FontWeight.w500),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('five', style: TextStyle(fontSize:21,fontWeight: FontWeight.w500),),
          )
        ],
      ),*/
      body: ListView.separated(itemBuilder: (context, index){
        return Text(arrNames[index] , style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),);
      },
        itemCount :arrNames.length,

        //scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index){
        return Divider(height: 4, thickness:3);
        },

      )
    );
  }
  
}