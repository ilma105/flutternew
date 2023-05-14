import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stack/models/product_model.dart';

class HomeFragProv with ChangeNotifier{
  List<ProductModel> products=[];
  List categories=["All"];
  bool isloading=true;
    bool iscatloading=true;
int selectedtabindex=0;
HomeFragProv(){
loadallprod();
Load_allcat();
}
Future<void> loadallprod()async{
  http.Response res=await http.get(Uri.parse("https://fakestoreapi.com/products"));
  if(res.statusCode==200){
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
void Load_allcat()async{
 http.Response res=await http.get(Uri.parse("https://fakestoreapi.com/products/categories"));
  if(res.statusCode==200){
 categories.addAll(jsonDecode(res.body));
  }
  // print(categories);
  isloading=false;
    iscatloading=false;

  notifyListeners();
  // else{

  // } 
}
void changeprodcat(int index)async{
  selectedtabindex=index;
  notifyListeners();
isloading=true;
// if(index == 0){
//  await loadallprod();

// }
// else{
//   await loadprodofcat(categories[index]);

// }

}

Future<void> loadprodofcat(String categoryname) async {
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