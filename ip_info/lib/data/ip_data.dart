import 'dart:convert';

import 'package:http/http.dart' as http;

class Ipdata{

  static Future<String> getmyip() async{
http.Response res =await  http.get(Uri.parse("https://api.ipify.org/?format=json"));

if(res.statusCode==200){
  print( jsonDecode(res.body)["ip"]);
return jsonDecode(res.body)["ip"];


}
  return "no ip found";

  }
  static Future<Map> getinfo(String ipaddress) async{
http.Response res =await http.get(Uri.parse("https://ipinfo.io/$ipaddress/geo"));
if(res.statusCode == 200){

return jsonDecode(res.body);
}
return {
   "ip": "failed to fetch ip",
  "city": "failed",
  "region": "failed",
  "country": "failed",
  "loc": "failed",
  "org": " failed",
  "postal": "failed",
  "timezone": "failed",
};
  }
}