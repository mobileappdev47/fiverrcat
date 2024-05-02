import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pokercat/addexpense/db/functions/account_group_function.dart';
import 'package:pokercat/addexpense/db/models/account_group/account_group_model_db.dart';
import 'package:pokercat/constant.dart';
import 'package:pokercat/pages/bankroll.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workmanager/workmanager.dart';

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
  ValueNotifier<List<TransactionModel>> transactionMyMonthListNotifier =
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
  int getMonthIndex() {

    String monthName = DateFormat('MMMM').format(selectedDate1.value);


    switch (monthName.toLowerCase()) {
      case 'january':
        return 1;
      case 'february':
        return 2;
      case 'march':
        return 3;
      case 'april':
        return 4;
      case 'may':
        return 5;
      case 'june':
        return 6;
      case 'july':
        return 7;
      case 'august':
        return 8;
      case 'september':
        return 9;
      case 'october':
        return 10;
      case 'november':
        return 11;
      case 'december':
        return 12;
      default:
        return -1; // Return -1 for invalid month names
    }
  }
  Future<void> refresh() async {
   int monthIndex = getMonthIndex();
    final list = await getAllTransactions();
    list.sort((first, second) => second.date.compareTo(first.date));
    final listForMonth = await getTransactionsForCurrentMonth();
    final listForMyMonth = await getTransactionsForMonth(monthIndex);

    listForMonth.sort((first, second) => second.date.compareTo(first.date));


    transactionListNotifier.value.clear();
    transactionMonthListNotifier.value.clear();
    transactionMyMonthListNotifier.value.clear();



    transactionListNotifier.value.addAll(list);
    transactionMonthListNotifier.value.addAll(listForMonth);
    transactionMyMonthListNotifier.value.addAll(listForMyMonth);



    transactionListNotifier.notifyListeners();
    transactionMonthListNotifier.notifyListeners();
    transactionMyMonthListNotifier.notifyListeners();

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


    final startOfMonth = DateTime(selectedDate1.value.year, month, 1);
    final endOfMonth = DateTime(selectedDate1.value.year, month, 31);
    // final startOfMonth = DateTime(now.year, month, 1);
    // final endOfMonth = DateTime(now.year, month, 31);
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
    }
    else if (selectedCatogory == "Expense") {
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
    }
    else {
      print('getting null');
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

    int monthIndex = getMonthIndex();

    final listForMyMonth = await getTransactionsForMonth(monthIndex);
    transactionMyMonthListNotifier.value.clear();
    transactionMyMonthListNotifier.value.addAll(listForMyMonth);
    transactionMyMonthListNotifier.notifyListeners();

  }
}

CollectionReference transactions =
    FirebaseFirestore.instance.collection('transactions');

