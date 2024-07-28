
import 'package:dio/dio.dart';
import 'package:final1/Api_screens/product_model_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
 ScrollController _scrollController = ScrollController();
 final Dio dio = Dio();
 List<Product> products = [];
 int totalProducts = 1000;
 bool isLoadingData = false;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(loadMoreData);
    getProducts();
  }

  void loadMoreData() async{
   if(_scrollController.offset == _scrollController.position.maxScrollExtent && products.length<totalProducts){
     getProducts();
   }
  }

  void getProducts() async{
   try{
     setState(() {
       isLoadingData = true;
     });
     final response = await dio.get("https://dummyjson.com/products?limit=10&skip=${products.length}&select=title,price,thumbnail");
     final List data = response.data['products'];
     final List<Product> newProduct = data.map((p) => Product.fromJson(p)).toList();
     setState(() {
       isLoadingData = false;
       totalProducts = response.data['total'];
       products.addAll(newProduct);
     });
     
   }catch(e){
     print(e);
   }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("githhhh"),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: false,
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: products.length,
              itemBuilder: (context,index){
              final product = products[index];
              return ListTile(
                leading: Text(product.id.toString()),
                title: Text(product.title!),
                subtitle: Text("\$${product.price.toString()}"),
                trailing: Image(width:150,fit:BoxFit.cover,image: NetworkImage(product.thumbnail!),),
              );
              })),
          if(isLoadingData)Padding(
            padding: const EdgeInsets.all(8.0),
            child: SpinKitThreeBounce(color: Colors.orange,size: 40,),
          )
        ],
      ),
    );
  }
}





