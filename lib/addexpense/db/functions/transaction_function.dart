// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, non_constant_identifier_names

import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokercat/addexpense/db/functions/account_group_function.dart';
import 'package:pokercat/addexpense/db/models/account_group/account_group_model_db.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/category/category_model_db.dart';
import '../models/transactions/transaction_model_db.dart';

// ignore: constant_identifier_names
const TRANSACTION_DB_NAME = 'transaction-db';

abstract class TransactionDBFunctions {
  Future<void> addTransaction(TransactionModel objects);

  Future<List<TransactionModel>> getAllTransactions();

  Future<void> deleteTransaction(TransactionModel model);
}

class TransactionDB implements TransactionDBFunctions {
  TransactionDB.internal();

  static TransactionDB instance = TransactionDB.internal();

  factory TransactionDB() {
    return instance;
  }

  ValueNotifier<List<TransactionModel>> transactionListNotifier =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> transactionMonthListNotifier =
      ValueNotifier([]);
  String? selectedCatogory;

  @override
  Future<void> addTransaction(TransactionModel value) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await transactionDB.put(value.id, value);
    await updateAccountGroup(value);
    refresh();
  }

  Future<void> refresh() async {
    final list = await getAllTransactions();
    list.sort((first, second) => second.date.compareTo(first.date));
    final listForMonth = await getTransactionsForCurrentMonth();
    listForMonth.sort((first, second) => second.date.compareTo(first.date));
    transactionListNotifier.value.clear();
    transactionMonthListNotifier.value.clear();
    transactionListNotifier.value.addAll(list);
    transactionMonthListNotifier.value.addAll(listForMonth);
    transactionListNotifier.notifyListeners();
    transactionMonthListNotifier.notifyListeners();
  }

  Future<List<TransactionModel>> getTransactionsForCurrentMonth() async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);
    final box = Hive.box<TransactionModel>(TRANSACTION_DB_NAME);
    final results = box.values.where((trxn) =>
        DateTime.parse(trxn.date)
            .isAfter(startOfMonth.subtract(const Duration(days: 1))) &&
        DateTime.parse(trxn.date)
            .isBefore(endOfMonth.add(const Duration(days: 1))));
    return results.toList();
  }

  Future<List<TransactionModel>> getTransactionsForMonth(month) async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, month, 1);
    final endOfMonth = DateTime(now.year, month, 31);
    final box = Hive.box<TransactionModel>(TRANSACTION_DB_NAME);
    final results = box.values.where((trxn) =>
        DateTime.parse(trxn.date)
            .isAfter(startOfMonth.subtract(const Duration(days: 1))) &&
        DateTime.parse(trxn.date)
            .isBefore(endOfMonth.add(const Duration(days: 1))));
    return results.toList();
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return transactionDB.values.toList();
  }

  @override
  Future<void> deleteTransaction(TransactionModel model) async {
    final db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await updateAccountGroup(model, true);
    await db.delete(model.id);
    refresh();
  }

  Future<void> editTransactionDb(int id, TransactionModel model) async {
    final db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    final tempModel = db.values.where((element) => element.id == id).first;
    await db.put(id, model);
    await editAccountGroup(tempModel);
    await updateAccountGroup(model);
    refresh();
  }

  Future<void> search(String text) async {
    final db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    List<TransactionModel>? filteredList;

    if (selectedCatogory == 'Income') {
      filteredList = db.values
          .where((element) =>
              element.categoryType == CategoryType.income &&
              element.category.name
                  .toLowerCase()
                  .trim()
                  .contains(text.toLowerCase()))
          .toList()
        ..sort((first, second) => second.date.compareTo(first.date));
    } else if (selectedCatogory == 'Expense') {
      filteredList = db.values
          .where((element) =>
              element.categoryType == CategoryType.expense &&
              element.category.name
                  .toLowerCase()
                  .trim()
                  .contains(text.toLowerCase()))
          .toList()
        ..sort((first, second) => second.date.compareTo(first.date));
    } else if (selectedCatogory == "All") {
      filteredList = db.values
          .where((element) => element.category.name
              .toLowerCase()
              .trim()
              .contains(text.toLowerCase()))
          .toList()
        ..sort((first, second) => second.date.compareTo(first.date));
    } else {
      filteredList = db.values
          .where((element) => element.category.name
              .toLowerCase()
              .trim()
              .contains(text.toLowerCase()))
          .toList()
        ..sort((first, second) => second.date.compareTo(first.date));
    }
    transactionListNotifier.value.clear();
    transactionListNotifier.value.addAll(filteredList);
    transactionListNotifier.notifyListeners();
  }

  Future<void> filter(String text) async {
    if (text == 'Income') {
      final transactionDB =
          await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
      transactionListNotifier.value.clear();
      transactionListNotifier.value.addAll(transactionDB.values
          .where((element) => element.categoryType == CategoryType.income)
          .toList()
        ..sort((first, second) => second.date.compareTo(first.date)));
      selectedCatogory = "Income";
      transactionListNotifier.notifyListeners();
    } else if (text == 'Expense') {
      final transactionDB =
          await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
      transactionListNotifier.value.clear();
      transactionListNotifier.value.addAll(transactionDB.values
          .where((element) => element.categoryType == CategoryType.expense)
          .toList()
        ..sort((first, second) => second.date.compareTo(first.date)));
      selectedCatogory = "Expense";
      transactionListNotifier.notifyListeners();
    } else if (text == "All") {
      selectedCatogory = "All";
      refresh();
      transactionListNotifier.notifyListeners();
    }
  }

  Future<void> filterDataByDate(String dateRange) async {
    final TransactionDb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    List<TransactionModel> dateFilterList = [];
    if (dateRange == 'today') {
      if (selectedCatogory == "Income") {
        dateFilterList = TransactionDb.values
            .where((element) =>
                element.categoryType == CategoryType.income &&
                DateTime.parse(element.date).day == DateTime.now().day &&
                DateTime.parse(element.date).month == DateTime.now().month &&
                DateTime.parse(element.date).year == DateTime.now().year)
            .toList()
          ..sort((first, second) => second.date.compareTo(first.date));
      } else if (selectedCatogory == "Expense") {
        dateFilterList = TransactionDb.values
            .where((element) =>
                element.categoryType == CategoryType.expense &&
                DateTime.parse(element.date).day == DateTime.now().day &&
                DateTime.parse(element.date).month == DateTime.now().month &&
                DateTime.parse(element.date).year == DateTime.now().year)
            .toList()
          ..sort((first, second) => second.date.compareTo(first.date));
      } else {
        dateFilterList = TransactionDb.values
            .where((element) =>
                DateTime.parse(element.date).day == DateTime.now().day &&
                DateTime.parse(element.date).month == DateTime.now().month &&
                DateTime.parse(element.date).year == DateTime.now().year)
            .toList()
          ..sort((first, second) => second.date.compareTo(first.date));
        transactionListNotifier.notifyListeners();
      }
    } else if (dateRange == 'yesterday') {
      if (selectedCatogory == "Income") {
        dateFilterList = TransactionDb.values
            .where((element) =>
                element.categoryType == CategoryType.income &&
                DateTime.parse(element.date).day == DateTime.now().day - 1 &&
                DateTime.parse(element.date).month == DateTime.now().month &&
                DateTime.parse(element.date).year == DateTime.now().year)
            .toList()
          ..sort((first, second) => second.date.compareTo(first.date));
      } else if (selectedCatogory == "Expense") {
        dateFilterList = TransactionDb.values
            .where((element) =>
                element.categoryType == CategoryType.expense &&
                DateTime.parse(element.date).day == DateTime.now().day - 1 &&
                DateTime.parse(element.date).month == DateTime.now().month &&
                DateTime.parse(element.date).year == DateTime.now().year)
            .toList()
          ..sort((first, second) => second.date.compareTo(first.date));
      } else {
        dateFilterList = TransactionDb.values
            .where((element) =>
                DateTime.parse(element.date).day == DateTime.now().day - 1 &&
                DateTime.parse(element.date).month == DateTime.now().month &&
                DateTime.parse(element.date).year == DateTime.now().year)
            .toList()
          ..sort((first, second) => second.date.compareTo(first.date));
        transactionListNotifier.notifyListeners();
      }
    } else if (dateRange == 'last week') {
      final DateTime today = DateTime.now();
      final DateTime weekAgo = today.subtract(const Duration(days: 7));

      if (selectedCatogory == "Income") {
        dateFilterList = TransactionDb.values
            .where((element) =>
                element.categoryType == CategoryType.income &&
                DateTime.parse(element.date).isAfter(weekAgo) &&
                DateTime.parse(element.date).isBefore(today))
            .toList()
          ..sort((first, second) => second.date.compareTo(first.date));
      } else if (selectedCatogory == "Expense") {
        dateFilterList = TransactionDb.values
            .where((element) =>
                element.categoryType == CategoryType.expense &&
                DateTime.parse(element.date).isAfter(weekAgo) &&
                DateTime.parse(element.date).isBefore(today))
            .toList()
          ..sort((first, second) => second.date.compareTo(first.date));
      } else {
        dateFilterList = TransactionDb.values
            .where((element) =>
                DateTime.parse(element.date).isAfter(weekAgo) &&
                DateTime.parse(element.date).isBefore(today))
            .toList()
          ..sort((first, second) => second.date.compareTo(first.date));
      }
    } else if (dateRange == 'all') {
      refresh();
    } else {
      TransactionDb.values.toList();
    }
    transactionListNotifier.value.clear();
    transactionListNotifier.value = dateFilterList;
    transactionListNotifier.notifyListeners();
  }

  Future<void> filterByDate(DateTime start, DateTime end) async {
    final TransactionDb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    List<TransactionModel> dateFilterList = [];

    if (selectedCatogory == "Income") {
      dateFilterList = TransactionDb.values
          .where((element) =>
              element.categoryType == CategoryType.income &&
              DateTime.parse(element.date)
                  .isAfter(start.subtract(const Duration(days: 1))) &&
              DateTime.parse(element.date).isBefore(
                end.add(
                  const Duration(days: 1),
                ),
              ))
          .toList()
        ..sort((first, second) => second.date.compareTo(first.date));
    } else if (selectedCatogory == "Expense") {
      dateFilterList = TransactionDb.values
          .where((element) =>
              element.categoryType == CategoryType.expense &&
              DateTime.parse(element.date)
                  .isAfter(start.subtract(const Duration(days: 1))) &&
              DateTime.parse(element.date).isBefore(
                end.add(
                  const Duration(days: 1),
                ),
              ))
          .toList()
        ..sort((first, second) => second.date.compareTo(first.date));
    } else {
      dateFilterList = TransactionDb.values
          .where((element) =>
              DateTime.parse(element.date)
                  .isAfter(start.subtract(const Duration(days: 1))) &&
              DateTime.parse(element.date).isBefore(
                end.add(
                  const Duration(days: 1),
                ),
              ))
          .toList()
        ..sort((first, second) => second.date.compareTo(first.date));
    }
    transactionListNotifier.value.clear();
    transactionListNotifier.value = dateFilterList;
    transactionListNotifier.notifyListeners();
  }

  Future<void> filterForHome(DateTime start, DateTime end) async {
    final TransactionDb =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    List<TransactionModel> dateFilterList = [];

    if (selectedCatogory == "Income") {
      dateFilterList = TransactionDb.values
          .where((element) =>
              element.categoryType == CategoryType.income &&
              DateTime.parse(element.date)
                  .isAfter(start.subtract(const Duration(days: 1))) &&
              DateTime.parse(element.date).isBefore(
                end.add(
                  const Duration(days: 1),
                ),
              ))
          .toList()
        ..sort((first, second) => second.date.compareTo(first.date));
    } else if (selectedCatogory == "Expense") {
      dateFilterList = TransactionDb.values
          .where((element) =>
              element.categoryType == CategoryType.expense &&
              DateTime.parse(element.date)
                  .isAfter(start.subtract(const Duration(days: 1))) &&
              DateTime.parse(element.date).isBefore(
                end.add(
                  const Duration(days: 1),
                ),
              ))
          .toList()
        ..sort((first, second) => second.date.compareTo(first.date));
    } else {
      dateFilterList = TransactionDb.values
          .where((element) =>
              DateTime.parse(element.date)
                  .isAfter(start.subtract(const Duration(days: 1))) &&
              DateTime.parse(element.date).isBefore(
                end.add(
                  const Duration(days: 1),
                ),
              ))
          .toList()
        ..sort((first, second) => second.date.compareTo(first.date));
    }
    transactionMonthListNotifier.value.clear();
    transactionMonthListNotifier.value = dateFilterList;
    transactionMonthListNotifier.notifyListeners();
  }
}

