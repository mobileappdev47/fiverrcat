
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poker/poker.dart';
import 'package:pokercat/constant.dart';
import 'package:pokercat/global/component/reusable_button.dart';


import 'dart:math';

import '../global/component/appbar.dart';
import '../global/component/reusable_text.dart';





class PushFold extends StatefulWidget {
  const PushFold({super.key});

  @override
  _PushFoldState createState() => _PushFoldState();
}

class _PushFoldState extends State<PushFold> {
  Random random = Random();
  int randomNumber = 0;


  List<bool> anteSelected = List.generate(2, (index) => false);
  List<bool> positionSelected = List.generate(8, (index) => false);

  int anteIndex = 1;
  int blindIndex = 1;
  int positionIndex = 0;
  List<String> listAnte = ['No Ante', '10% Ante'];
  List<int> listBlind = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
  List<String> listPosition = ['UTG', 'UTG1', 'MP', 'MP1', 'HJ', 'CO', 'BTN', 'SB'];


  @override
  void initState() {
    super.initState();



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pcScafoldColor,
      appBar: Appbar(
        titleStr: 'PushFold',
        actions: <Widget>[
          Row(
            children: [
              ReusableText(
                text: '$randomNumber',
                fontSize: 14.sp,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    randomNumber = random.nextInt(100)+1;
                    diceRandomNumber = random.nextInt(24);
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/images/dice/dice$diceRandomNumber.png',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(

        children: <Widget>[]
      ),
    );
  }


}


