
import 'package:firstproject/product_service.dart';
import 'package:get/get.dart';
import 'product_model.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final data = <ProductModel>[];
  int counter=0;



  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      final products1 = await DataService().fetchProducts();
      final productModels = products1.products?.map((product) {
        product.id = generateid();
        return ProductModel(
          products: [product],
          total: products1.total,
          skip: products1.skip,
          limit: products1.limit,
        );
      }).toList();

      if (productModels != null) {
        data.addAll(productModels);
      }
      update();
    } catch (e) {
      print(e);
    }
  }

  void addproducts(ProductModel newproducts1){
    newproducts1.products![0].id = generateid();
    data.add(newproducts1);
    update();
  }
  void deleteproduct(int index){
    if(index>=0 && index <data.length){
      data.removeAt(index);
      update();
    }
  }
  String generateid(){
    //counter++;
    return '${counter}';
  }
  void updateid(String id) {
    final index = data.indexWhere((productModel) => productModel.products![0].id == id);

    if (index != -1) {
      namecontroller.text = data[index].products![0].title;
      descriptioncontroller.text = data[index].products![0].description;

      Get.bottomSheet(SingleChildScrollView(
        child: Container(
          height: 400,
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
                  Text('Edit Product', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
                      controller: controller.namecontroller,
                    ),
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
                      controller: controller.descriptioncontroller,
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      data[index].products![0].title = controller.namecontroller.text;
                      data[index].products![0].description = controller.descriptioncontroller.text;
                      Get.back();
                      controller.namecontroller.clear();
                      controller.descriptioncontroller.clear();
                      update();
                    },
                    child: Text('Save'),
                  ),
                ],
              );
            },
          ),
        ),
      ));
    }
  }


}
























