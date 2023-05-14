import 'package:go_router/go_router.dart';
import 'package:stack/models/product_model.dart';
import 'package:stack/pages/detailspage/detailspage.dart';
import 'package:stack/pages/login.dart';
import 'package:stack/pages/main_page/ui/main_page.dart';

import 'midlewares/auth_middleware.dart';

class RouteManager {
  static final routercon = GoRouter(
    routes: [
      GoRoute(
        name: Routenames.logi,
        //first route for homepage
        path: '/',
        //eikhane bole dichi / diye home page bujhachi
        builder: (context, state) => Login(),
        //redirect kore homepage e niye jabe
      ),
      GoRoute(
        name: Routenames.main_page,
        //first route for homepage
        path: "/main",
        //eikhane bole dichi / diye home page bujhachi
        builder: (context, state) => const MainPage(),
        //redirect kore login e niye jabe
        routes: [GoRoute(path: Routenames.details,
        name:Routenames.details ,
        builder: (context, state) =>  DetailsPage(product: state.extra as ProductModel,),
        )
        ],
        redirect: (context, state) => Authmidleware.guardwithlogin(),
      ),
    ],
  );
}

abstract class Routenames {
  static String main_page = '/main';

  static String logi = '/';
  static String details = 'details';
}
