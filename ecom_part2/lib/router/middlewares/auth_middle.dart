import 'package:ecom_part2/datasources/token_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route_manager.dart';

class AuthMiddleWare{

  static Future<String?> guardwihtlogin()async{
SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  //already loggid in
 TokenDataSource tokenDataSource= TokenDataSource(sharedPreferences);
  if((tokenDataSource.get())==null){
    return Routenames.LOGIN;
  }
  
  //not logged in
    return null;

  }
}