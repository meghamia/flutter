import 'package:get/get.dart';
class SecondPage extends GetxController{
  List<String> todoitems =[];
  void addlist(){
    int index = todoitems.length;
    todoitems.add('product'+ index.toString());
    update();
  }

}





