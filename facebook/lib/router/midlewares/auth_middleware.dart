import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack/datasource/tokendata.dart';

import '../route_manager.dart';

class Authmidleware{
  static Future<String?> guardwithlogin()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

TokenData tokenData=TokenData(sharedPreferences);
    //if user already logged in
if((await tokenData.get()) == null){
return Routenames.logi;
 }
//if user not logged in
  return null;
  }
}