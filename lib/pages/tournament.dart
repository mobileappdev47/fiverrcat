import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';
import '../global/component/appbar.dart';
import '../global/component/reusable_button.dart';
import '../global/component/reusable_text.dart';

class Tournament extends StatefulWidget {
  const Tournament({super.key});

  @override
  _TournamentState createState() => _TournamentState();
}


class _TournamentState extends State<Tournament> {
  Random random = Random();
  int randomNumber = 0;
  bool isEnabled = true;
  bool disabled = false;

  // List<Widget> getButtonJH() {
  //   List<Flexible> buttonList = [];
  //   for (var value in TournaPosition.values) {
  //     if (value.index == 0) continue;
  //     buttonList.add(myTournaPositionFlexible(value));
  //   }
  //   return buttonList;
  // }

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pcScafoldColor,
      appBar: Appbar(
        titleStr: 'Chip-EV',
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
      body: Container(),
    );
  }



}
