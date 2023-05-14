import 'package:flutter/material.dart';
import 'package:stack/models/product_model.dart';

class ProductQuan{
  //late karon pore initialize korbo
   late ProductModel product;
   late int quantity;
  ProductQuan({required this.product,required this.quantity});
  //constructor arekta jeta product,quantity generate korbe
  ProductQuan.fromjson(Map<String,dynamic> json){
product=ProductModel.fromJson(json["product"]);
quantity=json["quantity"];


  }

Map<String,dynamic> tojson(){
return{
  "product":product.toJson(),
  "quantity":quantity
};
}
  
}