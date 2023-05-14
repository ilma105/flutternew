import 'package:shared_preferences/shared_preferences.dart';

import '../core/constraints/sharedkeys.dart';

class TokenData{
  //token read save delete method thakbe
late SharedPreferences _sharedPreferences;
//dependency injection
TokenData(this._sharedPreferences);
Future<bool> save(String token)async{
 bool istok = await _sharedPreferences.setString(Sharedkeys.token,token );
      if(istok==true){
return true;      
}
     return false;

}
String? get(){
  return _sharedPreferences.getString(Sharedkeys.token);

}
Future<bool> delete()async{
    return await _sharedPreferences.remove(Sharedkeys.token);
}

}