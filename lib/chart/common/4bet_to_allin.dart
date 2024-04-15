import 'package:pokercat/chart/constarants/selection.dart';

class FourBetToAllin {
  TournaPosition opponentTournaPosition;
  TournaPosition myTournaPosition;
  TournaStack tournaStack;

  FourBetToAllin(
      {required this.tournaStack,
      required this.myTournaPosition,
      required this.opponentTournaPosition});

  String changeString() {
    if (tournaStack == TournaStack.sixty &&opponentTournaPosition == TournaPosition.HJ && myTournaPosition == TournaPosition.SB
        ||tournaStack == TournaStack.sixty &&opponentTournaPosition == TournaPosition.HJ && myTournaPosition == TournaPosition.BB
        ) {
      return 'All-in';
    } else if(tournaStack == TournaStack.fifty&&myTournaPosition == TournaPosition.BB
        ||tournaStack == TournaStack.fifty&&myTournaPosition == TournaPosition.SB){
      print('aaa');
      return 'All-in';
    }
    else if ( tournaStack == TournaStack.forty|| tournaStack == TournaStack.thirtyfive|| tournaStack == TournaStack.thirty || tournaStack == TournaStack.twentyfive){
      return 'All-in';
    }
      return '4Bet';
  }
}
