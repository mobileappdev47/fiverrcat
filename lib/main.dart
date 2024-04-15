import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokercat/addexpense/db/functions/category_functions.dart';
import 'package:pokercat/addexpense/db/models/account_group/account_group_model_db.dart';
import 'package:pokercat/addexpense/db/models/transactions/transaction_model_db.dart';
import 'package:pokercat/pages/app_settings_screen/income_category_settings/app_default.dart';
import 'package:pokercat/pages/app_settings_screen/income_category_settings/income_category_provider.dart';
import 'package:pokercat/pages/bankroll.dart';
import 'package:pokercat/pages/btmnavigation.dart';
import 'package:pokercat/pages/splash_screen.dart';
import 'addexpense/db/models/category/category_model_db.dart';
import 'addexpense/db/models/currency/curency_model.db.dart';
import 'global/component/preferences.dart';
import 'imports.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CurrencyModelAdapter().typeId)) {
    Hive.registerAdapter(CurrencyModelAdapter());
  }
  if (!Hive.isAdapterRegistered(AccountTypeAdapter().typeId)) {
    Hive.registerAdapter(AccountTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(AccountGroupModelAdapter().typeId)) {
    Hive.registerAdapter(AccountGroupModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }



  //LocaleSettings.useDeviceLocale();
  // Initalize Fire
  // base Core for app, necessary for firebase to work
  await Firebase.initializeApp();

  //init을 통해 get.put injection 수행
  await AppPreferences.init();

  await AuthProvider.init();

  unawaited(MobileAds.instance.initialize());

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  // bool isLogIn = false;
  // getLoggedInState() async{
  //   await LocalDataSaver.getLogData().then((value){
  //     setState((){
  //       isLogIn = value!;
  //       print('islogin=$isLogIn');
  //     });
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    IncomeCategoryProvider().addDefaultCategory(
        AppDefaultIncomeCategory()
            .appDefaultIncomeCategory);
    CategoryDB().getAllCategory();
    // TODO: implement initState
    super.initState();
    // getLoggedInState();
  }
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize:  const Size(360, 640),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: '포커캣',
          //botToast 사용을 위한 builder 등록
          //왜 이런 형태로 하는지 이해는 안됨. 하라니까 함.
          // builder: (_, w) => BotToastInit()(_, w),
          builder: (context, w) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: BotToastInit()(context, w)); },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.grey,
            // textTheme: AppTheme.textTheme,
            platform: TargetPlatform.iOS,
          ),
          navigatorObservers: [
            //botToast사용을 위한 observer를 등록 한다. 이게 왜 필요한지 모르것지만,, package 가이드가 그러하다..
            BotToastNavigatorObserver(),
            //routeObserver를 등록 한다.
            //이것을 왜 getx controller로 inject 하는걸까? 아마도 global하게 가져다 쓰라는 의미 겠지?
            appPrefs.routeObserver,
          ],
          //home: HomePage(),
          // initialRoute: isLogIn ?AppLinks.btmNavi :AppLinks.signIn,
          // initialRoute: AppLinks.splash,
          home: AnimatedSplashScreen(
            splash: 'assets/images/catpic3.png',
            backgroundColor: AppTheme.pcScafoldColor,
            // nextScreen: const SplashScreen(),
            //- for task 테스크를 위해 임시
            nextScreen: const BtmNavi(),
            duration: 100,
            splashTransition: SplashTransition.fadeTransition,
          ),
          getPages: AppRoutes.pages,
        );
      },

    );
  }
}
