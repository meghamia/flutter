


import 'package:firstproject/pg1_controller.dart';
import 'package:firstproject/pg2_controller.dart';
import 'package:get/get.dart';


class AllControllerBinding implements Bindings{

  @override
  void dependencies(){
    Get.lazyPut <MyController>(() => MyController());
   Get.lazyPut <HomeControllerBinding>(() => HomeControllerBinding());

  }
}