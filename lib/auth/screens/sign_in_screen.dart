
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../global/utils.dart';

import '../../../global/component/apple_login_button.dart';
import '../../../global/component/google_login_button.dart';
import '../../../imports.dart';
import '../../global/common_size.dart';
import '../../global/component/appbar.dart';
import '../data/constant.dart';
import '../data/localdb.dart';
import '../data/sns_firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' ;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Future<void> checkUserLogged() async
  {

    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user != null)
    {
      Constant.name = (await LocalDataSaver.getName())??'admincat';
      Constant.email = (await LocalDataSaver.getEmail())??'vip@admin.cat';
      Constant.img = (await LocalDataSaver.getImg())??'admincat';
      AppRoutes.moveToPage(AppLinks.btmNavi, getOffAll: true);
      if(Constant.email =='vip@admin.cat'){
        await authProvider.logout();
        await SnsAuthWithFirebase().googleLogout();
        AppRoutes.moveToPage(AppLinks.signIn, getOffAll: true);
        //혹시 admin 아이디로 접속하면 그냥 로그아웃 시킴
      }
      print('name = ${Constant.name},email = ${Constant.email},img = ${Constant.img}');
    }
  }



  @override
  void initState() {
    super.initState();
    print('여기는 로그인페이지');
    checkUserLogged();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pcScafoldColor,
      appBar: const Appbar(
        titleStr: 'PokerCat',

      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: common_l_gap,
              ),
              Image.asset(
                'assets/images/catpic3.png',
                height: 100,
                width: 100,
              ),


              SizedBox(height: 10.h),
              GoogleSignInButton(
                  centered: true,
                  onPressed: () async {
                    await SnsAuthWithFirebase().signInWithGoogle();

                    if (authProvider.isLoggedIn()) {
                      Constant.name = (await LocalDataSaver.getName())??'a';
                      Constant.email = (await LocalDataSaver.getEmail())??'b';
                      Constant.img = (await LocalDataSaver.getImg())??'c';
                      BotToast.showText(text: 'Google Login Success');
                      AppRoutes.moveToPage(AppLinks.btmNavi, getOffAll: true);

                    }
                  }),

              AppleSignInButton(
                  centered: true,
                  onPressed: () async {
                    await SnsAuthWithFirebase().signInWithApple();
                    if (authProvider.isLoggedIn()) {
                      Constant.name = (await LocalDataSaver.getName())??'${'user'}${getRandomString(5)}';
                      Constant.email = (await LocalDataSaver.getEmail())??'apple.com';
                      Constant.img = (await LocalDataSaver.getImg())??'c';
                      BotToast.showText(text: 'Apple Login Success');
                      AppRoutes.moveToPage(AppLinks.btmNavi, getOffAll: true);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
