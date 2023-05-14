// import 'package:ecom_part2/pages/login.dart';
import 'package:ecom_part2/pages/providers/auth_prov.dart';
import 'package:ecom_part2/pages/providers/cart_prov.dart';
import 'package:ecom_part2/pages/providers/wishprov.dart';
import 'package:ecom_part2/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

designSize:const  Size(300, 800),
      builder:(BuildContext context,Widget? child)=>
      
      MultiProvider(
        providers: [
          //sob jaigai authprov er access pabo ekhon
          ChangeNotifierProvider(create: (context)=>AuthProv()),
                    ChangeNotifierProvider(create: (context)=>Cart_prov()),
                            ChangeNotifierProvider(create: (context)=>Wish_prov())


        ],
        child:  MaterialApp.router(
          routerConfig:RouteManager.routercon ,
          title: 'Material App',
        ),
      ),
    );
  }
}

