import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarSec extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AppBarSec();

  @override
  Widget build(BuildContext context) {
    return 
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text("Hello Welcome",style: TextStyle(fontSize: 14.sp),),
                          Text("Let's LogIn or SignUp",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
        
          ],
        ),
     
               const CircleAvatar(backgroundImage: AssetImage("img/waist.png") ,),

      ],
    );
 
 
  }
}

