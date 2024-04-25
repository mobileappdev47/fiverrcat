import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokercat/addexpense/db/functions/transaction_function.dart';
import 'package:pokercat/pages/app_settings_screen/app_settings_screen.dart';




import '../constant.dart';
import 'bankroll.dart';
import 'cashgame.dart';
import 'tournament.dart';
import 'profile.dart';
import 'pushfold.dart';


class BtmNavi extends StatefulWidget {
  const BtmNavi({super.key});

  @override
  _BtmNaviState createState() => _BtmNaviState();
}

class _BtmNaviState extends State<BtmNavi> {

  int _currentIndex = 0;

  final tabs = [
    const Center(child: CashGame(),),
    const Center(child: PushFold(),),
    const Center(child: Tournament(),),
    const Center(child: Bankroll(),),
    const Center(child: AppSettingsScreen(),),



  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   showDialogOnInit(context);
    // });
  }
  void showDialogOnInit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Back up'),
          content: const Text('Would you like to create a backup of your data now?'),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () async {
                    final UserCredential userCredential = await signInWithGoogle();
                    final String userEmail = userCredential.user!.email.toString();
                    await FirebaseBackupDataRetrieval1.getUserTransactionsAndStore();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
  void _onItemTap(int index) {
    setState(() {
      _currentIndex = index;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: tabs[_currentIndex],

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(

              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(

          // backgroundColor: ZeplinColors.dark,
          backgroundColor: AppTheme.gray,
          // unselectedItemColor: const Color(0xff53558a),
          unselectedItemColor: AppTheme.pcBottomNavigatorUnSelectorColor,
          selectedItemColor: const Color(0xff59d1ff),
          // selectedItemColor: AppTheme.pcBottomNavigatorSelectorColor,


          currentIndex : _currentIndex,

          type: BottomNavigationBarType.fixed,
          iconSize: 20,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              icon: Icon(Icons.money),
              label: 'Cash Game',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_on_sharp),
              label: 'Push Fold',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.troubleshoot_outlined),
              label: 'Tournament',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(PokerIcon.chart_line),
            //   label: 'Bankroll',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money_sharp),
              label: 'Bankroll',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),

          ],
          selectedLabelStyle:const TextStyle(
            fontFamily: 'Quasimoda',
            fontWeight: FontWeight.w700,
          ) ,
          unselectedLabelStyle: const TextStyle(

            fontFamily: 'Quasimoda',
            fontWeight: FontWeight.w500,
          ),
          onTap: _onItemTap,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
        ),
      ),
    );
  }
}
