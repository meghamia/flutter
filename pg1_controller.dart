


import 'package:get/get.dart';
//var RxString   = 'mnh';
//final Rx<int> count1 = 0.obs;
//final Rx<int> count2 = 0.obs;



class MyController extends GetxController{
  var count = RxInt(0);
  RxInt count1 = 0.obs;
  RxDouble count2 = (8.1).obs;
 //RxInt count2 = 0.obs;
  //Rx<int> get sum => (count1.value + count2.value).obs;
  var list = RxList<double>([2.1,3.1,7.1]);



  //var count = 0.obs;
  void increment(){
    count++;
    update();

  }
}




