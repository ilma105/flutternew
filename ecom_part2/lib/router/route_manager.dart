// ignore_for_file: non_constant_identifier_names

import 'package:ecom_part2/models/product_model.dart';
import 'package:ecom_part2/pages/detailspage/ui/details_page.dart';
import 'package:ecom_part2/pages/main_page/ui/main_page.dart';
import 'package:go_router/go_router.dart';

import '../pages/login.dart';
import 'middlewares/auth_middle.dart';

class RouteManager {
  static final routercon = GoRouter(
    routes: [
      GoRoute(
          name: Routenames.Main_PAGE,
          //first route for homepage
          path: Routenames.Main_PAGE,
          //eikhane bole dichi / diye home page bujhachi
          builder: (context, state) => const MainPage(),
          redirect: (context, state) => AuthMiddleWare.guardwihtlogin(),
          routes: [GoRoute(path: Routenames.details,
          name: Routenames.details,
          builder: (context, state) => DetailsPage(product: state.extra as ProductModel,),
          
          
          )]),
      GoRoute(
        name: Routenames.LOGIN,
        //first route for homepage
        path: Routenames.LOGIN,
        //eikhane bole dichi / diye home page bujhachi
        builder: (context, state) => const LogIn(),
      ),
    ],
  );
}

abstract class Routenames {
  static String Main_PAGE = '/main';

  static String LOGIN = '/';
  static String third = 'thirdpage';
  static String details = 'details';
}
