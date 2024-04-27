import 'dart:convert';
import 'package:flutter_build_structure_project/features/home/data/model/all_product.dart';
import 'package:http/http.dart' as http;
class AllProductRepository{
    Future<List<AllProducts>> fetchAllProducts()async{
    var url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if(response.statusCode == 200){
      List<dynamic> result = jsonDecode(response.body);
      return result.map((data) =>AllProducts.fromJson(data)).toList();
    }else{
      throw Exception('Failed to fetch users');
    }
  }
}