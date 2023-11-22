// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'Product1controller.dart';
//
// class ProductPage extends GetView<MyListController> {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController quantityController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Product List'),
//       ),
//       body: GetBuilder<MyListController>(
//         builder: (controller) {
//           return ListView.builder(
//             itemCount: controller.products.length,
//             itemBuilder: (context, index) {
//               final product = controller.products[index];
//
//               return Card(
//                 margin: EdgeInsets.all(7),
//                 child: ListTile(
//                   title: Text('Title: ${product.title}'),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text('Description: ${product.description}'),
//                       Text('Price: \$${product.price.toStringAsFixed(2)}'),
//                       Text('Quantity: ${product.quantity}'),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.bottomSheet(
//             Material(
//               borderRadius: BorderRadius.circular(15),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: titleController,
//                       decoration: InputDecoration(labelText: 'Title'),
//                     ),
//                     TextField(
//                       controller: descriptionController,
//                       decoration: InputDecoration(labelText: 'Description'),
//                     ),
//                     TextField(
//                       controller: priceController,
//                       decoration: InputDecoration(labelText: 'Price'),
//                     ),
//                     TextField(
//                       controller: quantityController,
//                       decoration: InputDecoration(labelText: 'Quantity'),
//                     ),
//                     ElevatedButton(
//                       child: const Text('Add'),
//                       onPressed: () {
//                         final title = titleController.text;
//                         final description = descriptionController.text;
//                         final Price = priceController.text;
//                         final Quantity = quantityController.text;
//                         final numericPrice = double.tryParse(Price);
//                         final numericQuantity = int.tryParse(Quantity);
//
//                         if (title.isNotEmpty &&
//                             description.isNotEmpty &&
//                             numericPrice != null &&
//                             numericQuantity != null) {
//                           controller.addProduct(
//                             title,
//                             description,
//                             numericPrice,
//                             numericQuantity,
//                           );
//
//                           titleController.clear();
//                           descriptionController.clear();
//                           priceController.clear();
//                           quantityController.clear();
//                           Get.back();
//                         } else {
//                           print('Invalid input or price/quantity format.');
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Product1controller.dart';

class ProductPage extends GetView<MyListController> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final List<String> units = ['g', 'kg', 'l', 'ml'];
  final RxString selectedUnit = 'g'.obs; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Product List'),
      ),
      body: GetBuilder<MyListController>(
        builder: (controller) {
          return Obx(
            ()=> ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                final product = controller.products[index];

                return Card(
                  margin: EdgeInsets.all(7),
                  child: ListTile(
                    title: Text('Title: ${product.title}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Description: ${product.description}'),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text('Quantity: ${product.quantity} ${product.unit}'),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text('Price: \$${product.price.toStringAsFixed(2)}'),
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            Material(
              borderRadius: BorderRadius.circular(15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(labelText: 'Description'),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: TextField(
                              controller: quantityController,
                              decoration: InputDecoration(labelText: 'Quantity'),
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: TextField(
                              controller: priceController,
                              decoration: InputDecoration(labelText: 'Price'),
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Obx(
                              ()=> DropdownButton<String>(
                                value: selectedUnit.value,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    selectedUnit.value = newValue;
                                  }
                                },
                                items: units.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      child: const Text('Add'),
                      onPressed: () {
                        final title = titleController.text;
                        final description = descriptionController.text;
                        final rawPrice = priceController.text;
                        final rawQuantity = quantityController.text;

                        final numericPrice = double.tryParse(rawPrice);
                        final numericQuantity = double.tryParse(rawQuantity);

                        if (title.isNotEmpty &&
                            description.isNotEmpty &&
                            numericPrice != null &&
                            numericQuantity != null) {
                          controller.addProduct(
                            title,
                            description,
                            numericPrice,
                            numericQuantity,
                            selectedUnit.value,
                          );

                          titleController.clear();
                          descriptionController.clear();
                          priceController.clear();
                          quantityController.clear();
                          Get.back();
                        } else {
                          print('Invalid input or price/quantity format.');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
