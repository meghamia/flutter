
import 'package:http/http.dart' as http;
import 'product_model.dart';
import 'dart:convert';




class DataService {
  Future<ProductModel> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final productModel = ProductModel.fromJson(data);
      return productModel;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}