CollectionReference transactions =
    FirebaseFirestore.instance.collection('transactions');

class FirebaseBackupDataRetrieval {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> getUserTransactionsAndStore() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      User? user = auth.currentUser;
      if (user != null) {
        String authEmail = user.email!;
        Set<String> savedIds = prefs.getStringList('ids')?.toSet() ?? {};

        DocumentSnapshot userDataSnapshot = await firestore
            .collection('transactions')
            .doc(authEmail)
            .collection('user_transactions')
            .doc('65')
            .get()
            .then((value) async {
          if (value.exists) {
            Map<String, dynamic>? data = value.data();
            print(data);
            final transactionDB =
                await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
            if (data != null) {
              TransactionModel transaction = TransactionModel(
                id: data['id'],
                amount: data['amount'],
                date: data['date'],
                account: data['account'],
                categoryType: data['categoryType'],
                category: data['category'],
                note: data['note'],
              );
              await transactionDB.put(transaction.id, transaction);
            }
          } else {
            print("No such document");
          }
          return value;
        });
      } else {
        print('User not authenticated');
      }
    } catch (e) {
      print('Error getting user transactions and storing: $e');
    }
  }
}

class HiveFirestoreBackupData {
  static const String TRANSACTION_DB_NAME = 'transaction-db';
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> backupDataToFirestore(String? email) async {
    try {
      var user = auth.currentUser;
      if (user != null) {
        var transactionList = await getAllTransactions();
        await _backupTransactionsToFirestore(transactionList, user.email!);
        print('Data backed up successfully to Firestore');
      } else {
        print('User is not authenticated. Cannot backup transactions.');
      }
    } catch (e) {
      print('Error backing up data to Firestore: $e');
    }
  }

