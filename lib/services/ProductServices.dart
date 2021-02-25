import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shopping/models/products.dart';
class ProductServices{
  static Future<Map>getProducts()async{
    var url = "";
    final response = await http.get(url);
    if(response.statusCode == 200){
      List<Product> products = [];
      var responseBody  = json.decode(response.body);
      responseBody['data'].forEach((item){
        return {
          "curentpage": responseBody['curentPage'],
          "products": products,
        };
      });
    }
  }
}