Future<String> getTransactionFilePath(String transactionId) async {
  try {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String fileName = 'transaction_$transactionId.txt';
    String filePath = '${appDocDir.path}/$fileName';

    return filePath;
  } catch (e) {
    print('Error getting transaction file path: $e');
    return '';
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
      for (var transaction in transactionList) {
        CategoryModel category = transaction.category;
        String? filePath;

        if (transaction.id != null) {
          filePath = await getTransactionFilePath(transaction.id.toString());
          await _saveTransactionToFile(
              transaction, filePath); // Save transaction to file
        } else {
          print('Transaction ID is null.');
        }

        var firestoreData = {
          'email': email,
          'id': transaction.id,
          'amount': transaction.amount,
          'date': transaction.date,
          'account': transaction.account.name,
          'categoryType': transaction.categoryType.name,
          'category': {
            'id': category.id,
            'name': category.name,
            'isDeleted': category.isDeleted,
            'categoryType': category.categoryType.name,
          },
          'note': transaction.note,
          'file': filePath, // Include file path in firestoreData
        };

        await firestore
            .collection('transactions')
            .doc(email)
            .collection('user_transactions')
            .doc(transaction.id.toString())
            .set(firestoreData);
      }
      Get.snackbar('Success', 'Data Stored successfully!',
          backgroundColor: Colors.green, colorText: AppTheme.white);
    } catch (e) {
      Get.snackbar('Error', 'Sorry, Something went wrong!',
          backgroundColor: Colors.red, colorText: AppTheme.white);
      print('Error backing up transactions: $e');
    }
    Future<List<String>> fetchFilePaths() async {
      List<String> filePaths = [];

      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('transactions')
            .doc(email)
            .collection('user_transactions')
            .get();

        querySnapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          String filePath = data['file'];
          filePaths.add(filePath);
        });
      } catch (e) {
        print('Error fetching file paths: $e');
      }

      return filePaths;
    }
  }

  static Future<void> _saveTransactionToFile(
      TransactionModel transaction, String filePath) async {
    try {
      // Convert transaction object to a Map
      final transactionData = {
        'id': transaction.id,
        'date': transaction.date,
        'amount': transaction.amount,
        'account': transaction.account.name,
        'categoryType': transaction.categoryType.name,
        'category': {
          'id': transaction.category.id,
          'name': transaction.category.name,
          'isDeleted': transaction.category.isDeleted,
          'categoryType': transaction.category.categoryType.name,
        },
        'note': transaction.note,
        'image': transaction.image,
      };

      // Convert the Map to a JSON string
      final jsonString = jsonEncode(transactionData);

      // Write the JSON string to the file
      final file = File(filePath);
      await file.writeAsString(jsonString);
    } catch (e) {
      print('Error saving transaction to file: $e');
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

class FirebaseBackupDataRetrieval1 {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> getUserTransactionsAndStore() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        String authEmail = user.email!;

        CollectionReference userTransactionsCollection = firestore
            .collection('transactions')
            .doc(authEmail)
            .collection('user_transactions');

        QuerySnapshot transactionSnapshots =
            await userTransactionsCollection.get();

        for (DocumentSnapshot transactionSnapshot
            in transactionSnapshots.docs) {
          String transactionId = transactionSnapshot.id;

          if (transactionSnapshot.exists) {
            Map<String, dynamic>? data =
                transactionSnapshot.data() as Map<String, dynamic>?;

            if (data != null) {
              String filePath = await getTransactionFilePath(transactionId);
              print('File path for transaction $transactionId: $filePath');
              CategoryType getCategoryTypeFromString(
                  String categoryTypeString) {
                switch (categoryTypeString.toLowerCase()) {
                  case 'income':
                    return CategoryType.income;
                  case 'expense':
                    return CategoryType.expense;
                  default:
                    return CategoryType.unknown; // or any other default value
                }
              }

              dynamic categoryTypeData = data['categoryType'];
              if (categoryTypeData is String) {
                CategoryType categoryType =
                    getCategoryTypeFromString(categoryTypeData);

                Map<String, dynamic> categoryData = data['category'];
                CategoryModel category = CategoryModel(
                  id: categoryData['id'],
                  name: categoryData['name'],
                  isDeleted: categoryData['isDeleted'],
                  categoryType:
                      getCategoryTypeFromString(categoryData['categoryType']),
                );

                TransactionModel transaction = TransactionModel(
                  id: data['id'],
                  amount: data['amount'],
                  date: data['date'],
                  note: data['note'],
                  categoryType: categoryType,
                  category: category,
                  account: AccountType.cash,
                );
                final transactionDB = await Hive.openBox<TransactionModel>(
                    HiveFirestoreBackupData.TRANSACTION_DB_NAME);
                await transactionDB.put(transaction.id, transaction);
              } else {
                print('Invalid categoryType data: $categoryTypeData');
              }
            }
          }
        }
      } else {
        print('User not authenticated');
      }
    } catch (e) {
      print('Error getting user transactions and storing: $e');
    }
  }
}




/// backup auto---------------------------------------

void backupDataToFirestore() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    User? user = auth.currentUser;
    if (user != null) {
      // Fetch data from Hive
      List<TransactionModel> transactionList = await HiveFirestoreBackupData.getAllTransactions();

      // Upload data to Firestore
      await HiveFirestoreBackupData.backupDataToFirestore(user.email!);

      print('Data backed up to Firestore successfully!');
    } else {
      print('User is not authenticated. Cannot backup data to Firestore.');
    }
  } catch (e) {
    print('Error backing up data to Firestore: $e');
  }
}
