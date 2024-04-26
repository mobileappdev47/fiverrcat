import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pokercat/addexpense/db/functions/account_group_function.dart';
import 'package:pokercat/addexpense/db/models/transactions/transaction_model_db.dart';
import 'package:pokercat/auth/data/auth_provider.dart';
import 'package:pokercat/auth/data/sns_firebase_auth.dart';
import 'package:pokercat/getx_route/routes.dart';
import 'package:pokercat/constant.dart';
import 'package:pokercat/global/component/appbar.dart';

import 'package:pokercat/pages/app_settings_screen/currency_selector/currency_selector.dart';
import 'package:pokercat/pages/app_settings_screen/income_category_settings/income_category_list_view.dart';

import 'package:pokercat/pages/profile.dart';
import 'dart:math' as math;

import '../../addexpense/db/functions/transaction_function.dart';
import 'reset_app_settings/reset_app_settings.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({super.key});

  void showBackupConfirmationDialog(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    return Scaffold(
      backgroundColor: AppTheme.pcScafoldColor,
      appBar: const Appbar(
        titleStr: 'App Settings',
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView(
              // physics: const NeverScrollableScrollPhysics(),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              children: [
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IncomeCategoryList(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.rotate(
                          angle: 180 * math.pi / 180,
                          child: const Icon(
                            Ionicons.share_outline,
                            size: 25,
                            color: AppTheme.pcBottomNavigatorUnSelectorColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Category Edit',
                          style: TextStyle(
                            color: AppTheme.pcBottomNavigatorUnSelectorColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CurencySelection(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Ionicons.cash_outline,
                          size: 25,
                          color: AppTheme.pcBottomNavigatorUnSelectorColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Currency',
                          style: TextStyle(
                            color: AppTheme.pcBottomNavigatorUnSelectorColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetAppSettings(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings_backup_restore_outlined,
                          size: 25,
                          color: AppTheme.pcBottomNavigatorUnSelectorColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Reset App',
                          style: TextStyle(
                            color: AppTheme.pcBottomNavigatorUnSelectorColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 25,
                          color: AppTheme.pcBottomNavigatorUnSelectorColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: AppTheme.pcBottomNavigatorUnSelectorColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () async {
                    await authProvider.logout();
                    await SnsAuthWithFirebase().googleLogout();

                    AppRoutes.moveToPage(AppLinks.signIn, getOffAll: true);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout,
                          size: 25,
                          color: AppTheme.pcBottomNavigatorUnSelectorColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Log Out',
                          style: TextStyle(
                            color: AppTheme.pcBottomNavigatorUnSelectorColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () async {
                    final UserCredential userCredential =
                        await signInWithGoogle();
                    List<TransactionModel> transactions =
                        await TransactionDB.instance.getAllTransactions();
                    // List<TransactionModel> transactionsMonth=  await TransactionDB.instance.getTransactionsForCurrentMonth();
                    print(transactions);
                    //   print(transactionsMonth);

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Backup Data'),
                          content: const Text('Are you sure you want to back up your data?'),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    HiveFirestoreBackupData.backupDataToFirestore(
                                        userCredential.user!.email);
                                    Navigator.of(context).pop(); // Closes the dialog

                                  },
                                  child: const Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Closes the dialog
                                  },
                                  child: const Text('No'),
                                ),
                              ],
                            ),

                          ],
                        );
                      },
                    );


                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_to_drive_outlined,
                          size: 25,
                          color: AppTheme.pcBottomNavigatorUnSelectorColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Backup',
                          style: TextStyle(
                            color: AppTheme.pcBottomNavigatorUnSelectorColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // IconButton(
                //     onPressed: () async {
                //       final UserCredential userCredential = await signInWithGoogle();
                //       final String userEmail = userCredential.user!.email.toString();
                //       await FirebaseBackupDataRetrieval1.getUserTransactionsAndStore();
                //     },
                //     icon: Icon(Icons.add))
              ],
            ),
          ),
        ),
      ),

    );
  }
}
