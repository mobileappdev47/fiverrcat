// enum SelectType{
//   actionIndex,
//   myPositionIndex,
//   opponentPositionIndex,
// }

// class Selection{
//   int actionIndex=0;
//   int myPositionIndex=0;
//   int opponentPositionIndex=0;
// }



enum OpponentAction {
  none,limp,raise, threeBet, fourBet
}

enum Position {
  none,UTG,MP,CO,BTN,SB,BB
}
//tournament
enum TournaStack {
  none,hundred,eighty,sixty,fifty,forty,thirtyfive,thirty,twentyfive
}

enum TournaPosition {
  none,UTG,UTG1,LJ,HJ,CO,BTN,SB,BB
}

class Selection{


  OpponentAction opponentAction = OpponentAction.none;
  Position myPosition = Position.none;
  Position opponentPosition = Position.none;
  ///tournament
  TournaStack tournaStack = TournaStack.none;
  TournaPosition myTournaPosition = TournaPosition.none;
  TournaPosition opponentTournaPosition = TournaPosition.none;

}