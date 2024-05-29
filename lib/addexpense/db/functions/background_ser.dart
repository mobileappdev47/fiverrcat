import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';

import 'package:pokercat/addexpense/db/functions/transaction_function.dart';

void onStart(ServiceInstance service) async {
  // Only available for flutter_background_service v2.0.0 and later
  DartPluginRegistrant.ensureInitialized();
  await Firebase.initializeApp();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setForegroundNotificationInfo(
        title: "Background Service",
        content: "Running",
      );
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // Timer.periodic(Duration(days: 1), (timer) async {
  //   var user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     await HiveFirestoreBackupData1.backupDataToFirestore(user.email, 1);
  //   }
  // });
}

void initializeService() {
  FlutterBackgroundService().configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      isForegroundMode: true,
      autoStart: true,
      // foregroundServiceNotificationContent: "Running",
      // foregroundServiceNotificationTitle: "Background Service",
    ),
    iosConfiguration: IosConfiguration(
      onForeground: onStart,
      autoStart: true,
    ),
  );
}
