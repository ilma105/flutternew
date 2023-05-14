// ignore_for_file: use_build_context_synchronously

import 'package:ecom_part2/pages/providers/auth_prov.dart';
import 'package:ecom_part2/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constraints/colors.dart';
import '../core/widgets/my_app_bar.dart';
// import 'package:http/http.dart' as http;

class LogIn extends StatelessWidget {
  const LogIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        context.goNamed(Routenames.Main_PAGE);

    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:   [
           const AppBarSec(),
           const    _logo(),
                   _LoginSignup(),
              ],
            ),
          ),
        
        
        
        ),
      )
    );
  }
}



class _LoginSignup extends StatelessWidget {
   _LoginSignup();
final TextEditingController _user=TextEditingController();
final TextEditingController _pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text("UserName",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),),
              TextField(
controller: _user,
        decoration: InputDecoration(
          hintText: "example: username",
          fillColor: MyColors.inputBg,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 26.0, horizontal: 18.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: BorderRadius.circular(8.r),
            borderSide:const BorderSide(color: Colors.transparent, width: 0),
          ),
        ),

              ),
     SizedBox(height: 10.h,),  
           Text("Password",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),),


                   TextField(
                    controller: _pass,
 //password er jonno
 obscureText: true,
        decoration: InputDecoration(
          hintText: "example: password",
          fillColor: MyColors.inputBg,
          filled: true,
          contentPadding:
            const  EdgeInsets.symmetric(vertical: 26.0, horizontal: 18.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide:const BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide:const BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: BorderRadius.circular(8.r),
            borderSide:const BorderSide(color: Colors.transparent, width: 0),
          ),
        ),

              ),
    SizedBox(height: 12.h,),  
    
    Consumer<AuthProv>(
      
      builder:(comtext,authprov,_)=> authprov.haserr? Center(child: Text("${authprov.errmessage}",style: const TextStyle(color: Colors.red),)
      
      ):Container(),
      
      ),
    const SizedBox(height: 26.0,),
    
    SizedBox(
      width: double.infinity,
      height: 46.h,

      child: ElevatedButton(onPressed: ()async{
String user=_user.text;
String pass =_pass.text;
bool isloginsucceed=await Provider.of<AuthProv>(context,listen: false).login(user, pass);
 
   final prefs = await SharedPreferences.getInstance();
  await prefs.setString("name", user);

 
 if(isloginsucceed){
  context.goNamed(Routenames.Main_PAGE);
 }
   },
      style: ElevatedButton.styleFrom(
        
        backgroundColor: MyColors.primarycolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
      
      ), 
      //spinner dekhanor jonno Consumer use korchi
      child: Consumer<AuthProv>(

        builder:(context,authprov,_)=>authprov.isload?
     const   CircularProgressIndicator(color: Colors.white,): Text("LogIn",style: 
        TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),
        ),
      ),
         
      ),
    )
     ,
     SizedBox(height: 12.h,),  
    SizedBox(
      width: double.infinity,
      height: 46.h,

      child: ElevatedButton(onPressed: (){},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        
        backgroundColor: MyColors.secondarycolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
      
      ), 
      child: Text("SignUp",style: 
      TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),
      ),
         
      ),
    )
     
     
    ],);
  }
}

// ignore: camel_case_types
class _logo extends StatelessWidget {
  const _logo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:30.0),
      child: Center(
        child: Image.asset("img/logo.png",width: 107.w,),),
    );
  }
}

