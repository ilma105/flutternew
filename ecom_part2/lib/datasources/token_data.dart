import 'package:shared_preferences/shared_preferences.dart';

import '../core/constraints/shared_pref_keys.dart';

class TokenDataSource{
 // ignore: prefer_final_fields
 late SharedPreferences _sharedPreferences;

//dependency injection
TokenDataSource(this._sharedPreferences);

Future<bool> save(String token)async{

 
 
 bool istokensaved=await _sharedPreferences.setString(SharedPrefKeys.token,token);
 if(istokensaved){
  return true;
 }
return false;
}
String? get(){
  return _sharedPreferences.getString(SharedPrefKeys.token);
}
Future<bool> delete()async{
 return await _sharedPreferences.remove(SharedPrefKeys.token);
}
}