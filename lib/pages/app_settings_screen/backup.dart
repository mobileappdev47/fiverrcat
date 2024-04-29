import 'package:flutter/material.dart';
import 'package:pokercat/imports.dart';

class BackUpScreen extends StatefulWidget {
    BackUpScreen({super.key});

  @override
  State<BackUpScreen> createState() => _BackUpScreenState();
}

class _BackUpScreenState extends State<BackUpScreen> {
  bool autoBackupEnabled = false;

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return  Container(
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                color: Colors.black87,
              ),
              child:  Column(
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
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 2,
                    color: Colors.blueGrey,
                  ),
                  ListTile(
                    leading: const Icon(Icons.backup,color: Colors.grey,),
                    title: const Text('Auto Backups',style: TextStyle(color: Colors.white),),
                    trailing: Switch(
                      value: autoBackupEnabled,
                      onChanged: (newValue) {
                       setState.call(() {
                         autoBackupEnabled = newValue;
                       },);
                      },
                    ),
                  )
                ],
              ),
            );
          } ,
        );
      },
    );
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
            'data',
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
              Container(
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