  static Future<List<TransactionModel>> getAllTransactions() async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return transactionDB.values.toList();
  }

  static Future<void> _backupTransactionsToFirestore(
      List<TransactionModel> transactionList, String email) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      for (var transaction in transactionList) {
        var firestoreData = {
          'email': email,
          'id': transaction.id,
          'amount': transaction.amount,
          'date': transaction.date,
          'account': transaction.account.name,
          'categoryType': transaction.categoryType.name,
          'category': transaction.category.name,
          'note': transaction.note,
        };
        Set<String> savedIds =
            prefs.getStringList('saved_transaction_ids')?.toSet() ?? {};
        savedIds.add(transaction.id.toString());
        await prefs.setStringList('saved_transaction_ids', savedIds.toList());

        await firestore
            .collection('transactions')
            .doc(email)
            .collection('user_transactions')
            .doc(transaction.id.toString())
            .set(firestoreData);
      }
    } catch (e) {
      print('Error backing up transactions: $e');
    }
  }
}

Future<dynamic> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  } on Exception catch (e) {
    // TODO
    print('exception->$e');
  }
}
// class HiveFirestoreBackupData {
//   static const String TRANSACTION_DB_NAE = 'transaction-db';
//   static FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   static Future<void> backupDataToFirestore(String? email) async {
//     try {
//       var transactionList = await getAllTransactions();
//       await _backupTransactionsToFirestore(transactionList, email);
//       print('Data backed up successfully to Firestore');
//     } catch (e) {
//       print('Error backing up data to Firestore: $e');
//     }
//   }
//
//   static Future<List<TransactionModel>> getAllTransactions() async {
//     final transactionDB =
//         await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
//     return transactionDB.values.toList();
//   }
//
//   static Future<void> _backupTransactionsToFirestore(
//       List<TransactionModel> transactionList, String? email) async {
//     try {
//       if (email != null) {
//         for (var transaction in transactionList) {
//           var firestoreData = {
//             'id': transaction.id,
//             'date': transaction.date,
//             'amount': transaction.amount,
//             'category': transaction.category.name,
//             'note': transaction.note,
//           };
//
//           await firestore
//               .collection('transactions')
//               .doc(email)
//               .collection('user_transactions')
//               .doc(transaction.id.toString())
//               .set(firestoreData);
//         }
//       } else {
//         print('Email is null. Cannot backup transactions.');
//       }
//     } catch (e) {
//       print('Error backing up transactions: $e');
//     }
//   }
//
// }

