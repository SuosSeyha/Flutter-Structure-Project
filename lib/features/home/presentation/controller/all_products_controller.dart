import 'package:flutter/foundation.dart';
import 'package:flutter_build_structure_project/features/home/data/repositories/all_products_repository.dart';

class AllProductsController extends ChangeNotifier{
  Future<void> init()async{
    getListAllProducts();
    notifyListeners();
  }
  List listAllProducts=[];
  
  Future<void> getListAllProducts()async{
    AllProductRepository allProductRepository = AllProductRepository();
    // try{
    // }catch(e){
    //   return [];
    // }
    // return null;
    List _listAllProducts= await allProductRepository.fetchAllProducts();
    if(_listAllProducts.isNotEmpty){
      listAllProducts=_listAllProducts;
      print(">>>Product HAVE");
    }else{
      //
      print(">>>Product NOOO");
    }
    notifyListeners();
  }

}