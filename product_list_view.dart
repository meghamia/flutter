
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_controller.dart';
import 'product_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Product'),
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(SingleChildScrollView(
                child: Container(
                 // height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: GetBuilder<HomeController>(
                    builder: (controller) {
                      return Column(
                        children: [
                          SizedBox(height: 20),
                          Text('Add  Product', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                labelText: 'Product Name',
                              ),
                              controller: controller.namecontroller,),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                labelText: 'Description',
                              ),
                              controller: controller.descriptioncontroller,),
                          ),
                          SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              final newProduct = ProductModel(
                                products: [
                                  Products(
                                    title: controller.namecontroller.text,
                                    description: controller.descriptioncontroller.text,
                                    id: controller.generateid(),
                                  ),
                                ],
                              );
                              controller.addproducts(newProduct);
                              Get.back();
                              controller.namecontroller.clear();
                              controller.descriptioncontroller.clear();
                            },
                            child: Text('Add'),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              final productModel = controller.data[index];

              if (productModel.products != null && productModel.products!.isNotEmpty) {
                final product = productModel.products![0];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Column(
                        children: [
                          Text('Product Name: ${product.title}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.updateid(product.id);
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.deleteproduct(index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Text('Title: ${product.title}'),
                          Text('Description: ${product.description}'),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return ListTile(
                  title: Text('No Products Found'),
                );
              }
            },
          );
        },
      ),
    );
  }
}

































