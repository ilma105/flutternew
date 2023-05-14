import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack/datasource/tokendata.dart';

class AuthProvider with ChangeNotifier {
  bool isloading = false;
  bool haserror=false;
  String? errorme;
  Future<bool> login(String username, String password) async
   {
    isloading=true;
    haserror=false;
    notifyListeners();
    http.Response res = await http.post(
        Uri.parse("https://fakestoreapi.com/auth/login"),
        body: {"username": username, "password": password});
    if (res.statusCode == 200) {
//succ login
      print(res.body);
      String token=jsonDecode(res.body)["token"];
      SharedPreferences sharedPreference=await SharedPreferences.getInstance();
    TokenData tokenData= TokenData(sharedPreference);
   
   
    return await   tokenData.save(token);
    } 
    
    else {
//failed login
      print("Login Failed");
      haserror=true;
      errorme="failed to Login";
      notifyListeners();

    }
    isloading=false;
    notifyListeners();
    return false;
  }
// Future<bool> justlogout()async{
//    SharedPreferences sharedPreference=await SharedPreferences.getInstance();
//     TokenData tokenData= TokenData(sharedPreference);
   
//   //  notifyListeners();
//     return await   tokenData.delete();

// }


}
