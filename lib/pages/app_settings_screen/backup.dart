import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokercat/addexpense/db/functions/transaction_function.dart';
import 'package:pokercat/imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackUpScreen extends StatefulWidget {
  BackUpScreen({super.key});

  @override
  State<BackUpScreen> createState() => _BackUpScreenState();
}

class _BackUpScreenState extends State<BackUpScreen> {
  bool autoBackupEnabled = true;
  String dropdownValue = '1';
  late String userEmail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFilePaths();
   // loadBackupFrequency();
    //  fetchFilePaths();
  }
  // void loadBackupFrequency() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     dropdownValue = (prefs.getInt('backupFrequency') ?? 1) as String; // Default to 1 day
  //   });
  // }
  // void saveBackupFrequency(int frequency) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setInt('backupFrequency', frequency);
  // }
  void bottomSheet(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    showModalBottomSheet(
      context: context,
      builder: (context) {
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
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade800,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropdownButton<String>(
                            underline: Container(
                              height: 0,
                            ),
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                                // Perform any other actions you need when the dropdown value changes
                              });
                            },
                            items: <String>[
                              '1',
                              '2',
                              '3',
                              '4',
                              '5'
                            ] // Set items to numbers from 1 to 5
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      )),
                  Expanded(
                    child: FutureBuilder(
                      future: fetchFilePaths(), // Function to fetch file paths
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          // Display file paths using ListView.builder
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              String filePath = snapshot.data![index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: Colors.black54,
                                  elevation: 2,
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.file_copy,
                                      color: Colors.white,
                                    ),
                                    title: const Text(
                                      'File Path',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      filePath,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    trailing: const Icon(
                                      Icons.download_rounded,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      // Handle file download or any other action here
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((value) {
      return Get.snackbar('Backup', 'Complete',
          icon: Icon(
            Icons.backup,
            color: Colors.white,
          ),
        colorText: Colors.white
      );
    });
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
      // Extract backup date from file path (assuming file path contains date information)
      // Modify this logic based on your actual file path structure
      String backupDate = '2024-04-30'; // Example backup date
      // Add file path to corresponding backup date group
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
          const Text(
           'userEmail',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
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
                      user!.email);
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
