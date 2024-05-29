// ignore_for_file: constant_identifier_names, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

import '../models/account_group/account_group_model_db.dart';
import '../models/category/category_model_db.dart';
import '../models/transactions/transaction_model_db.dart';

const ACCOUNT_DB_NAME = 'account-group-database';
ValueNotifier<List<AccountGroupModel>> accountGroupNotifier = ValueNotifier([]);

Future<void> addInitialData() async {
  var box = await Hive.openBox<AccountGroupModel>(ACCOUNT_DB_NAME);

  var defaultModel1 = AccountGroupModel(
    accountType: AccountType.account,
    name: 'Account',
    id: 'account',
    amount: 0,
  );

  var defaultModel2 = AccountGroupModel(
    accountType: AccountType.cash,
    name: 'Cash',
    id: 'cash',
    amount: 0,
  );

  await box.put('account', defaultModel1);
  await box.put('cash', defaultModel2);
  getAllAccountGroup();
}

Future<void> addAccountGroup(AccountGroupModel value) async {
  final accountGroupDB = await Hive.openBox<AccountGroupModel>(ACCOUNT_DB_NAME);
  await accountGroupDB.put(value.id, value);
  getAllAccountGroup();
}

Future<void> editAccountGroup(TransactionModel model) async {
  final accountGroupDB = await Hive.openBox<AccountGroupModel>(ACCOUNT_DB_NAME);
  final accountModel = accountGroupDB.values
      .where((element) => element.id == model.account.name.toLowerCase())
      .first;
  if (model.categoryType == CategoryType.income) {
    accountModel.amount = accountModel.amount! - model.amount;
  } else {
    accountModel.amount = accountModel.amount! + model.amount;
  }
  await accountGroupDB.put(accountModel.id, accountModel);
}

Future<void> updateAccountGroup(TransactionModel model,
    [bool isDeleting = false]) async {
  final accountGroupDB = await Hive.openBox<AccountGroupModel>(ACCOUNT_DB_NAME);
  final accountModel = accountGroupDB.values
      .where((element) => element.id == model.account.name.toLowerCase())
      .first;
  if (model.categoryType == CategoryType.income) {
    if (isDeleting) {
      accountModel.amount = accountModel.amount! - model.amount;
    } else {
      accountModel.amount = accountModel.amount! + model.amount;
    }
  } else {
    if (isDeleting) {
      accountModel.amount = accountModel.amount! + model.amount;
    } else {
      accountModel.amount = accountModel.amount! - model.amount;
    }
  }
  await accountGroupDB.put(accountModel.id, accountModel);
  getAllAccountGroup();
}

// Future<void> updateAccountGroup(TransactionModel model,
//     [bool isDeleting = false]) async {
//   final accountGroupDB = await Hive.openBox<AccountGroupModel>(ACCOUNT_DB_NAME);
//   final accountModels = accountGroupDB.values
//       .where((element) => element.id == model.account.name.toLowerCase())
//       .toList();
//
//   // Check if accountModels is not empty
//   if (accountModels.isNotEmpty) {
//     final accountModel = accountModels.first;
//
//     if (model.categoryType == CategoryType.income) {
//       if (isDeleting) {
//         accountModel.amount = accountModel.amount! - model.amount;
//       } else {
//         accountModel.amount = accountModel.amount! + model.amount;
//       }
//     } else {
//       if (isDeleting) {
//         accountModel.amount = accountModel.amount! + model.amount;
//       } else {
//         accountModel.amount = accountModel.amount! - model.amount;
//       }
//     }
//
//     await accountGroupDB.put(accountModel.id, accountModel);
//     getAllAccountGroup();
//   } else {
//     // Handle the case where no account model was found
//     print('No account model found with the name: ${model.account.name.toLowerCase()}');
//   }
// }



Future<void> selfTransfer(
    {required String accountType, required double amount}) async {
  final accountGroupDB = await Hive.openBox<AccountGroupModel>(ACCOUNT_DB_NAME);
  final accountModel = accountGroupDB.values
      .where((element) => element.id == accountType.toLowerCase())
      .first;
  accountModel.amount = accountModel.amount! - amount;
  await accountGroupDB.put(accountModel.id, accountModel);
  final accountModel2 = accountGroupDB.values
      .where((element) => element.id != accountType.toLowerCase())
      .first;
  accountModel2.amount = accountModel2.amount! + amount;
  await accountGroupDB.put(accountModel2.id, accountModel2);
  getAllAccountGroup();
}

Future<List<AccountGroupModel>> getAllAccountAmount() async {
  final accountGroupDB = await Hive.openBox<AccountGroupModel>(ACCOUNT_DB_NAME);
  return accountGroupDB.values.toList();
}

Future<void> getAllAccountGroup() async {
  final accountGroupDB = await Hive.openBox<AccountGroupModel>(ACCOUNT_DB_NAME);
  accountGroupNotifier.value.clear();
  accountGroupNotifier.value.addAll(accountGroupDB.values);
  accountGroupNotifier.notifyListeners();
}




// hive store data in firebase

class HiveFirestoreBackup {
  static const String ACCOUNT_DB_NAME = 'account_db';

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Future<void> backupDataToFirestore() async {
    try {
      var accountGroupList = await getAllAccountAmount();
      await _backupAccountGroupData(accountGroupList);
      print('Data backed up successfully to Firestore');
    } catch (e) {
      print('Error backing up data to Firestore: $e');
    }
  }

  // static Future<void> backupDataToFirestore() async {
  //   var accountGroupList = await getAllAccountAmount();
  //   await _backupAccountGroupData(accountGroupList);
  // }

  static Future<List<AccountGroupModel>> getAllAccountAmount() async {
    final accountGroupDB = await Hive.openBox<AccountGroupModel>(ACCOUNT_DB_NAME);
    return accountGroupDB.values.toList();
  }

  static Future<void> _backupAccountGroupData(List<AccountGroupModel> accountGroupList) async {
    try {
      for (var accountGroup in accountGroupList) {
        var firestoreData = {
          'accountType': accountGroup.accountType.toString(),
          'name': accountGroup.name,
          'id': accountGroup.id,
          'amount': accountGroup.amount,
        };

        await firestore.collection('account_groups').doc(accountGroup.id).set(firestoreData);
      }
    } catch (e) {
      print('Error backing up data to Firestore: $e');
    }
  }
}


Future<void> addInitialData1() async {
  var box = await Hive.openBox<AccountGroupModel>(ACCOUNT_DB_NAME);

  var defaultModel1 = AccountGroupModel(
    accountType: AccountType.account,
    name: 'Account',
    id: 'account',
    amount: 0,
  );

  var defaultModel2 = AccountGroupModel(
    accountType: AccountType.cash,
    name: 'Cash',
    id: 'cash',
    amount: 0,
  );

  await box.put('account', defaultModel1);
  await box.put('cash', defaultModel2);

  await storeDataInFirestore(defaultModel1);
  await storeDataInFirestore(defaultModel2);

  // Show a message or perform any additional actions after backup
  print('Data backed up to Firestore');
}

Future<void> storeDataInFirestore(AccountGroupModel model) async {
  try {
    await FirebaseFirestore.instance.collection('account_groups').doc(model.id).set({
      'accountType': model.accountType.toString(),
      'name': model.name,
      'id': model.id,
      'amount': model.amount,
    });
  } catch (e) {
    print('Error storing data in Firestore: $e');
  }
}