// class FirebaseBackupDataRetrieval {
//   static FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   static Future<List<Map<String, dynamic>>> getUserTransactions(String email) async {
//     try {
//       QuerySnapshot querySnapshot = await firestore
//           .collection('transactions')
//           .doc(email)
//           .collection('user_transactions')
//           .get();
//
//       List<Map<String, dynamic>> transactions = [];
//
//       querySnapshot.docs.forEach((doc) {
//
//       });
//
//       return transactions;
//     } catch (e) {
//       print('Error getting user transactions: $e');
//       return [];
//     }
//   }
// }

class FirebaseBackupDataRetrieval1 {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> getUserTransactionsAndStore() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      User? user = auth.currentUser;
      if (user != null) {
        String authEmail = user.email!;
        List<String>? savedIds = prefs.getStringList('saved_transaction_ids');

        if (savedIds != null && savedIds.isNotEmpty) {
          for (String transactionId in savedIds) {
            DocumentSnapshot transactionSnapshot = await firestore
                .collection('transactions')
                .doc(authEmail)
                .collection('user_transactions')
                .doc(transactionId)
                .get();

            if (transactionSnapshot.exists) {
              Map<String, dynamic>? data =
                  transactionSnapshot.data() as Map<String, dynamic>?;
              if (data != null) {
                var categoryType;

                if(data['categoryType']=='income'){
                  categoryType=CategoryType.income;
                }
                else {
                  categoryType= CategoryType.expense;
                }


                TransactionModel transaction = TransactionModel(
                  id: data['id'],
                  amount: data['amount'],
                  date: data['date'],
                  note: data['note'],
                  categoryType: categoryType,
                  category: data['category'],
                  account: AccountType.cash,
                );
                final transactionDB = await Hive.openBox<TransactionModel>(
                    HiveFirestoreBackupData.TRANSACTION_DB_NAME);
                await transactionDB.put(transaction.id, transaction);
              }
            } else {
              print("Document with ID $transactionId does not exist");
            }
          }
        } else {
          print("No saved transaction IDs found");
        }
      } else {
        print('User not authenticated');
      }
    } catch (e) {
      print('Error getting user transactions and storing: $e');
    }
  }
}
