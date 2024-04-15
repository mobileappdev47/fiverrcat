import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppTheme {
  AppTheme._();
  static const Color contentColorBlue = Color(0xFF2196F3);

  static const Color contentColorCyan = Color(0xFF50E4FF);
  static const Color mainGridLineColor = Colors.white10;


  static const Color floatingButtonColor = Color(0xFFEA4040);
  static const Color calendarTextColor = Color(0xFFABA4A4);
  static const Color calendarWeekendColor = Color(0xFFEA4040);
  static const Color calendarOutsideTextColor = Color(0xFF363434);
  static const Color calendarHeaderColor = Color(0xff388CC6);
  static const Color calendarMarkerColor = Color(0xff266693);

  static const Color pcScafoldColor = Color(0xFF141414);
  static const Color pcPopUpColor = Color(0xFF1C1A1A);
  static const Color pcPopUpTextFieldColor = Color(0xEFE4E4FF);
  static const Color pcPopUpIconColor = Color(0xff388CC6);
  // static const Color pcBottomNavigatorColor = Color(0xFF000000);

  static const Color pcAppBarColor = const Color(0xff0E0E12);
  // static const Color pcAppBarColor = Color(0xFF000000);

  static const Color pcBottomNavigatorColor = Color(0xff0E0E12);
  static const Color pcBottomNavigatorSelectorColor = Color(0xFFEA4040);
  static const Color pcBottomNavigatorUnSelectorColor = Color(0xFF959191);

  static const Color pcWaveColor = Color(0xFFF9F9F9);
  static const Color pcPrimaryColor = Color(0xFF141414);
  static const Color pcSecondaryColor = Color(0xFF2348DD);
  static const Color pcTextLinkColor = Color(0xFF03A3FF);
  static const Color pcTextLinkColor2 = Color(0xFF016AA7);
  static const Color pcLodingSpinKitColor = Color(0xFF959191);
  static const Color pcTextPrimaryColor = Color(0xFFEA4040);
  static const Color pcTextSecondayColor = Color(0xFFFFFFFF);
  static const Color pcTextTertiaryColor = Color(0xFF9E9E9E);
  static const Color pcTextIncomeColor = Color(0xFF28C216);
  static const Color pcTextExpenseColor = Color.fromARGB(255, 255, 80, 80);
  static const Color pcTextTransferColor = Color(0xFF959191);
  static const Color pcTextQuaternaryColor = Color(0xFF000000);
  static const Color pcTextQuinaryColor = Color(0xFF7C73F6);

  static const Color pcTransactionColor = Color(0xFF1B1B1B);

  static const Color pcShadowColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color pcIncomeColor = Color(0xFF159707);
  static const Color pcExpenseColor = Color(0xFFAD0606);
  static const Color pcTransferColor = Color(0xFF959191);
  static const Color pcTabBarSelectorColor = Color(0xFFEA4040);
  static const Color pcPrimaryDividerColor = Color(0xFF000000);
  static const Color pcSecondaryDividerColor = Color(0xFF4C4C4C);

  static const Color pcFoldColor = Color(0xFF1B1B1B);
  static const Color raiseColor = Color(0xFFC78E4C);
  // static const Color allInColor = Color(0xff9A1B27);
  static const Color allInColor = Color(0xff8f1522);
  // static const Color callColor = Color(0xff1e646e);
  static const Color callColor = Color(0xff0e4b54);
  static final Color alreadyPColor = Colors.grey[700]!;

  static const Color pcBlue1 = Color(0xff388CC6);
  static Color pcBlue1Alpha20 = pcBlue1.withAlpha(20);
  static const Color selectedButtonColor = Color(0xFF016AA7);

  static const Color gray = const Color(0xff0E0E12);
  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color descriptionText = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xEFE4E4FF);
  static const Color pcChartText = Color(0xEFE4E4FF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';

  

}
class AppText {
  static const String appName = 'PokerCat';
  static const String appVersion = 'Version 1.0.0';
  static const String appVersionNumber = ' 1.0.0';
  static const String appUpdateDate = '27-Mar-2024';
  static const String appTermsConditonUpdateDate = '27-Mar-2024';
  static const String authorName = 'Circle lee';
  static const String companyName = 'PokerCat';
  static const String website = 'www.haaaa.com';
  static const String email = 'pokercat911@gmail.com';


}
email() async {
  Uri url = Uri.parse('https://mail.google.com/mail/u/0/#inbox');
  if (await launchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

privacyPolicy() async {
  Uri url = Uri.parse('https://doc-hosting.flycricket.io/pokercat-privacy-policy/8be9441a-4cb4-4e34-952f-273bbda2d892/privacy');
  if (await launchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
termsAndConditions() async {
  Uri url = Uri.parse('https://doc-hosting.flycricket.io/pokercat-terms-of-use/354c72b6-a415-43c6-a7ed-0e55d9eb8276/terms');
  if (await launchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}