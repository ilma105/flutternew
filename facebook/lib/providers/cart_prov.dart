import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack/core/constraints/sharedkeys.dart';
import 'package:stack/models/product_model.dart';
import 'package:stack/models/productquan.dart';

class Cart_prov with ChangeNotifier{
List<ProductQuan> _products=[];
double totalprice =0;
int  totalitem=0;
late SharedPreferences _sp; 
List<ProductQuan> get items{
  return _products;
}
Cart_prov(){
  _loadcart();
}
void addProd(ProductModel product){
  
  for(var item in _products){
    if(item.product.id == product.id ){
      item.quantity=item.quantity+1;
      notifyListeners();
      _caltotal();
      _savecart();
      return;
    }
  }
  _products.add(ProductQuan(product: product, quantity: 1));
  notifyListeners();
  _caltotal();
  _savecart();
}

void removeProd(ProductModel product){

 for(var item in _products){
    if(item.product.id == product.id ){

item.quantity=item.quantity-1;
if(item.quantity==0){
  _products.remove(item);

}
notifyListeners();
_caltotal();
    }

  }
notifyListeners();
_caltotal();

_savecart();
}
//total price and item calculate
void _caltotal(){
  totalprice=0;
  totalitem=0;
  for(var item in _products){
    totalprice=(item.product.price ?? 0) * item.quantity;
    totalitem =item.quantity;
    }
    notifyListeners();
  }

int countprod(ProductModel productModel){
for(var item in _products){
   if(item.product.id==productModel.id){
    return item.quantity;

   }
    }
       return 0;


}
bool paynow(String cardnum){
 Map res= jsonDecode(fakeclient.pay(cardnum));
 if(res["success"]==true){
  _products=[];
    notifyListeners();

  return true;
 }
 return false;
}
void _savecart()async {
List<String> carddata=[];
for(var item in _products){

  carddata.add(jsonEncode(item.tojson()) );

}
_sp=await SharedPreferences.getInstance();
_sp.setString(Sharedkeys.cart, carddata.toString());
print(carddata.toString());
}
void _loadcart()async{
// print("loading cart data");
_sp = await SharedPreferences.getInstance();
List cartd= jsonDecode(_sp.getString(Sharedkeys.cart)??"");

for(var item in cartd){
  _products.add(ProductQuan.fromjson(item));
}
notifyListeners();

}


}
class fakeclient{
  static String pay(String cardnum){
    if(cardnum == "1111"){
      return '''
{
  "success": true
}

''';
    
  }
  return '''
{
    "success": false

}

''';
  }


}