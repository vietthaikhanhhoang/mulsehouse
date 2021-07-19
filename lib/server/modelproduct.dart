import 'dart:convert';
import 'dart:async';

import 'package:mulsehouse/utils/global.dart';
import 'package:mulsehouse/class/product.dart';
import 'package:http/http.dart' as http;

class modelproduct{
  String getproduct(){
    print("lay ve mot dong product");
    return "product 1";
  }

  List<Product> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) =>Product.fromJson(json)).toList();
  }

  Future<List<Product>> fetchProducts() async {
    final response =
    await http.get(Uri.parse(URL + '/product'));
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}