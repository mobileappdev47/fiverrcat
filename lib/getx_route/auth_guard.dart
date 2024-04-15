import 'package:flutter/material.dart';

import '../imports.dart';

class AuthGuard extends GetMiddleware {
//   Get the auth service
  final authProvider = Get.find<AuthProvider>();
  
//   The default is 0 but you can update it to any number. Please ensure you match the priority based
//   on the number of guards you have.
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
      
      // 로그인 되어 있으면 route를 하고 안되어 있으면 로그인 페이지로 넘긴다. 
      if (!authProvider.isAuthenticated()) return const RouteSettings(name: AppLinks.login);
      return null;
      // 로그인 되었을 경우 특정 페이지로 강제로 보내는 코드
      //return RouteSettings(name: AppLinks.hotelHomeScreen);
  }
}