// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/product_model.dart';

class HomeFragProv with ChangeNotifier{
List<ProductModel> products=[];
List categories=["All"];
bool isloading = true;
bool iscatloading=true;
int selectedTabIndex=0;
  HomeFragProv(){
    print("i am construc");
    loadallproduct();
    loadAllCat();
  }
  Future<void> loadallproduct()async{
  http.Response res=await http.get(Uri.parse("https://fakestoreapi.com/products"));
if(res.statusCode==200){
  List allproducts= jsonDecode(res.body);
  allproducts.forEach((productMap) { 
products.add(ProductModel.fromJson(productMap));
  });
}
else{
  print("error");
}
print(products);
isloading=false;
notifyListeners();
  }
  Future<void> loadAllCat()async{
    http.Response res=await http.get(Uri.parse("https://fakestoreapi.com/products/categories"));
  if(res.statusCode==200){
 categories.addAll(jsonDecode(res.body));
  }
  // print(categories);
  iscatloading=false;

  notifyListeners();
  // else{

  // } 
  }
  void changeProducCat(int index)async {
    selectedTabIndex=index;
    notifyListeners();
    isloading=true;

    if(index==0){
      await loadallproduct();

    }
    else{
          await loadProdCat(categories[index]);

    }

  }


Future<void> loadProdCat(String categoryname) async {
  //https://fakestoreapi.com/products/category/electronics
   http.Response res=await http.get(Uri.parse("https://fakestoreapi.com/products/category/$categoryname")
   );
  if(res.statusCode==200){
    products=[];
List allprod=jsonDecode(res.body);
allprod.forEach((productMap) {
products.add(ProductModel.fromJson(productMap));
});
  }
  isloading=false;
  notifyListeners();
  // else{

  // }
}


  
}
