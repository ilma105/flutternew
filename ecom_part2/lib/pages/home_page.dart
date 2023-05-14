// ignore_for_file: camel_case_types, avoid_print, use_build_context_synchronously

import 'package:ecom_part2/datasources/token_data.dart';
import 'package:ecom_part2/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HOME_PAGE extends StatelessWidget {
  const HOME_PAGE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:    [
 const Center(child:Text("home page")),
 ElevatedButton(onPressed: ()async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   
   TokenDataSource tokenDataSource=TokenDataSource(sharedPreferences);
  if(await  tokenDataSource.delete()){
print("logged out");

  }
  else{
    print("logged out failed");
  }
   context.goNamed(Routenames.LOGIN);

 }, child:const Text("LogOut"))


          ],
            ),
          ),
        
        
        
        ),
      )
    );
  }
}


