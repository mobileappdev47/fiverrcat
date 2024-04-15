import 'package:flutter/material.dart';
import 'package:pokercat/constant.dart';
import '../auth/data/constant.dart';
import '../auth/data/localdb.dart';
import '../getx_route/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? isLogin = false;

  loginControl() async {
    await LocalDataSaver.getLogData().then((value) {
      setState(() {
        isLogin = value;
      });
    });
    if (isLogin == true) {
      Constant.name = (await LocalDataSaver.getName())!;
      Constant.email = (await LocalDataSaver.getEmail())!;
      Constant.img =
          (await LocalDataSaver.getImg()) ?? 'assets/images/catpic3.png';

      AppRoutes.moveToPage(AppLinks.btmNavi, getOffAll: true);
    } else {
      AppRoutes.moveToPage(AppLinks.signIn, getOffAll: true);
    }
  }

  @override
  void initState() {
    super.initState();
    loginControl();
  }

  // void loginControl() async {
  //   // bool status = await AuthController.isLoginUser() as bool;
  //   bool? isUserlogged = await LocalDataSaver.getLogData();
  //   print('1232$isUserlogged');
  //   if (isUserlogged == true) {
  //
  //     AppRoutes.moveToPage(AppLinks.btmNavi, getOffAll: true);
  //   } else {
  //
  //     AppRoutes.moveToPage(AppLinks.signIn, getOffAll: true);
  //   }
  //
  // Future.delayed(Duration(seconds: 3), () async {
  //   final token = await SharedPreferencesHelper().getAuthToken();
  //   print('token = $token');
  //   if (token != null && token.isNotEmpty) {
  //     AppRoutes.moveToPage(AppLinks.btmNavi, getOffAll: true);
  //   } else {
  //     AppRoutes.moveToPage(AppLinks.signIn, getOffAll: true);
  //   }
  // }
  //
  // );
  //}
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.pcScafoldColor,
      body: Center(
        child: Text('.'),
      ),
    );
  }
}
