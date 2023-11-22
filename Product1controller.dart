//
// import 'package:get/get.dart';
//
// class MyListController extends GetxController {
//   final RxList<Product2> products = <Product2>[].obs;
//
//   void addProduct(String title, String description, double price, int quantity) {
//     products.add(Product2(
//       title: title,
//       description: description,
//       price: price,
//       quantity: quantity,
//     ));
//     update(); // Ensure that the UI is updated after adding a product
//   }
// }
//
// class Product2 {
//   final String title;
//   final String description;
//   final int quantity;
//   final double price;
//
//   Product2({
//     required this.title,
//     required this.description,
//     required this.quantity,
//     required this.price,
//   });
// }


import 'package:get/get.dart';

class MyListController extends GetxController {
  final RxList<Product2> products = <Product2>[].obs;


  void addProduct(String title, String description, double price, double quantity, String unit) {
    products.add(Product2(
      title: title,
      description: description,
      price: price,
      quantity: quantity,
      unit: unit,
    ));
    update();
  }
}


class Product2 {
  final String title;
  final String description;
  final double quantity;
  final double price;
  final String unit;

  Product2({
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    required this.unit,
  });
}
