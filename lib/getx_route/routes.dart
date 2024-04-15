
import 'package:pokercat/pages/cashgame.dart';
import 'package:pokercat/pages/splash_screen.dart';

import '../auth/screens/sign_in_screen.dart';
import '../imports.dart';

import '../pages/btmnavigation.dart';


/*route 작성 규칙, 자세한 내용은 /docs/route_guide.md 파일을 참고 한다.
1. widget(page) 이름과 동일하게 GetPage name, AppLinks variable을 지정 한다.(단, lowerCamelCase 사용)
2. authenticate가 필요한 page에는 AuthGuard를 middle ware로 추가 한다.


//ex . AppRoutes.moveToPage(AppLinks.btmNavi, getOffAll: true);
참고: https://medium.com/@brianmwangi_dev/better-navigation-in-flutter-using-getx-ceeedd5c8f28
*/

class AppRoutes {
  static final pages = [



    GetPage(
      name: AppLinks.signIn,
      page: () => const SignInScreen(),
      transition: Transition.fadeIn,
    ),


    GetPage(
      name: AppLinks.btmNavi,
      page: () => const BtmNavi(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppLinks.cashGame,
      page: () => const CashGame(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppLinks.splash,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),

  ];



  static Future<void> moveToPage(String routeName,{bool getOff=false,bool getOffAll=false, dynamic arguments}) async {
    if(getOff){
      Get.offNamed(routeName,arguments: arguments);
    }else if(getOffAll){
      Get.offAllNamed(routeName,arguments: arguments);
    }else{
      Get.toNamed(routeName,arguments: arguments);
    }
  }
}

class AppLinks {

  static const String login = "/login";

  static const String signIn = "/sign_in";
  static const String cashGame = "/cash_game";

  static const String btmNavi = "/bottom_navigation_screen";
  static const String splash = "/splash_screen";


}