
import 'package:firstproject/getBackFile1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data_controller2.dart';

class Getfile extends StatelessWidget {
  const Getfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx'),

      ),
      body: Center(
        child: Container(
            child:
            Column(
              children: [
                ElevatedButton(
                  onPressed: (){
                    Get.to(()=> NextPage(),
                    arguments: {
                      "name": "ABV",
                      "class": "10",
                     },
                    );
                  },
                   child: Text('Next Screen'),
                ),
                ElevatedButton(
                  onPressed: (){
                    Get.to(()=> GetxMethod(),

                    );
                  },
                  child: Text('n'),
                ),

              ],
            ),

        ),
      ),
    );
  }
}
