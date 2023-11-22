

import 'package:get/get.dart';


class HomeControllerBinding extends GetxController{
  var count = 0.obs;
  void increment(){
    count++;
  }
}
