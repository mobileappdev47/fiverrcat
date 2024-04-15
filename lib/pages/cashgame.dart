import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../global/component/appbar.dart';
import '../global/component/reusable_button.dart';
import '../global/component/reusable_text.dart';
import '../imports.dart';

class CashGame extends StatefulWidget {
  const CashGame({super.key});

  @override
  _CashGameState createState() => _CashGameState();
}



class _CashGameState extends State<CashGame> {
  Random random = Random();

  int randomNumber = 0;
  int diceRandomNumber = 1;
  bool isEnabled = true;
  bool disabled = false;

  // List<Widget> getButtonJH() {
  //   List<Flexible> buttonList = [];
  //   for (var value in Position.values) {
  //     if (value.index == 0) continue;
  //     buttonList.add(myPositionFlexibleWH(value));
  //   }
  //   return buttonList;
  // }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: AppTheme.pcScafoldColor,
      appBar: Appbar(
        titleStr: 'CashGame',
        // title: Container(
        //   decoration: BoxDecoration(
        //     boxShadow: [
        //       BoxShadow(
        //         color: Color(0x7f000000),
        //         offset: Offset(0, 0),
        //         blurRadius: 24,
        //         spreadRadius: 3,
        //       ),
        //     ],
        //   ),
        //   child: ReusableText(
        //     text: 'CashGame',
        //   ),
        // ),
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


                    print('diceRandomNumber=$diceRandomNumber');
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
      // appBar: AppBar(
      //   title: Text('CashGame'),
      //   actions: <Widget>[
      //     Row(
      //       children: [
      //         Text('$randomNumber'),
      //
      //         IconButton( icon: new Icon(Icons.pie_chart),onPressed: () => {
      //           setState(() {
      //             randomNumber = random.nextInt(101);
      //             print(randomNumber);
      //           })}, )
      //       ],
      //     )
      //   ],
      // ),
      body: Container()
    );
  }

  // 맨처음 만든 인덱스와 포지션 스트링 둘다 핸들링하면서 만든 버튼 복잡해서 나중에지우기로.
  // Flexible MyPositionFlexible(String position) {
  //   return Flexible(
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         padding: EdgeInsets.all(0.0),
  //         primary: myPositionIndex == listPosition.indexOf(position)
  //             ? Colors.orange
  //             : Colors.grey,
  //       ),
  //       onPressed: () {
  //         setState(() {
  //           myPositionIndex = listPosition.indexOf(position);
  //
  //           // RangeCalculator calc = RangeCalculator(ante: listAnte[anteIndex],
  //           //     blind: blindIndex, position: listPosition[positionIndex]);
  //           // _stateBus.rankPairs = calc.rangeStateApply();
  //
  //           print('mypositionIndex=${myPositionIndex}');
  //         });
  //       },
  //       child: Container(
  //         child: Text(
  //           position,
  //           style: TextStyle(fontSize: 12.0),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // elevated버튼 클래스를  활용하는게 아니라 클래스 내에서 위젯을 리턴해서 활용하는형태일때 썼던 위젯
  // Flexible myPositionFlexibleWH(Position selectedMyPosition) {
  //   return Flexible(
  //     child:  ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             padding: EdgeInsets.all(0.0),
  //             primary: cashSelection.myPosition == selectedMyPosition
  //                 ? Colors.orange
  //                 : Colors.grey,
  //           ),
  //           onPressed: () {
  //             setState(() {
  //               // if(selection.myPosition == Position.UTG){
  //               //   Provider.of<ButtonHandling>(context, listen: false).deactivateButton(isEnabled);
  //               // }
  //               // if(selection.myPosition == Position.MP){
  //               //   Provider.of<ButtonHandling>(context, listen: false).deactivateButton(disabled);
  //               // }
  //               cashSelection.myPosition = selectedMyPosition;
  //               cashSelection.opponentPosition = Position.none; //바꿔야함
  //               cashSelection.opponentAction = OpponentAction.none;
  //             });
  //           },
  //           child: Container(
  //             child: Text(
  //               selectedMyPosition.name,
  //               style: TextStyle(fontSize: 12.0),
  //             ),
  //           ),
  //         ),
  //   );
  // }
  //
  //
  // Flexible opponentPositionFlexible(Position selectedOpponentPosition) {
  //   return Flexible(
  //     child: Consumer<ButtonHandling>(
  //         builder: (BuildContext context, buttonHandling, Widget? child) {
  //       return ElevatedButton(
  //         style: ElevatedButton.styleFrom(
  //
  //           primary: cashSelection.opponentPosition == selectedOpponentPosition
  //               ? Colors.orange
  //               : Colors.grey,
  //         ),
  //         onPressed: cashSelection.myPosition != selectedOpponentPosition
  //             ? () {
  //                 setState(() {
  //                   cashSelection.opponentPosition = selectedOpponentPosition;
  //                   if (cashSelection.myPosition.index <
  //                       selectedOpponentPosition.index) {
  //                     cashSelection.opponentAction = OpponentAction.threeBet;
  //                     // Provider.of<ButtonHandling>(context, listen: false)
  //                     //     .deActivateFourBetButton(disabled);
  //
  //                   } else {
  //                     cashSelection.opponentAction = OpponentAction.none;
  //                   }
  //                 });
  //               }
  //             : null,
  //         child: Container(
  //           child: Text(
  //             selectedOpponentPosition.name,
  //             style: TextStyle(fontSize: 12.0),
  //           ),
  //         ),
  //       );
  //     }),
  //   );
  // }
}




