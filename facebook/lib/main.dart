import 'package:stack/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stack/providers/cart_prov.dart';
import 'package:stack/providers/wish_prov.dart';
import 'package:stack/router/route_manager.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
designSize: const Size(375,1112),
      builder:(BuildContext context,Widget? child)=>MultiProvider(
        providers: [
          //pura app ekhon auth provider and cart provider er scope e ashlo
          ChangeNotifierProvider(create: (context)=>AuthProvider()),
          ChangeNotifierProvider(create: (context)=>Cart_prov()),
                    ChangeNotifierProvider(create: (context)=>Wish_prov()),


        ],
        child:   MaterialApp.router(
          routerConfig: RouteManager.routercon,
          title: 'Material App',
        ),
      ),
    );
  }
}

