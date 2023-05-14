import 'package:go_router/go_router.dart';
import 'package:stack/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stack/router/route_manager.dart';

import '../core/constraints/my_colors.dart';
// import 'package:http/http.dart' as http;

import '../core/widgets/my_appbar.dart';

class Login extends StatelessWidget {
   Login({
    super.key,
  });
String text="Lets Login oR Sign Up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            
            padding: const EdgeInsets.symmetric(horizontal:24.0),
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Appbarsec(tex: text),
               const _Logosection(),
               _LoginSignupform(),
      
            ],
            
            ),
          ),
        ),
      )
    );
  }
}

class _LoginSignupform extends StatelessWidget {
   _LoginSignupform({
    super.key,
  });
final TextEditingController _user=TextEditingController();
final TextEditingController _pass=TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.goNamed(Routenames.main_page);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
        Text("UserName",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),),
     TextField(
            controller: _user,

      
          decoration: InputDecoration(
            hintText: "example: enter name",
            fillColor: MyColors.inp,
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
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
          ),
        ),
       
       
        SizedBox(
          height: 24.h,),
          Text("Password",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),),
     TextField(
      controller: _pass,
      obscureText: true,

          decoration: InputDecoration(
            hintText: "Your Password",
            fillColor: MyColors.inp,
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
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
          ),
        ),
       SizedBox(
        height: 26.h,
       ),
      
       Consumer<AuthProvider>(
        builder:(context,authprovider,_)=> authprovider.haserror? Center(
        child: Text("${authprovider.errorme}",style: const TextStyle(color: Colors.red),)
        ):Container()
        ),
       
       
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(onPressed: ()async{
            //getting email and pass text
            String usern = _user.text;
            String passw=_pass.text;
    bool isloginsucc=await Provider.of<AuthProvider>(context,listen: false)
    .login(usern,passw);
if(isloginsucc==true){
  context.goNamed(Routenames.main_page);
}
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.bc,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.r)
            )
          ),
           child: Consumer<AuthProvider>(
            
            builder:(context,authprovider,_) => authprovider.isloading?
            const CircularProgressIndicator(color: Colors.white,): Text("LogIn",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),)),
 
          ),
        ),
   
   
     SizedBox(
        height: 26.h,
       ),
    
    
    
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(onPressed: (){
              context.goNamed(Routenames.main_page);
          }, 
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: MyColors.secco,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.r)
            )
          ),
          child: Text("SignUp",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),),

          
          ),
        )
    
    
     ],
    );
  }
}

class _Logosection extends StatelessWidget {
  const _Logosection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: const EdgeInsets.symmetric(vertical:32.0),
      child: Center(
        
      
        child: 
      
        // Image.asset("assests/graphics/common/fblogo.jpg",
        Icon(Icons.facebook,color: Colors.blue,size: 100.0,)
      
        // width: 177.w,),
      
      ),
    );
  }
}


