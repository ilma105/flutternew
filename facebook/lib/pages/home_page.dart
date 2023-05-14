import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack/datasource/tokendata.dart';

import '../router/route_manager.dart';

class HoemPage extends StatelessWidget {
  const HoemPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const Text("Homepage"),
              ElevatedButton(onPressed: ()async{
              SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
TokenData tokenData=TokenData(sharedPreferences);
   if( await tokenData.delete()){
    print("logedout");
   }
   else{
    print("logging out failed");
   }
                context.goNamed(Routenames.logi);
              }, child:const  Text("Log Out"))
            ]
          ),
        ),
      )
    );
  }
}
