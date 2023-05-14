// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:ecom_part2/datasources/token_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class AuthProv with ChangeNotifier{
  bool isload =false;
  bool haserr=false;
  String? errmessage;
  @override
   notifyListeners();
  Future<bool> login(String username,String password)async{
    isload=true;
    haserr=false;
    notifyListeners();
    http.Response res=await http.post(Uri.parse("https://fakestoreapi.com/auth/login"),

body: {
    "username":username,
    "password":password
}
);
if(res.statusCode==200){
 print("logged in");
 String token =jsonDecode(res.body)["token"];
 SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
 
 TokenDataSource tokenDataSource= TokenDataSource(sharedPreferences);
 return await tokenDataSource.save(token);


 
 
}
else{
 print("logged failed");
haserr=true;
errmessage="Failed to LogIn";
notifyListeners();
}
isload=false;
notifyListeners();
return false;
   
  }

}