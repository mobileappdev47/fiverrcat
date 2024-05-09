import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:pokercat/addexpense/db/functions/transaction_function.dart';
import 'package:pokercat/addexpense/db/models/account_group/account_group_model_db.dart';
import 'package:pokercat/addexpense/db/models/category/category_model_db.dart';
import 'package:pokercat/addexpense/db/models/transactions/transaction_model_db.dart';
import 'package:pokercat/imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackUpScreen extends StatefulWidget {
  BackUpScreen({super.key});

  @override
  State<BackUpScreen> createState() => _BackUpScreenState();
}

class _BackUpScreenState extends State<BackUpScreen> {
  bool autoBackupEnabled = true;
  int selectedDay = 1;
  late Timer timer;
  late String userEmail;

  Future<void> saveSelectedDay(int day) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedDay', day);
  }

  Future<void> loadSelectedDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? day = prefs.getInt('selectedDay');
    if (day != null) {
      setState(() {
        selectedDay = day;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFilePaths();
    loadSelectedDay();
    startAutomaticBackup();
  }

  void startAutomaticBackup() {
    // Start a timer to trigger backup retrieval at a set duration
    timer = Timer.periodic(Duration(minutes: selectedDay), (timer) async {
      print(selectedDay);
      // Call function to get particular backup file
      var user = FirebaseAuth.instance.currentUser;
      await HiveFirestoreBackupData1.backupDataToFirestore(user!.email, 1);
    });
  }

  Future<void> getParticularAutoBackupFile(int day) async {
    var user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection('transactions')
        .doc(user!.email)
        .get()
        .then((value) async {
      List transactionGetFromFirebase = [];

      if (value.data() != null) {
        print(value.data()!['userTransaction'][0]['transaction']);

        for (int i = 0; i < value.data()!['userTransaction'].length; i++) {
          // Assuming the day here is equivalent to the index (i)
          if (day == i + 1) {
            addDataToHive(value.data()!['userTransaction'][i]['transaction'],
                value.data()!['userTransaction'][i]['filename']);
            break;
          }
        }
      } else {}
    });
  }

  deleteParticularBackUpFile(int index) async {
    var user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection('transactions')
        .doc(user!.email)
        .get()
        .then((value) async {
      List finalList = [];

      if (value.data() != null) {
        print(value.data()!['userTransaction'][0]['transaction']);

        for (int i = 0; i < value.data()!['userTransaction'].length; i++) {
          finalList.add({
            'filename': value.data()!['userTransaction'][i]['filename'],
            'transaction': value.data()!['userTransaction'][i]['transaction'],
            'time': value.data()!['userTransaction'][i]['time'],
          });
        }

        finalList.removeAt(index);

        await FirebaseFirestore.instance
            .collection('transactions')
            .doc(user!.email)
            .set({'userTransaction': finalList});
      } else {}
    });
  }

  getParticularBackUpFile(int index) async {
    var user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection('transactions')
        .doc(user!.email)
        .get()
        .then((value) async {
      List transactionGetFromFirebase = [];

      if (value.data() != null) {
        print(value.data()!['userTransaction'][0]['transaction']);

        for (int i = 0; i < value.data()!['userTransaction'].length; i++) {
          if (index == i) {
            addDataToHive(value.data()!['userTransaction'][i]['transaction'],
                value.data()!['userTransaction'][i]['filename']);

            break;
          }
        }
      } else {}
    });
  }

  addDataToHive(List transactionList, fileName) async {
    print(transactionList);
    print(transactionList.length);

    for (int i = 0; i < transactionList.length; i++) {
      var categoryType;

      if (transactionList[i]['detail']['categoryType'] == 'income') {
        categoryType = CategoryType.income;
      } else {
        categoryType = CategoryType.expense;
      }
      CategoryModel category = CategoryModel(
        id: transactionList[i]['detail']['category']['id'],
        name: transactionList[i]['detail']['category']['name'],
        isDeleted: transactionList[i]['detail']['category']['isDeleted'],
        categoryType: categoryType,
      );

      TransactionModel transaction = TransactionModel(
        id: transactionList[i]['id'],
        amount: transactionList[i]['detail']['amount'],
        date: transactionList[i]['detail']['date'],
        note: transactionList[i]['detail']['note'],
        categoryType: categoryType,
        category: category,
        account: AccountType.cash,
      );
      final transactionDB = await Hive.openBox<TransactionModel>(
          HiveFirestoreBackupData.TRANSACTION_DB_NAME);
      await transactionDB.put(transactionList[i]['id'], transaction);
    }

    Get.back();
    Get.snackbar(
      "",
      "",
      messageText: const Text(
        'Data retrieve successfully!',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
      titleText: const Text(
        'Success',
        style: TextStyle(color: Colors.white),
      ),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        var myEmail;
        if (FirebaseAuth.instance.currentUser != null) {
          myEmail = FirebaseAuth.instance.currentUser!.email;
        }

        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              //height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.black87,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Backups',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.blueGrey,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.backup,
                              color: Colors.grey,
                            ),
                            title: const Text(
                              'Auto Backups',
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: const Text(
                              'Backup data when opened',
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Switch(
                              activeColor: Colors.indigoAccent.shade100,
                              value: autoBackupEnabled,
                              onChanged: (newValue) {
                                setState.call(
                                  () {
                                    autoBackupEnabled = newValue;
                                  },
                                );
                              },
                            ),
                          ),
                          ListTile(
                              leading: const Icon(
                                Icons.edit_calendar_rounded,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                'Backups Frequency',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: const Text(
                                'Number of days',
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: Container(
                                height: 32,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey.shade800,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: DropdownButton<int>(
                                    underline: Container(
                                      height: 0,
                                    ),
                                    value: selectedDay,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedDay = newValue!;
                                        saveSelectedDay(selectedDay);
                                      });
                                      // Restart timer with new duration
                                      timer.cancel(); // Cancel previous timer
                                      startAutomaticBackup(); // Start new timer with new duration
                                    },
                                    items: List.generate(
                                      3,
                                      (index) => DropdownMenuItem<int>(
                                        value: index + 1,
                                        child: Text(
                                            '${index + 1} day${index == 0 ? '' : 's'}'),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('transactions')
                                .doc(myEmail)
                                .snapshots(),
                            builder: (context, snapshot) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: snapshot.data != null &&
                                        snapshot.data!.exists == true
                                    ? ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              height: 10,
                                            ),
                                        itemCount:
                                            snapshot.data!['userTransaction'] ==
                                                    null
                                                ? 0
                                                : snapshot
                                                    .data!['userTransaction']
                                                    .length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: Colors.white
                                                  .withOpacity(0.08),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  CupertinoIcons.doc_text_fill,
                                                  color: AppTheme.chartColor,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      DateFormat.yMMMd()
                                                          .add_Hm()
                                                          .format(snapshot
                                                              .data![
                                                                  'userTransaction']
                                                                  [index]
                                                                  ['time']
                                                              .toDate()),
                                                      style: TextStyle(
                                                        fontSize: 15.5,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppTheme.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot.data![
                                                              'userTransaction']
                                                          [index]['filename'],
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppTheme.white
                                                            .withOpacity(0.8),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    getParticularBackUpFile(
                                                        index);
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: 45,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white
                                                          .withOpacity(0.08),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.download,
                                                      color:
                                                          AppTheme.chartColor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    deleteParticularBackUpFile(
                                                        index);
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: 45,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white
                                                          .withOpacity(0.08),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.close,
                                                      color:
                                                          AppTheme.chartColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        })
                                    : SizedBox(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  List<String> filePaths = [];

  Future<List<String>> fetchFilePaths() async {
    List<String> filePaths = [];
    FirebaseAuth auth = FirebaseAuth.instance;
    var user = auth.currentUser;
    userEmail = user!.email!;

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('transactions')
          .doc(user.email)
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

  Map<String, List<String>> groupFilesByBackupDate() {
    Map<String, List<String>> groupedFiles = {};

    for (String filePath in filePaths) {
      String backupDate = '2024-04-30';

      if (groupedFiles.containsKey(backupDate)) {
        groupedFiles[backupDate]!.add(filePath);
      } else {
        groupedFiles[backupDate] = [filePath];
      }
    }

    return groupedFiles;
  }

  @override
  Widget build(BuildContext context) {
    var myEmail;
    if (FirebaseAuth.instance.currentUser != null) {
      myEmail = FirebaseAuth.instance.currentUser!.email;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 18,
            )),
        title: const Text(
          "Backup",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.indigoAccent.shade100,
            child: const Icon(
              Icons.add_to_drive_sharp,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Google Drive Backup',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            myEmail ?? '',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              final GoogleSignIn googleSignIn = GoogleSignIn();
              await googleSignIn.signOut();

              Get.back();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade800,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  var user = FirebaseAuth.instance.currentUser;
                  await HiveFirestoreBackupData.backupDataToFirestore(
                      user!.email, 2);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.backup,
                          color: Colors.grey,
                        ),
                        Text(
                          'Backup',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  bottomSheet(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.folder,
                          color: Colors.grey,
                        ),
                        Text(
                          'Backups',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
