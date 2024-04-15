// ignore_for_file: use_build_context_synchronously, duplicate_ignore


import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokercat/addexpense/db/functions/category_functions.dart';
import 'package:pokercat/addexpense/db/functions/transaction_function.dart';
import 'package:pokercat/addexpense/db/models/category/category_model_db.dart';
import 'package:pokercat/addexpense/db/models/transactions/transaction_model_db.dart';
import 'package:pokercat/constant.dart';
import 'package:pokercat/global/component/appbar.dart';
import 'package:pokercat/pages/cashgame.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetAppSettings extends StatelessWidget {
  const ResetAppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pcScafoldColor,
      appBar: Appbar(
        titleStr: 'Reset App',
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 15),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: const Text(
                    'Complete Reset',
                    style: TextStyle(
                        fontSize: 15, color: AppTheme.pcTextSecondayColor),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    resetApp(context);
                  },
                  icon: const Icon(Icons.delete_forever_outlined,
                      color: AppTheme.pcTextTertiaryColor),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: const Text(
                    'Reset Transactions Only',
                    style: TextStyle(
                        fontSize: 15, color: AppTheme.pcTextSecondayColor),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    resetTransactionsOnly(context);
                  },
                  icon: const Icon(Icons.delete_forever_outlined,
                      color: AppTheme.pcTextTertiaryColor),
                ),
              ],
            ),
            const Divider(
                thickness: 1, color: AppTheme.pcSecondaryDividerColor),
          ],
        ),
      ),
    );
  }

  resetApp(value) {
    showDialog(
      context: value,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: AppTheme.pcWaveColor,
          content: const Text('Reseting app will erase all your data.'),
          title: const Text(
            'Do you want to reset app?',
            style: TextStyle(
              color: AppTheme.pcTextQuaternaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                await preferences.clear();
                SharedPreferences textcontrol =
                    await SharedPreferences.getInstance();
                await textcontrol.clear();
                final categoryDb =
                    await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
                final transactionDB =
                    await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
                categoryDb.clear();
                transactionDB.clear();
                // HoemeScreen.selectedIndexNotifier = ValueNotifier(0);
                // 임의로 지움
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const CashGame()));
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: AppTheme.pcTextQuaternaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'No',
                style: TextStyle(
                  color: AppTheme.pcTextQuaternaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  resetTransactionsOnly(value) {
    showDialog(
      context: value,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: AppTheme.pcWaveColor,
          content: const Text(
              'Reseting transaction will erase all your transaction data.'),
          title: const Text(
            'Do you want to delete all transactions?',
            style: TextStyle(
              color: AppTheme.pcTextQuaternaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final transactionDB =
                    await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
                transactionDB.clear();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: AppTheme.pcTextQuaternaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'No',
                style: TextStyle(
                  color: AppTheme.pcTextQuaternaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
