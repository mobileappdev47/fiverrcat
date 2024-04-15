import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import '../../../../imports.dart';
import 'user_repository.dart';

AuthProvider get authProvider => Get.find();

class AuthProvider {
  AuthProvider._();
  static final auth = FirebaseAuth.instance;
  String get uid => auth.currentUser?.uid ?? '';
  final rxUser = Rxn<User>();
  User? get user => rxUser.value;
  final isLoggedIn = false.obs;
  RxBool isAuthenticated=  true.obs;



  static Future<AuthProvider> init() async {
    final c = AuthProvider._();
    Get.put(c);

    return c;
  }

  Future<void> login() async {
    try {
      if (uid.isEmpty) return;
      await _fetchUser();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _fetchUser() async {
    if (uid.isEmpty) return;
    final user = await UserRepository.fetchUser();//db에서 data usermodel에 올리는부분
    if (user != null) {

      isLoggedIn(true);
      updateUser(user); //usermodel data를 getx에 태우는 부분.
      UserRepository.updateActiveAt(true);
    }
  }

  Future<void> updateUser(User user) async {
    if (user.isBanned) {
      await logout();
    } else {
      rxUser(user);
    }
  }

  Future<void> logout() async {
    try {
      if (Get.context != null) {
        Get.until((r) => r.isFirst);
      }
      isLoggedIn(false);
      rxUser.value = null;
      await auth.signOut();

    } catch (e) {
      debugPrint(e.toString());
    }
  }

}
