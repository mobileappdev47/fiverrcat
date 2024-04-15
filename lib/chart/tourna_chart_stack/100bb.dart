import '../common/progress_info_model.dart';
import '../constarants/selection.dart';

Map<String, ProgressInfo> hundredStack(Selection tournaSelection) {
  //스택, 내 포지션,상대 포지션,상대 액션 선택됨
  if (tournaSelection.opponentAction != OpponentAction.none &&
      tournaSelection.myTournaPosition != TournaPosition.none &&
      tournaSelection.opponentTournaPosition != TournaPosition.none) {
    //raise pot
    if (tournaSelection.opponentAction == OpponentAction.raise) {
      if(tournaSelection.myTournaPosition == TournaPosition.SB && tournaSelection.opponentTournaPosition == TournaPosition.BB){
        return {
          'AA' :const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.3),
          'KK' :const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.25),
          'QQ' :const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.25),
          'JJ' :const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.3),
          'TT' :const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.3),
          '99' :const ProgressInfo(raiseP: 0.3, callP: 0.7, alreadyP: 0.25),
          '88' :const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.2),
          '77' :const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.15),
          '66' :const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),
          '55' :const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),
          '44' :const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),
          '33' :const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),
          '22' :const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),


          'AKs':const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.5),
          'AQs':const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.25),
          'AJs':const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.6),
          'ATs':const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.65),
          'A9s':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.5),
          'A8s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.45),
          'A7s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.3),
          'A6s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.1),
          'A5s':const ProgressInfo(raiseP: 0.3, callP: 0.7, alreadyP: 0.35),
          'A4s':const ProgressInfo(raiseP: 0.1, callP: 0.9, alreadyP: 0.15),
          'A3s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),
          'A2s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),

          'AKo':const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.2),
          'KQs':const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.6),
          'KJs':const ProgressInfo(raiseP: 0.75, callP: 0.2, alreadyP: 0.6),
          'KTs':const ProgressInfo(raiseP: 0.3, callP: 0.7, alreadyP: 0.5),
          'K9s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.2),
          'K8s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.2),
          'K7s':const ProgressInfo(raiseP: 0.1, callP: 0.9, alreadyP: 0.15),
          'K6s':const ProgressInfo(raiseP: 0.1, callP: 0.9, alreadyP: 0.0),
          'K5s':const ProgressInfo(raiseP: 0.2, callP: 0.8, alreadyP: 0.0),
          'K4s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),
          'K3s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),
          'K2s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),

          'AQo':const ProgressInfo(raiseP: 0.9, callP: 0.1, alreadyP: 0.3),
          'KQo':const ProgressInfo(raiseP: 0.25, callP: 0.75, alreadyP: 0.15),
          'QJs':const ProgressInfo(raiseP: 0.35, callP: 0.65, alreadyP: 0.6),
          'QTs':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.5),
          'Q9s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.1),
          'Q8s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.1),
          'Q7s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),
          'Q6s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),
          'Q5s':const ProgressInfo(raiseP: 0.1, callP: 0.9, alreadyP: 0.0),
          'Q4s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.1),
          'Q3s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.1),
          'Q2s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.1),

          'AJo':const ProgressInfo(raiseP: 0.4, callP: 0.6, alreadyP: 0.15),
          'KJo':const ProgressInfo(raiseP: 0.2, callP: 0.8, alreadyP: 0.1),
          'QJo':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),
          'JTs':const ProgressInfo(raiseP: 0.3, callP: 0.7, alreadyP: 0.5),
          'J9s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.2),
          'J8s':const ProgressInfo(raiseP: 0.1, callP: 0.9, alreadyP: 0.0),
          'J7s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),
          'J6s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.2),
          'J5s':const ProgressInfo(raiseP: 0.2, callP: 0.8, alreadyP: 0.15),
          'J4s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.2),
          'J3s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.15),
          'J2s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.15),

          'ATo':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.15),
          'KTo':const ProgressInfo(raiseP: 0.25, callP: 0.75, alreadyP: 0.0),
          'QTo':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.0),
          'JTo':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.0),
          'T9s':const ProgressInfo(raiseP: 0.5, callP: 0.5, alreadyP: 0.3),
          'T8s':const ProgressInfo(raiseP: 0.4, callP: 0.6, alreadyP: 0.1),
          'T7s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.0),
          'T6s':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.2),
          'T5s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.2),
          'T4s':const ProgressInfo(raiseP: 0.1, callP: 0.9, alreadyP: 0.2),
          'T3s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.2),
          'T2s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.1),

          'A9o':const ProgressInfo(raiseP: 0.25, callP: 0.75, alreadyP: 0.15),
          'K9o':const ProgressInfo(raiseP: 0.2, callP: 0.8, alreadyP: 0.2),
          'Q9o':const ProgressInfo(raiseP: 0.1, callP: 0.9, alreadyP: 0.15),
          'J9o':const ProgressInfo(raiseP: 0.2, callP: 0.8, alreadyP: 0.15),
          'T9o':const ProgressInfo(raiseP: 0.1, callP: 0.9, alreadyP: 0.1),
          '98s':const ProgressInfo(raiseP: 0.5, callP: 0.5, alreadyP: 0.1),
          '97s':const ProgressInfo(raiseP: 0.2, callP: 0.8, alreadyP: 0.0),
          '96s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.1),
          '95s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.25),
          '94s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.2),
          '93s':const ProgressInfo(raiseP: 0.0, callP: 0.35, alreadyP: 0.0),
          '92s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

          'A8o':const ProgressInfo(raiseP: 0.2, callP: 0.8, alreadyP: 0.15),
          'K8o':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.15),
          'Q8o':const ProgressInfo(raiseP: 0.1, callP: 0.9, alreadyP: 0.2),
          'J8o':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.2),
          'T8o':const ProgressInfo(raiseP: 0.1, callP: 0.9, alreadyP: 0.2),
          '98o':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.2),
          '87s':const ProgressInfo(raiseP: 0.7, callP: 0.3, alreadyP: 0.15),
          '86s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.2),
          '85s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.15),
          '84s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.25),
          '83s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '82s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

          'A7o':const ProgressInfo(raiseP: 0.2, callP: 0.8, alreadyP: 0.2),
          'K7o':const ProgressInfo(raiseP: 0.2, callP: 0.8, alreadyP: 0.1),
          'Q7o':const ProgressInfo(raiseP: 0.0, callP: 0.1, alreadyP: 0.1),
          'J7o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'T7o':const ProgressInfo(raiseP: 0.0, callP: 0.2, alreadyP: 0.2),
          '97o':const ProgressInfo(raiseP: 0.0, callP: 0.3, alreadyP: 0.15),
          '87o':const ProgressInfo(raiseP: 0.0, callP: 0.85, alreadyP: 0.14),
          '76s':const ProgressInfo(raiseP: 0.4, callP: 0.6, alreadyP: 0.2),
          '75s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.1),
          '74s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.2),
          '73s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '72s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

          'A6o':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.2),
          'K6o':const ProgressInfo(raiseP: 0.25, callP: 0.75, alreadyP: 0.2),
          'Q6o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'J6o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'T6o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '96o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '86o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '76o':const ProgressInfo(raiseP: 0.0, callP: 0.35, alreadyP: 0.0),
          '65s':const ProgressInfo(raiseP: 0.1, callP: 0.9, alreadyP: 0.25),
          '64s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.25),
          '63s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.2),
          '62s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

          'A5o':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.1),
          'K5o':const ProgressInfo(raiseP: 0.0, callP: 0.45, alreadyP: 0.15),
          'Q5o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'J5o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'T5o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '95o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '85o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '75o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '65o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '54s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.25),
          '53s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.25),
          '52s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.25),

          'A4o':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.1),
          'K4o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'Q4o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'J4o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'T4o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '94o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '84o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '74o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '64o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '54o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '43s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.15),
          '42s':const ProgressInfo(raiseP: 0.0, callP: 0.3, alreadyP: 0.15),

          'A3o':const ProgressInfo(raiseP: 0.1, callP: 0.9, alreadyP: 0.1),
          'K3o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'Q3o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'J3o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'T3o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '93o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '83o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '73o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '63o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '53o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '43o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '32s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

          'A2o':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.0),
          'K2o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'Q2o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'J2o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          'T2o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '92o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '82o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '72o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '62o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '52o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '42o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
          '32o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
        };
      }
    }
    //3bet pot
    else if (tournaSelection.opponentAction == OpponentAction.threeBet) {
      if (tournaSelection.myTournaPosition == TournaPosition.UTG) {
        switch (tournaSelection.opponentTournaPosition) {
          case TournaPosition.UTG1:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 0.55, callP: 0.00, allinP: 0.45),
              'QQ' :const ProgressInfo(raiseP: 0.27, callP: 0.73),
              'JJ' :const ProgressInfo(raiseP: 0.34, callP: 0.66),
              'TT' :const ProgressInfo(raiseP: 0.23, callP: 0.77),
              '99' :const ProgressInfo(raiseP: 0.14, callP: 0.86),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.88),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.74),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.57),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.4),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),


              'AKs':const ProgressInfo(raiseP: 0.5, callP: 0.00, allinP: 0.5),
              'AQs':const ProgressInfo(raiseP: 0.42, callP: 0.58),
              'AJs':const ProgressInfo(raiseP: 0.52, callP: 0.48),
              'ATs':const ProgressInfo(raiseP: 0.27, callP: 0.73),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.29),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.20),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.28, callP: 0.72),
              'A4s':const ProgressInfo(raiseP: 0.17, callP: 0.59),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.6),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.2, callP: 0.4, allinP: 0.4),
              'KQs':const ProgressInfo(raiseP: 0.17, callP: 0.83),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KTs':const ProgressInfo(raiseP: 0.13, callP: 0.83),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.20),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.58),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.19),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.14, callP: 0.86),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.07, callP: 0.54),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.9, alreadyP: 0.5),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.8),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.8 ),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.11),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.LJ:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 0.55, callP: 0.00, allinP: 0.45),
              'QQ' :const ProgressInfo(raiseP: 0.25, callP: 0.75),
              'JJ' :const ProgressInfo(raiseP: 0.33, callP: 0.67),
              'TT' :const ProgressInfo(raiseP: 0.20, callP: 0.80),
              '99' :const ProgressInfo(raiseP: 0.12, callP: 0.88),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.87),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.65),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.4),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.5),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.5),


              'AKs':const ProgressInfo(raiseP: 0.6, callP: 0.00, allinP: 0.4),
              'AQs':const ProgressInfo(raiseP: 0.29, callP: 0.71),
              'AJs':const ProgressInfo(raiseP: 0.48, callP: 0.52),
              'ATs':const ProgressInfo(raiseP: 0.27, callP: 0.73),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.55),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.24),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.32, callP: 0.68),
              'A4s':const ProgressInfo(raiseP: 0.19, callP: 0.81),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.9, alreadyP: 0.6),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.15, callP: 0.40, allinP: 0.45),
              'KQs':const ProgressInfo(raiseP: 0.19, callP: 0.81),
              'KJs':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'KTs':const ProgressInfo(raiseP: 0.17, callP: 0.83),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.38),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.65),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.36),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.14, callP: 0.86),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.00, callP: 0.71),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.8),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 , alreadyP: 0.8),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.HJ:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 0.65, callP: 0.00, allinP: 0.35),
              'QQ' :const ProgressInfo(raiseP: 0.25, callP: 0.75),
              'JJ' :const ProgressInfo(raiseP: 0.29, callP: 0.71),
              'TT' :const ProgressInfo(raiseP: 0.21, callP: 0.79),
              '99' :const ProgressInfo(raiseP: 0.10, callP: 0.90),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.92),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.76),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.4),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),


              'AKs':const ProgressInfo(raiseP: 0.85, callP: 0.00, allinP: 0.15),
              'AQs':const ProgressInfo(raiseP: 0.30, callP: 0.70),
              'AJs':const ProgressInfo(raiseP: 0.40, callP: 0.60),
              'ATs':const ProgressInfo(raiseP: 0.32, callP: 0.68),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.83),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.46),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
              'A4s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.8, alreadyP: 0.6),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.15, callP: 0.45, allinP: 0.4),
              'KQs':const ProgressInfo(raiseP: 0.13, callP: 0.87),
              'KJs':const ProgressInfo(raiseP: 0.14, callP: 0.86),
              'KTs':const ProgressInfo(raiseP: 0.17, callP: 0.83),


              'AQo':const ProgressInfo(raiseP: 0.13, callP: 0.41),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.78),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.62),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.11, callP: 0.89),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.17, callP: 0.64),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.8),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 , alreadyP: 0.8),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.CO:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 0.7, callP: 0.1, allinP: 0.2),
              'QQ' :const ProgressInfo(raiseP: 0.24, callP: 0.76),
              'JJ' :const ProgressInfo(raiseP: 0.23, callP: 0.77),
              'TT' :const ProgressInfo(raiseP: 0.22, callP: 0.78),
              '99' :const ProgressInfo(raiseP: 0.10, callP: 0.90),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.93),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.74),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.4),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),


              'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.43, callP: 0.57),
              'AJs':const ProgressInfo(raiseP: 0.28, callP: 0.72),
              'ATs':const ProgressInfo(raiseP: 0.43, callP: 0.57),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.93),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.46),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.29),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.35, callP: 0.65),
              'A4s':const ProgressInfo(raiseP: 0.21, callP: 0.79),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.6),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.15, callP: 0.55, allinP: 0.3),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.28, callP: 0.72),
              'KTs':const ProgressInfo(raiseP: 0.15, callP: 0.85),


              'AQo':const ProgressInfo(raiseP: 0.13, callP: 0.54),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.1 , callP: 0.75),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.74),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.14, callP: 0.86),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.17, callP: 0.72),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.25, alreadyP: 0.3),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.8),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 , alreadyP: 0.8),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.BTN:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 0.7, callP: 0.1, allinP: 0.2),
              'QQ' :const ProgressInfo(raiseP: 0.22, callP: 0.78),
              'JJ' :const ProgressInfo(raiseP: 0.22, callP: 0.78),
              'TT' :const ProgressInfo(raiseP: 0.14, callP: 0.86),
              '99' :const ProgressInfo(raiseP: 0.17, callP: 0.83),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.78),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.4),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),


              'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.35, callP: 0.65),
              'AJs':const ProgressInfo(raiseP: 0.12, callP: 0.88),
              'ATs':const ProgressInfo(raiseP: 0.35, callP: 0.65),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.90),
              'A8s':const ProgressInfo(raiseP: 0.10, callP: 0.67),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.32),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.38, callP: 0.62),
              'A4s':const ProgressInfo(raiseP: 0.28, callP: 0.72),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.6),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.15, callP: 0.55, allinP: 0.3),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.23, callP: 0.77),
              'KTs':const ProgressInfo(raiseP: 0.13, callP: 0.87),


              'AQo':const ProgressInfo(raiseP: 0.18, callP: 0.63),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.10, callP: 0.90),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.79),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.17, callP: 0.83),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.20, callP: 0.80),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.8),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 , alreadyP: 0.8),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.SB:
            return {
              'AA' :const ProgressInfo(raiseP: 0.31, callP: 0.69),
              'KK' :const ProgressInfo(raiseP: 0.1, callP: 0.55, allinP: 0.35),
              'QQ' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'JJ' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'TT' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 0.70),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 0.66),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.63),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.60),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.38),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.7, alreadyP: 0.4),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.9, alreadyP: 0.5),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),


              'AKs':const ProgressInfo(raiseP: 0.24, callP: 0.76),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.0, callP: 1.0),
              'ATs':const ProgressInfo(raiseP: 0.1, callP: 0.90),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.90),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 0.33),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.28),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.10, callP: 0.9),
              'A4s':const ProgressInfo(raiseP: 0.10, callP: 0.55),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.15, alreadyP: 0.6),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0, callP: 0.55, allinP: 0.45),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.10, callP: 0.90),
              'KTs':const ProgressInfo(raiseP: 0.0, callP: 0.38),


              'AQo':const ProgressInfo(raiseP: 0.00, callP: 0.35),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 0.68),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.56),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.00, callP: 0.80),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.00, callP: 0.39),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.65, alreadyP: 0.5),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.8),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 , alreadyP: 0.8),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.BB:
            return {
              'AA' :const ProgressInfo(raiseP: 0.51, callP: 0.49),
              'KK' :const ProgressInfo(raiseP: 0.29, callP: 0.71),
              'QQ' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'JJ' :const ProgressInfo(raiseP: 0.10, callP: 0.90),
              'TT' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 0.57),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 0.54),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.56),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.58),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.30),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.35, alreadyP: 0.4),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.5, alreadyP: 0.5),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.35, alreadyP: 0.5),


              'AKs':const ProgressInfo(raiseP: 0.42, callP: 0.58),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.16, callP: 0.84),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.43),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 0.60),
              'A7s':const ProgressInfo(raiseP: 0.12, callP: 0.18),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.11, callP: 0.89),
              'A4s':const ProgressInfo(raiseP: 0.13, callP: 0.43),
              'A3s':const ProgressInfo(raiseP: 0.15 , callP: 0.00, alreadyP: 0.6),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.15, callP: 0.75, allinP: 0.1),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.15, callP: 0.85),
              'KTs':const ProgressInfo(raiseP: 0.00, callP: 0.24),


              'AQo':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 0.65),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.62),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.00, callP: 0.51),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.00, callP: 0.41),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.3, alreadyP: 0.5),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.8),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 , alreadyP: 0.8),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      } else if (tournaSelection.myTournaPosition == TournaPosition.UTG1) {
        switch (tournaSelection.opponentTournaPosition) {

          case TournaPosition.LJ:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 0.55, callP: 0.00, alreadyP: 0.0, allinP: 0.45),
              'QQ' :const ProgressInfo(raiseP: 0.28, callP: 0.72),
              'JJ' :const ProgressInfo(raiseP: 0.32, callP: 0.68),
              'TT' :const ProgressInfo(raiseP: 0.21, callP: 0.79),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.81),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.84),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.71, alreadyP: 0.3),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.73, alreadyP: 0.3),


              'AKs':const ProgressInfo(raiseP: 0.85, callP: 0.00, alreadyP: 0.0, allinP: 0.15),
              'AQs':const ProgressInfo(raiseP: 0.35, callP: 0.65),
              'AJs':const ProgressInfo(raiseP: 0.40, callP: 0.60),
              'ATs':const ProgressInfo(raiseP: 0.32, callP: 0.68),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.62),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.29, callP: 0.71),
              'A4s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.39),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.1, callP: 0.35, alreadyP: 0.0, allinP: 0.55),
              'KQs':const ProgressInfo(raiseP: 0.16, callP: 0.84),
              'KJs':const ProgressInfo(raiseP: 0.20, callP: 0.80),
              'KTs':const ProgressInfo(raiseP: 0.17, callP: 0.83),
              'K6s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.8),


              'AQo':const ProgressInfo(raiseP: 0.17, callP: 0.52),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.70),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.16, callP: 0.84),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 0.21),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.18, callP: 0.82),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.20),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.69),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.1 , callP: 0.9, alreadyP: 0.5),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.HJ:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 0.6, callP: 0.00, alreadyP: 0.0, allinP: 0.4),
              'QQ' :const ProgressInfo(raiseP: 0.30, callP: 0.70),
              'JJ' :const ProgressInfo(raiseP: 0.28, callP: 0.72),
              'TT' :const ProgressInfo(raiseP: 0.23, callP: 0.77),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.3, allinP: 0.0),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.3, allinP: 0.0),


              'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.40, callP: 0.60),
              'AJs':const ProgressInfo(raiseP: 0.24, callP: 0.76),
              'ATs':const ProgressInfo(raiseP: 0.43, callP: 0.57),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'A8s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.30),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
              'A4s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.26),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.1, callP: 0.4, alreadyP: 0.0, allinP: 0.5),
              'KQs':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'KJs':const ProgressInfo(raiseP: 0.36, callP: 0.64),
              'KTs':const ProgressInfo(raiseP: 0.17, callP: 0.83),
              'K6s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.8, allinP: 0.0),


              'AQo':const ProgressInfo(raiseP: 0.22, callP: 0.78),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.15, callP: 0.85),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 0.24),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.18, callP: 0.82),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.34),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.76),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5, allinP: 0.0),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7, allinP: 0.0),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7, allinP: 0.0),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.CO:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 0.7, callP: 0.00, alreadyP: 0.0, allinP: 0.3),
              'QQ' :const ProgressInfo(raiseP: 0.30, callP: 0.70),
              'JJ' :const ProgressInfo(raiseP: 0.21, callP: 0.79),
              'TT' :const ProgressInfo(raiseP: 0.21, callP: 0.79),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '88' :const ProgressInfo(raiseP: 0.1, callP: 0.9),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.3),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.3),


              'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.44, callP: 0.56),
              'AJs':const ProgressInfo(raiseP: 0.17, callP: 0.83),
              'ATs':const ProgressInfo(raiseP: 0.43, callP: 0.57),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'A8s':const ProgressInfo(raiseP: 0.17, callP: 0.83),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.58),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.17),
              'A5s':const ProgressInfo(raiseP: 0.31, callP: 0.69),
              'A4s':const ProgressInfo(raiseP: 0.20, callP: 0.80),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.44),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.15, callP: 0.45, alreadyP: 0.0, allinP: 0.4),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.39, callP: 0.61),
              'KTs':const ProgressInfo(raiseP: 0.17, callP: 0.83),
              'K6s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.8, allinP: 0.0),
              'K7s':const ProgressInfo(raiseP: 0.0, callP: 0.2, alreadyP: 0.7, allinP: 0.0),


              'AQo':const ProgressInfo(raiseP: 0.24, callP: 0.76),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.10, callP: 0.90),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.18, callP: 0.82),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 0.35),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.21, callP: 0.79),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.45),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.87),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.BTN:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 0.7, callP: 0.00, alreadyP: 0.0, allinP: 0.3),
              'QQ' :const ProgressInfo(raiseP: 0.27, callP: 0.73),
              'JJ' :const ProgressInfo(raiseP: 0.20, callP: 0.80),
              'TT' :const ProgressInfo(raiseP: 0.15, callP: 0.85),
              '99' :const ProgressInfo(raiseP: 0.15, callP: 0.85),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.3, allinP: 0.0),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.3, allinP: 0.0),


              'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.46, callP: 0.54),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.45, callP: 0.55),
              'A9s':const ProgressInfo(raiseP: 0.17, callP: 0.83),
              'A8s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
              'A7s':const ProgressInfo(raiseP: 0.1 , callP: 0.9),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.49),
              'A5s':const ProgressInfo(raiseP: 0.27, callP: 0.73),
              'A4s':const ProgressInfo(raiseP: 0.17, callP: 0.83),
              'A3s':const ProgressInfo(raiseP: 0.1 , callP: 0.7),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.15, callP: 0.45, alreadyP: 0.0, allinP: 0.4),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.26, callP: 0.74),
              'KTs':const ProgressInfo(raiseP: 0.26, callP: 0.74),
              'K9s':const ProgressInfo(raiseP: 0.00, callP: 0.44),
              'K7s':const ProgressInfo(raiseP: 0.00, callP: 0.2, alreadyP: 0.7),
              'K6s':const ProgressInfo(raiseP: 0.00, callP: 1.0, alreadyP: 0.8),


              'AQo':const ProgressInfo(raiseP: 0.26, callP: 0.74),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.1 ),
              'QJs':const ProgressInfo(raiseP: 0.14, callP: 0.86),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.1 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.23, callP: 0.77),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 0.32),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.20, callP: 0.80),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.18),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.1 , callP: 0.9),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.SB:
            return {
              'AA' :const ProgressInfo(raiseP: 0.36, callP: 0.64),
              'KK' :const ProgressInfo(raiseP: 0.1, callP: 0.55, allinP: 0.35),
              'QQ' :const ProgressInfo(raiseP: 0.0, callP: 1.0),
              'JJ' :const ProgressInfo(raiseP: 0.0, callP: 1.0),
              'TT' :const ProgressInfo(raiseP: 0.0, callP: 1.0),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 0.80),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.74),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.70),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.43),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.52),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.8, alreadyP: 0.3),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.8, alreadyP: 0.3),


              'AKs':const ProgressInfo(raiseP: 0.27, callP: 0.73),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'ATs':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'A9s':const ProgressInfo(raiseP: 0.00, callP: 0.51),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 0.41),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.18),

              'A5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A4s':const ProgressInfo(raiseP: 0.00, callP: 0.85),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.17),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0, callP: 0.5, allinP: 0.5),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K9s':const ProgressInfo(raiseP: 0.00, callP: 0.00),


              'AQo':const ProgressInfo(raiseP: 0.1, callP: 0.6),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.80),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),



              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.00, callP: 0.54),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.41),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.BB:
            return {
              'AA' :const ProgressInfo(raiseP: 0.45, callP: 0.55),
              'KK' :const ProgressInfo(raiseP: 0.2, callP: 0.6, allinP:0.2),
              'QQ' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'JJ' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'TT' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 0.78),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 0.72),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.76),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.63),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.35),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.37),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.4, alreadyP: 0.3),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.3, alreadyP: 0.3),


              'AKs':const ProgressInfo(raiseP: 0.36, callP: 0.64),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.12, callP: 0.88),
              'A9s':const ProgressInfo(raiseP: 0.12, callP: 0.88),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 0.73),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.39),

              'A5s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'A4s':const ProgressInfo(raiseP: 0.1, callP: 0.7),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0, callP: 0.7, allinP: 0.3),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.10, callP: 0.90),
              'KTs':const ProgressInfo(raiseP: 0.12, callP: 0.75),
              'K9s':const ProgressInfo(raiseP: 0.00, callP: 0.00),


              'AQo':const ProgressInfo(raiseP: 0.1, callP: 0.15),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.77),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.00, callP: 0.80),



              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.00, callP: 0.35),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.20),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.85, alreadyP: 0.5),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.7),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.8, alreadyP: 0.7),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      } else if (tournaSelection.myTournaPosition == TournaPosition.LJ) {
        switch (tournaSelection.opponentTournaPosition) {
          case TournaPosition.HJ:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 0.6, callP: 0.00, allinP: 0.4),
              'QQ' :const ProgressInfo(raiseP: 0.51, callP: 0.49),
              'JJ' :const ProgressInfo(raiseP: 0.38, callP: 0.62),
              'TT' :const ProgressInfo(raiseP: 0.35, callP: 0.65),
              '99' :const ProgressInfo(raiseP: 0.15, callP: 0.85),
              '88' :const ProgressInfo(raiseP: 0.16, callP: 0.84),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.84),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.68),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.72),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.25),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.3),


              'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.40, callP: 0.60),
              'AJs':const ProgressInfo(raiseP: 0.12, callP: 0.88),
              'ATs':const ProgressInfo(raiseP: 0.59, callP: 0.41),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'A8s':const ProgressInfo(raiseP: 0.20, callP: 0.60),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.18, callP: 0.82),
              'A4s':const ProgressInfo(raiseP: 0.00, callP: 0.65),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.1, callP: 0.3, allinP: 0.6),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.72, callP: 0.28),
              'KTs':const ProgressInfo(raiseP: 0.41, callP: 0.59),
              'K9s':const ProgressInfo(raiseP: 0.00, callP: 0.26),
              'K6s':const ProgressInfo(raiseP: 0.00, callP: 0.5, alreadyP: 0.5),


              'AQo':const ProgressInfo(raiseP: 0.56, callP: 0.44),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.12, callP: 0.88),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.17, callP: 0.83),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 0.18),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.21, callP: 0.79),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.17),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.46),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.4),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.6),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.65),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.CO:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 0.7, callP: 0.00, allinP: 0.3),
              'QQ' :const ProgressInfo(raiseP: 0.4, callP: 0.45, allinP: 0.15),
              'JJ' :const ProgressInfo(raiseP: 0.37, callP: 0.63),
              'TT' :const ProgressInfo(raiseP: 0.39, callP: 0.61),
              '99' :const ProgressInfo(raiseP: 0.20, callP: 0.80),
              '88' :const ProgressInfo(raiseP: 0.15, callP: 0.85),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.89),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.64),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.83),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.25),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.3),


              'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.52, callP: 0.48),
              'A9s':const ProgressInfo(raiseP: 0.14, callP: 0.86),
              'A8s':const ProgressInfo(raiseP: 0.20, callP: 0.80),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.24),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.28, callP: 0.72),
              'A4s':const ProgressInfo(raiseP: 0.00, callP: 0.8),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.1),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.15, callP: 0.20, allinP: 0.65),
              'KQs':const ProgressInfo(raiseP: 0.12, callP: 0.88),
              'KJs':const ProgressInfo(raiseP: 0.47, callP: 0.53),
              'KTs':const ProgressInfo(raiseP: 0.49, callP: 0.51),
              'K9s':const ProgressInfo(raiseP: 0.11, callP: 0.52),
              'K6s':const ProgressInfo(raiseP: 0.00, callP: 0.75, alreadyP: 0.5),


              'AQo':const ProgressInfo(raiseP: 0.58, callP: 0.42),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.1 ),
              'QJs':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.26, callP: 0.74),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 0.22),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.18, callP: 0.82),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.17),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.61),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.4),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.6),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.65),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.BTN:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 0.65, callP: 0.00, allinP: 0.35),
              'QQ' :const ProgressInfo(raiseP: 0.52, callP: 0.48),
              'JJ' :const ProgressInfo(raiseP: 0.35, callP: 0.65),
              'TT' :const ProgressInfo(raiseP: 0.35, callP: 0.65),
              '99' :const ProgressInfo(raiseP: 0.24, callP: 0.76),
              '88' :const ProgressInfo(raiseP: 0.10, callP: 0.90),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.89),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.70),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.83),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.25),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.3),


              'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.36, callP: 0.64),
              'A9s':const ProgressInfo(raiseP: 0.29, callP: 0.71),
              'A8s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
              'A7s':const ProgressInfo(raiseP: 0.14, callP: 0.48),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.28),
              'A5s':const ProgressInfo(raiseP: 0.18, callP: 0.82),
              'A4s':const ProgressInfo(raiseP: 0.13, callP: 0.87),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.61),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.2, callP: 0.15, allinP: 0.65),
              'KQs':const ProgressInfo(raiseP: 0.14, callP: 0.86),
              'KJs':const ProgressInfo(raiseP: 0.27, callP: 0.73),
              'KTs':const ProgressInfo(raiseP: 0.52, callP: 0.48),
              'K9s':const ProgressInfo(raiseP: 0.29, callP: 0.59),
              'K8s':const ProgressInfo(raiseP: 0.00, callP: 0.17),
              'K6s':const ProgressInfo(raiseP: 0.00, callP: 0.8, alreadyP: 0.5),


              'AQo':const ProgressInfo(raiseP: 0.62, callP: 0.38),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.27),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AJo':const ProgressInfo(raiseP: 0.11, callP: 0.10),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.35, callP: 0.65),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 0.30),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.17, callP: 0.83),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.63),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.4),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.6),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.65),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.SB:
            return {
              'AA' :const ProgressInfo(raiseP: 0.75, callP: 0.25),
              'KK' :const ProgressInfo(raiseP: 0.25, callP: 0.5, allinP: 0.25),
              'QQ' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'JJ' :const ProgressInfo(raiseP: 0.13, callP: 0.87),
              'TT' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.81),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.66),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.39),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.39),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.55, alreadyP: 0.25),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.7, alreadyP: 0.3),


              'AKs':const ProgressInfo(raiseP: 0.57, callP: 0.43),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.21, callP: 0.79),
              'A9s':const ProgressInfo(raiseP: 0.00, callP: 0.58),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 0.48),
              'A7s':const ProgressInfo(raiseP: 0.00, callP: 0.31),

              'A5s':const ProgressInfo(raiseP: 0.14, callP: 0.86),
              'A4s':const ProgressInfo(raiseP: 0.13, callP: 0.87),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.26),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0, callP: 0.7, allinP: 0.3),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KTs':const ProgressInfo(raiseP: 0.14, callP: 0.86),
              'K9s':const ProgressInfo(raiseP: 0.13, callP: 0.00),
              'K8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'K6s':const ProgressInfo(raiseP: 0.00, callP: 0.75, alreadyP: 0.5),


              'AQo':const ProgressInfo(raiseP: 0.23, callP: 0.77),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AJo':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 0.17),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.00, callP: 0.86),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.51),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.85, alreadyP: 0.4),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.6),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.65),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.BB:
            return {
              'AA' :const ProgressInfo(raiseP: 0.50, callP: 0.50),
              'KK' :const ProgressInfo(raiseP: 0.2, callP: 0.50, allinP: 0.3),
              'QQ' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'JJ' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'TT' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 0.88),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.81),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.71),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.40),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.36),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.3, alreadyP: 0.25),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.15, alreadyP: 0.3),


              'AKs':const ProgressInfo(raiseP: 0.34, callP: 0.66),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.11, callP: 0.89),
              'A9s':const ProgressInfo(raiseP: 0.15, callP: 0.8),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 0.86),
              'A7s':const ProgressInfo(raiseP: 0.1, callP: 0.45),
              'A5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A4s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.34),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0, callP: 0.55, allinP: 0.45),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K9s':const ProgressInfo(raiseP: 0.00, callP: 0.30),
              'K8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'K6s':const ProgressInfo(raiseP: 0.00, callP: 0.2, alreadyP: 0.5),


              'AQo':const ProgressInfo(raiseP: 0.11, callP: 0.40),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AJo':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 0.12),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.00, callP: 0.46),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.18),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.4),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.6),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.6, alreadyP: 0.65),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      }
      else if (tournaSelection.myTournaPosition == TournaPosition.HJ) {
        switch (tournaSelection.opponentTournaPosition) {
          case TournaPosition.CO:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'QQ' :const ProgressInfo(raiseP: 0.65, callP: 0.20, allinP: 0.15),
              'JJ' :const ProgressInfo(raiseP: 0.45, callP: 0.55),
              'TT' :const ProgressInfo(raiseP: 0.49, callP: 0.51),
              '99' :const ProgressInfo(raiseP: 0.21, callP: 0.79),
              '88' :const ProgressInfo(raiseP: 0.1, callP: 0.9),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.38, callP: 0.62),
              'A9s':const ProgressInfo(raiseP: 0.34, callP: 0.66),
              'A8s':const ProgressInfo(raiseP: 0.34, callP: 0.66),
              'A7s':const ProgressInfo(raiseP: 0.31, callP: 0.69),
              'A6s':const ProgressInfo(raiseP: 0.1, callP: 0.2),
              'A5s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
              'A4s':const ProgressInfo(raiseP: 0.20, callP: 0.80),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.55),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.45, callP: 0.25, allinP: 0.3),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.39, callP: 0.61),
              'KTs':const ProgressInfo(raiseP: 0.68, callP: 0.32),
              'K9s':const ProgressInfo(raiseP: 0.41, callP: 0.59),
              'K8s':const ProgressInfo(raiseP: 0.0, callP: 0.4),
              'K6s':const ProgressInfo(raiseP: 0.1, callP: 0.3),


              'AQo':const ProgressInfo(raiseP: 0.61, callP: 0.39),
              'KQo':const ProgressInfo(raiseP: 0.14, callP: 0.38),
              'QJs':const ProgressInfo(raiseP: 0.14, callP: 0.86),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AJo':const ProgressInfo(raiseP: 0.23, callP: 0.18),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.32, callP: 0.68),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 0.64),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.20, callP: 0.80),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.38),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.72),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.82),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.77),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.BTN:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'QQ' :const ProgressInfo(raiseP: 0.65, callP: 0.20, allinP: 0.15),
              'JJ' :const ProgressInfo(raiseP: 0.41, callP: 0.59),
              'TT' :const ProgressInfo(raiseP: 0.42, callP: 0.58),
              '99' :const ProgressInfo(raiseP: 0.18, callP: 0.82),
              '88' :const ProgressInfo(raiseP: 0.15, callP: 0.85),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A9s':const ProgressInfo(raiseP: 0.35, callP: 0.65),
              'A8s':const ProgressInfo(raiseP: 0.55, callP: 0.45),
              'A7s':const ProgressInfo(raiseP: 0.37, callP: 0.63),
              'A6s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
              'A5s':const ProgressInfo(raiseP: 0.31, callP: 0.69),
              'A4s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'A3s':const ProgressInfo(raiseP: 0.1 , callP: 0.9),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.25),

              'AKo':const ProgressInfo(raiseP: 0.5, callP: 0.1, allinP: 0.4),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KTs':const ProgressInfo(raiseP: 0.55, callP: 0.45),
              'K9s':const ProgressInfo(raiseP: 0.61, callP: 0.39),
              'K8s':const ProgressInfo(raiseP: 0.00, callP: 0.71),
              'K7s':const ProgressInfo(raiseP: 0.1, callP: 0.3),
              'K6s':const ProgressInfo(raiseP: 0.14, callP: 0.43),


              'AQo':const ProgressInfo(raiseP: 0.64, callP: 0.36),
              'KQo':const ProgressInfo(raiseP: 0.20, callP: 0.60),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AJo':const ProgressInfo(raiseP: 0.28, callP: 0.33),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.32, callP: 0.68),
              'J9s':const ProgressInfo(raiseP: 0.1, callP: 0.5),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.27, callP: 0.73),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.52),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.83),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.SB:
            return {
              'AA' :const ProgressInfo(raiseP: 0.86, callP: 0.14),
              'KK' :const ProgressInfo(raiseP: 0.51, callP: 0.49),
              'QQ' :const ProgressInfo(raiseP: 0.12, callP: 0.88),
              'JJ' :const ProgressInfo(raiseP: 0.18, callP: 0.82),
              'TT' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.43),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.47),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.30),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.23),


              'AKs':const ProgressInfo(raiseP: 0.67, callP: 0.33),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A9s':const ProgressInfo(raiseP: 0.14, callP: 0.86),
              'A8s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
              'A7s':const ProgressInfo(raiseP: 0.10, callP: 0.50),
              'A6s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'A5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A4s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'A3s':const ProgressInfo(raiseP: 0.14, callP: 0.86),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),

              'AKo':const ProgressInfo(raiseP: 0.24, callP: 0.76),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K9s':const ProgressInfo(raiseP: 0.26, callP: 0.51),
              'K8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'K7s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'K6s':const ProgressInfo(raiseP: 0.1, callP: 0.6),


              'AQo':const ProgressInfo(raiseP: 0.23, callP: 0.77),
              'KQo':const ProgressInfo(raiseP: 0.14, callP: 0.46),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AJo':const ProgressInfo(raiseP: 0.18, callP: 0.20),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'J9s':const ProgressInfo(raiseP: 0.1, callP: 0.9),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'T8s':const ProgressInfo(raiseP: 0.14, callP: 0.30),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.51),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.65),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.70),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.61),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.5),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.BB:
            return {
              'AA' :const ProgressInfo(raiseP: 0.68, callP: 0.32),
              'KK' :const ProgressInfo(raiseP: 0.45, callP: 0.55),
              'QQ' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'JJ' :const ProgressInfo(raiseP: 0.14, callP: 0.86),
              'TT' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.83),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.39),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.39),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AKs':const ProgressInfo(raiseP: 0.31, callP: 0.69),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A7s':const ProgressInfo(raiseP: 0.21, callP: 0.79),
              'A6s':const ProgressInfo(raiseP: 0.00, callP: 0.33),
              'A5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A4s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
              'A3s':const ProgressInfo(raiseP: 0.21, callP: 0.64),
              'A2s':const ProgressInfo(raiseP: 0.1 , callP: 0.00),

              'AKo':const ProgressInfo(raiseP: 0.15, callP: 0.50, allinP: 0.35),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K9s':const ProgressInfo(raiseP: 0.16, callP: 0.61),
              'K8s':const ProgressInfo(raiseP: 0.00, callP: 0.15),
              'K7s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'K6s':const ProgressInfo(raiseP: 0.15, callP: 0.67),


              'AQo':const ProgressInfo(raiseP: 0.23, callP: 0.77),
              'KQo':const ProgressInfo(raiseP: 0.00, callP: 0.32),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.13),


              'AJo':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.15),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.79),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.59),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.35),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.9, alreadyP: 0.5),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      } else if (tournaSelection.myTournaPosition == TournaPosition.CO) {
        switch (tournaSelection.opponentTournaPosition) {
          case TournaPosition.BTN:
            return {
              'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'QQ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'JJ' :const ProgressInfo(raiseP: 0.6, callP: 0.25, allinP: 0.15),
              'TT' :const ProgressInfo(raiseP: 0.38, callP: 0.62),
              '99' :const ProgressInfo(raiseP: 0.34, callP: 0.66),
              '88' :const ProgressInfo(raiseP: 0.21, callP: 0.79),
              '77' :const ProgressInfo(raiseP: 0.15, callP: 0.85),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A9s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
              'A8s':const ProgressInfo(raiseP: 0.50, callP: 0.50),
              'A7s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
              'A6s':const ProgressInfo(raiseP: 0.32, callP: 0.68),
              'A5s':const ProgressInfo(raiseP: 0.39, callP: 0.61),
              'A4s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),

              'AKo':const ProgressInfo(raiseP: 0.75, callP: 0.00, allinP: 0.25),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.18, callP: 0.82),
              'KTs':const ProgressInfo(raiseP: 0.33, callP: 0.67),
              'K9s':const ProgressInfo(raiseP: 0.82, callP: 0.18),
              'K8s':const ProgressInfo(raiseP: 0.27, callP: 0.73),
              'K7s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
              'K6s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
              'K5s':const ProgressInfo(raiseP: 0.00, callP: 0.52),


              'AQo':const ProgressInfo(raiseP: 0.78, callP: 0.22),
              'KQo':const ProgressInfo(raiseP: 0.28, callP: 0.72),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'Q9s':const ProgressInfo(raiseP: 0.1 , callP: 0.9),


              'AJo':const ProgressInfo(raiseP: 0.45, callP: 0.55),
              'KJo':const ProgressInfo(raiseP: 0.1 , callP: 0.4),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.41, callP: 0.59),
              'J9s':const ProgressInfo(raiseP: 0.28, callP: 0.72),
              'J8s':const ProgressInfo(raiseP: 0.0, callP: 0.1),


              'ATo':const ProgressInfo(raiseP: 0.1 , callP: 0.3),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
              'T8s':const ProgressInfo(raiseP: 0.1, callP: 0.9),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.1 , callP: 0.9),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.40),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.42),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.SB:
            return {
              'AA' :const ProgressInfo(raiseP: 0.81, callP: 0.19),
              'KK' :const ProgressInfo(raiseP: 0.66, callP: 0.34),
              'QQ' :const ProgressInfo(raiseP: 0.12, callP: 0.88),
              'JJ' :const ProgressInfo(raiseP: 0.20, callP: 0.80),
              'TT' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.82),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.53),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.38),


              'AKs':const ProgressInfo(raiseP: 0.82, callP: 0.18),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A9s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
              'A8s':const ProgressInfo(raiseP: 0.0, callP: 1.00),
              'A7s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
              'A6s':const ProgressInfo(raiseP: 0.14, callP: 0.86),
              'A5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A4s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A3s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A2s':const ProgressInfo(raiseP: 0.18, callP: 0.71),

              'AKo':const ProgressInfo(raiseP: 0.32, callP: 0.68),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K9s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
              'K8s':const ProgressInfo(raiseP: 0.00, callP: 0.50),
              'K7s':const ProgressInfo(raiseP: 0.00, callP: 0.48),
              'K6s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'K5s':const ProgressInfo(raiseP: 0.00, callP: 0.40),


              'AQo':const ProgressInfo(raiseP: 0.10, callP: 0.90),
              'KQo':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'Q9s':const ProgressInfo(raiseP: 0.11, callP: 0.89),
              'Q8s':const ProgressInfo(raiseP: 0.20, callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.25, callP: 0.75),
              'KJo':const ProgressInfo(raiseP: 0.1 , callP: 0.35),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'J8s':const ProgressInfo(raiseP: 0.00, callP: 0.60),


              'ATo':const ProgressInfo(raiseP: 0.32, callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.74),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.26),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.BB:
            return {
              'AA' :const ProgressInfo(raiseP: 0.63, callP: 0.37),
              'KK' :const ProgressInfo(raiseP: 0.61, callP: 0.39),
              'QQ' :const ProgressInfo(raiseP: 0.12, callP: 0.88),
              'JJ' :const ProgressInfo(raiseP: 0.14, callP: 0.86),
              'TT' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.64),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.46),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.12),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AKs':const ProgressInfo(raiseP: 0.57, callP: 0.43),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A7s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A6s':const ProgressInfo(raiseP: 0.14, callP: 0.86),
              'A5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A4s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A3s':const ProgressInfo(raiseP: 0.13, callP: 0.87),
              'A2s':const ProgressInfo(raiseP: 0.25, callP: 0.39),

              'AKo':const ProgressInfo(raiseP: 0.15, callP: 0.40, allinP: 0.35),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K9s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
              'K8s':const ProgressInfo(raiseP: 0.00, callP: 0.40),
              'K7s':const ProgressInfo(raiseP: 0.00, callP: 0.4),
              'K6s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K5s':const ProgressInfo(raiseP: 0.18, callP: 0.13),


              'AQo':const ProgressInfo(raiseP: 0.19, callP: 0.81),
              'KQo':const ProgressInfo(raiseP: 0.10, callP: 0.90),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'Q9s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'Q8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.17, callP: 0.49),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.29),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'J8s':const ProgressInfo(raiseP: 0.1, callP: 0.3),


              'ATo':const ProgressInfo(raiseP: 0.00, callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.75),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.81),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.94),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.68),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.85),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      } else if (tournaSelection.myTournaPosition == TournaPosition.BTN) {
        switch (tournaSelection.opponentTournaPosition) {
          case TournaPosition.SB:
            return {
              'AA' :const ProgressInfo(raiseP: 0.82, callP: 0.18),
              'KK' :const ProgressInfo(raiseP: 0.89, callP: 0.11),
              'QQ' :const ProgressInfo(raiseP: 0.52, callP: 0.48),
              'JJ' :const ProgressInfo(raiseP: 0.30, callP: 0.70),
              'TT' :const ProgressInfo(raiseP: 0.20, callP: 0.80),
              '99' :const ProgressInfo(raiseP: 0.1, callP: 0.6, allinP: 0.3),
              '88' :const ProgressInfo(raiseP: 0.13, callP: 0.87),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.0),
              'AQs':const ProgressInfo(raiseP: 0.18, callP: 0.82),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A7s':const ProgressInfo(raiseP: 0.0, callP: 1.00),
              'A6s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'A5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A4s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A3s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A2s':const ProgressInfo(raiseP: 0.11, callP: 0.89),

              'AKo':const ProgressInfo(raiseP: 0.55, callP: 0.15, allinP: 0.3),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K7s':const ProgressInfo(raiseP: 0.12, callP: 0.88),
              'K6s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K5s':const ProgressInfo(raiseP: 0.17, callP: 0.83),
              'K4s':const ProgressInfo(raiseP: 0.18, callP: 0.82),


              'AQo':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KQo':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'Q9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'Q8s':const ProgressInfo(raiseP: 0.32, callP: 0.68),
              'Q6s':const ProgressInfo(raiseP: 0.13, callP: 0.87),


              'AJo':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJo':const ProgressInfo(raiseP: 0.13, callP: 0.87),
              'QJo':const ProgressInfo(raiseP: 0.25, callP: 0.60, allinP: 0.15),
              'JTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'J8s':const ProgressInfo(raiseP: 0.30, callP: 0.70),


              'ATo':const ProgressInfo(raiseP: 0.22, callP: 0.78),
              'KTo':const ProgressInfo(raiseP: 0.14, callP: 0.37),
              'QTo':const ProgressInfo(raiseP: 0.14, callP: 0.23),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.20),
              'T9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'T7s':const ProgressInfo(raiseP: 0.1, callP: 0.9),


              'A9o':const ProgressInfo(raiseP: 0.31, callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.50),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '75s':const ProgressInfo(raiseP: 0.22, callP: 0.78),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.24),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.68),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.BB:
            return {
              'AA' :const ProgressInfo(raiseP: 0.67, callP: 0.33),
              'KK' :const ProgressInfo(raiseP: 0.77, callP: 0.23),
              'QQ' :const ProgressInfo(raiseP: 0.40, callP: 0.60),
              'JJ' :const ProgressInfo(raiseP: 0.28, callP: 0.72),
              'TT' :const ProgressInfo(raiseP: 0.18, callP: 0.82),
              '99' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.34),


              'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.0),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A7s':const ProgressInfo(raiseP: 0.0, callP: 1.00),
              'A6s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A4s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A3s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'A2s':const ProgressInfo(raiseP: 0.13, callP: 0.87),

              'AKo':const ProgressInfo(raiseP: 0.4, callP: 0.10, allinP: 0.5),
              'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K7s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K6s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'K5s':const ProgressInfo(raiseP: 0.13, callP: 0.87),
              'K4s':const ProgressInfo(raiseP: 0.19, callP: 0.81),
              'K3s':const ProgressInfo(raiseP: 0.19, callP: 0.00),


              'AQo':const ProgressInfo(raiseP: 0.12, callP: 0.88),
              'KQo':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'Q9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'Q8s':const ProgressInfo(raiseP: 0.16, callP: 0.84),
              'Q7s':const ProgressInfo(raiseP: 0.0, callP: 0.3),
              'Q6s':const ProgressInfo(raiseP: 0.0, callP: 0.5),
              'Q5s':const ProgressInfo(raiseP: 0.20, callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.16, callP: 0.84),
              'KJo':const ProgressInfo(raiseP: 0.13, callP: 0.87),
              'QJo':const ProgressInfo(raiseP: 0.17, callP: 0.47),
              'JTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'J9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'J8s':const ProgressInfo(raiseP: 0.13, callP: 0.87),
              'J7s':const ProgressInfo(raiseP: 0.1, callP: 0.0),


              'ATo':const ProgressInfo(raiseP: 0.15, callP: 0.65, allinP: 0.2),
              'KTo':const ProgressInfo(raiseP: 0.09, callP: 0.51),
              'QTo':const ProgressInfo(raiseP: 0.13, callP: 0.27),
              'JTo':const ProgressInfo(raiseP: 0.12, callP: 0.49),
              'T9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'T8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'T7s':const ProgressInfo(raiseP: 0.1, callP: 0.9),


              'A9o':const ProgressInfo(raiseP: 0.14, callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),



              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '75s':const ProgressInfo(raiseP: 0.00, callP: 0.22),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.20),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      } else if (tournaSelection.myTournaPosition == TournaPosition.SB) {
        switch (tournaSelection.opponentTournaPosition) {
          case TournaPosition.BB:
            return {
              'AA' :const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.7),
              'KK' :const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.75),
              'QQ' :const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.75),
              'JJ' :const ProgressInfo(raiseP: 0.5, callP: 0.5, alreadyP: 0.7),
              'TT' :const ProgressInfo(raiseP: 0.4, callP: 0.6, alreadyP: 0.7),
              '99' :const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.75),
              '88' :const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.8),
              '77' :const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.85),
              '66' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
              '55' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
              '44' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
              '33' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
              '22' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

              'AKs':const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.5),
              'AQs':const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.75),
              'AJs':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.4),
              'ATs':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.35),
              'A9s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.5),
              'A8s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.55),
              'A7s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.7),
              'A6s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.9),
              'A5s':const ProgressInfo(allinP: 0.1, callP: 0.9, alreadyP: 0.65),
              'A4s':const ProgressInfo(allinP: 0.3, callP: 0.7, alreadyP: 0.85),
              'A3s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
              'A2s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

              'AKo':const ProgressInfo(raiseP: 0.7, allinP: 0.3, alreadyP: 0.8),
              'KQs':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.4),
              'KJs':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.4),
              'KTs':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.5),
              'K9s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.8),
              'K8s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.8),
              'K7s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.85),
              'K6s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

              'AQo':const ProgressInfo(raiseP: 0.4, callP: 0.6, alreadyP: 0.7),
              'KQo':const ProgressInfo(raiseP: 0.6, callP: 0.4, alreadyP: 0.85),
              'QJs':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.4),
              'QTs':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.5),
              'Q9s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.9),
              'Q8s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.9),

              'AJo':const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.85),
              'KJo':const ProgressInfo(raiseP: 0.85, callP: 0.15, alreadyP: 0.9),
              'QJo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
              'JTs':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.5),
              'J9s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.8),
              'J8s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

              'ATo':const ProgressInfo(raiseP: 1.0, callP: 0.0, alreadyP: 0.85),
              'A9o':const ProgressInfo(raiseP: 0.2, callP: 0.0, alreadyP: 0.85),
              'A5o':const ProgressInfo(raiseP: 0.5, callP: 0.0, alreadyP: 0.9),
              'KTo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
              'QTo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
              'JTo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
              'T9s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.7),
              'T8s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.9),
              'T7s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

              '98s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.9),
              '97s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
              '96s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

              '87s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.85),
              '86s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.8),

              '76s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.8),
              '75s':const ProgressInfo(raiseP: 0.0, callP: 0.5, alreadyP: 0.9),

              '65s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.75),
              '64s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

              '54s':const ProgressInfo(raiseP: 0.0, callP: 1.0, alreadyP: 0.75),
              '53s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
              '52s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

              '43s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
              '42s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),


            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      }
    }
    //4bet pot
    else if (tournaSelection.opponentAction == OpponentAction.fourBet) {
      if (tournaSelection.myTournaPosition == TournaPosition.UTG1) {
        switch (tournaSelection.opponentTournaPosition) {
          case TournaPosition.UTG:
            return {
              'AA' :const ProgressInfo(allinP: 0.19, callP: 0.81),
              'KK' :const ProgressInfo(allinP: 0.30, callP: 0.70, alreadyP: 0.25),
              'QQ' :const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.48),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.48),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.50),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.65),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.75),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.90, callP: 0.10),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.70),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.47),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.37),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.74),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.52),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.66),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.20, alreadyP: 0.34),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.27, alreadyP: 0.44),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 , alreadyP: 0.00),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 , alreadyP: 0.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.40, alreadyP: 0.66),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.00, alreadyP: 0.00),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.80),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.89),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      } else if (tournaSelection.myTournaPosition == TournaPosition.LJ) {
        switch (tournaSelection.opponentTournaPosition) {
          case TournaPosition.UTG:
            return {
              'AA' :const ProgressInfo(allinP: 0.18, callP: 0.82),
              'KK' :const ProgressInfo(allinP: 0.30, callP: 0.70, alreadyP: 0.14),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.50),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.50),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.50),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.65),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.72),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.75),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.90),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 1.0 , callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.62),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.32),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.71),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.50),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.50, alreadyP: 0.45),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.40, alreadyP: 0.49),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.25, alreadyP: 0.67),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.70),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.60, alreadyP: 0.76),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.90),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.90),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.80),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.90),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.UTG1:
            return {
              'AA' :const ProgressInfo(allinP: 0.22, callP: 0.78),
              'KK' :const ProgressInfo(allinP: 0.30, callP: 0.70),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.49),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.47),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.49),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.61),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.64),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.66),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.73),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.84),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 1.0 , callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.58),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.58),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.33),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.48),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.45),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.75),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.44),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.20, alreadyP: 0.40),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.60, alreadyP: 0.41),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.54),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.74),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.92),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.79),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      } else if (tournaSelection.myTournaPosition == TournaPosition.HJ) {
        switch (tournaSelection.opponentTournaPosition) {
          case TournaPosition.UTG:
            return {
              'AA' :const ProgressInfo(allinP: 0.20, callP: 0.80, alreadyP: 0.00),
              'KK' :const ProgressInfo(allinP: 0.30, callP: 0.70, alreadyP: 0.15),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.74),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.77),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.81),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00, alreadyP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00, alreadyP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 1.00, callP: 0.06),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.58),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.33),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.70),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.80),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.60),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.20, alreadyP: 0.50),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.50, alreadyP: 0.64),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.15, alreadyP: 0.60),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.30, alreadyP: 0.70),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.73),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.80),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.87),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.88),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.73),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.91),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.UTG1:
            return {
              'AA' :const ProgressInfo(allinP: 0.20, callP: 0.82, alreadyP: 0.00),
              'KK' :const ProgressInfo(allinP: 0.35, callP: 0.65, alreadyP: 0.00),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.58),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.52),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.54),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.61),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.72),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.78),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.84),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00, alreadyP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.50),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.62),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.32),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.20, alreadyP: 0.56),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.50),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.54),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.85),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.58),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.65, alreadyP: 0.51),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.70, alreadyP: 0.53),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.40, alreadyP: 0.52),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.57),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.94),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.84),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.92),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.74),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.95),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.LJ:
            return {
              'AA' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KK' :const ProgressInfo(allinP: 0.80, callP: 0.20),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.45),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.52),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.73),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.75),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.77),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.79),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.37),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.68),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.51),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.55, alreadyP: 0.57),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.46),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 0.40, callP: 0.60, alreadyP: 0.42),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.48),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.49),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.20, alreadyP: 0.32),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.48),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.58),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.40, alreadyP: 0.59),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.50, alreadyP: 0.53),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.66),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.88),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.88),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.91),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.71),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.91),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      } else if (tournaSelection.myTournaPosition == TournaPosition.CO) {
        switch (tournaSelection.opponentTournaPosition) {
          case TournaPosition.UTG:
            return {
              'AA' :const ProgressInfo(allinP: 0.15, callP: 0.83, alreadyP: 0.00),
              'KK' :const ProgressInfo(allinP: 0.33, callP: 0.58, alreadyP: 0.00),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.58),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.80),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.84),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 1.0 , callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.43),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.39),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.57),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00, alreadyP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.64),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.88),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.75, alreadyP: 0.77),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.20, alreadyP: 0.70),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.50, alreadyP: 0.84),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.60),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.80),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.93),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.78),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.84),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.68),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.86),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.UTG1:
            return {
              'AA' :const ProgressInfo(allinP: 0.11, callP: 0.89, alreadyP: 0.00),
              'KK' :const ProgressInfo(allinP: 0.40, callP: 0.60, alreadyP: 0.00),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.53),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.54),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.61),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.71),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.77),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.84),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00, alreadyP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.24),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.74),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.40),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.25, alreadyP: 0.51),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.80, alreadyP: 0.66),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.52),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.78),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.57),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.51),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.64),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.70),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.75, alreadyP: 0.64),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.53),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.79),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.87),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.81),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.66),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.0, alreadyP: 0.84),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.LJ:
            return {
              'AA' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KK' :const ProgressInfo(allinP: 0.75, callP: 0.25, alreadyP: 0.00),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.41),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.52),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.60),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.68),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.72),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.80),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 1.00, callP: 0.00, alreadyP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.32),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.64),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.75, alreadyP: 0.51),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.68),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.53),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.64),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.93),

              'AKo':const ProgressInfo(allinP: 0.40, callP: 0.60, alreadyP: 0.00),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.80),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.44),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.51),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.15, alreadyP: 0.42),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.78),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.72),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.60),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.63),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.70),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.89),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.70),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.80),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.57),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.77),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.HJ:
            return {
              'AA' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KK' :const ProgressInfo(allinP: 0.85, callP: 0.16),
              'QQ' :const ProgressInfo(allinP: 0.30, callP: 0.70, alreadyP: 0.35),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.62),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.75),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.74),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.82),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.83),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.30, callP: 0.70),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.90, alreadyP: 0.10),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.88),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.91),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.64),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.40, alreadyP: 0.55),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.54),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.66),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.71),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),

              'AKo':const ProgressInfo(allinP: 0.85, callP: 0.15, alreadyP: 0.00),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.74),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.61),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.70),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.40, alreadyP: 0.46),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.80, alreadyP: 0.71),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.78),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.77),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.60, alreadyP: 0.50),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.40, alreadyP: 0.55),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.87),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.72),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.72),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      } else if (tournaSelection.myTournaPosition == TournaPosition.BTN) {
        switch (tournaSelection.opponentTournaPosition) {
          case TournaPosition.UTG:
            return {
              'AA' :const ProgressInfo(allinP: 0.15, callP: 1.00),
              'KK' :const ProgressInfo(allinP: 0.35, callP: 0.65, alreadyP: 0.07),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.62),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.57),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.57),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.68),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.85),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.91),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.85, callP: 0.15),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.47),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.29),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.83),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.79),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.63),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.53),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.88),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.75, alreadyP: 0.62),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.84),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.92),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.77),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.UTG1:
            return {
              'AA' :const ProgressInfo(allinP: 0.15, callP: 0.85),
              'KK' :const ProgressInfo(allinP: 0.35, callP: 0.65),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.63),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.58),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.54),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.65),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.72),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.90),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.33),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.44),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.55, alreadyP: 0.57),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.46),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.81),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.58),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.00, alreadyP: 0.00),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.54),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.77),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.75, alreadyP: 0.73),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.35, alreadyP: 0.75),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.38),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.78),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.87),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.80),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.77),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.65),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.81),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.LJ:
            return {
              'AA' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KK' :const ProgressInfo(allinP: 0.75, callP: 0.25),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.36),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.53),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.81),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.87),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.94),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.22),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.77),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.65),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.75, alreadyP: 0.75),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.52),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.65),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.77),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 0.40, callP: 0.60, alreadyP: 0.38),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.81),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.51),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.48),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.60, alreadyP: 0.60),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.64),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.61),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.82),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.41),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.74),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.71),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.85),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.88),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.70),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.62),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.53),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.70),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.HJ:
            return {
              'AA' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KK' :const ProgressInfo(allinP: 0.80, callP: 0.20),
              'QQ' :const ProgressInfo(allinP: 0.25, callP: 0.75, alreadyP: 0.17),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.60),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.64),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.73),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.74),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.82),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.87),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.25, callP: 0.75),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.82),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.86),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.60),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.63),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.77),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.64),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.78),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 0.80, callP: 0.20, alreadyP: 0.16),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.72),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.65),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.71),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.73),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.89),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.71),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.44),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.58),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.64),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.85),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.64),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.CO:
            return {
              'AA' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KK' :const ProgressInfo(allinP: 0.60, callP: 0.40),
              'QQ' :const ProgressInfo(allinP: 0.60, callP: 0.40, alreadyP: 0.10),
              'JJ' :const ProgressInfo(allinP: 0.50, callP: 0.50, alreadyP: 0.32),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.52),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.74),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.78),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.90),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.71),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.81),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.63),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),
              'A5s':const ProgressInfo(allinP: 0.45, callP: 0.55, alreadyP: 0.45),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.51),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.61),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.82),

              'AKo':const ProgressInfo(allinP: 1.0 , callP: 0.00),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.62),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.46),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.63),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.63),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.30, alreadyP: 0.56),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.50, alreadyP: 0.62),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.63),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.74),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.61),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.64),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.85),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.64),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.40),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.62),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.54),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.58),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.74),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.84),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.63),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.48),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.52),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      } else if (tournaSelection.myTournaPosition == TournaPosition.SB) {
        switch (tournaSelection.opponentTournaPosition) {
          case TournaPosition.UTG:
            return {
              'AA' :const ProgressInfo(allinP: 0.2, callP: 0.20, raiseP: 0.6),
              'KK' :const ProgressInfo(allinP: 0.4, callP: 0.45, raiseP: 0.15),
              'QQ' :const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.18),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.44),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.87),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.89),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.8, callP: 0.00, raiseP: 0.2),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.25, callP: 0.75),
              'ATs':const ProgressInfo(raiseP: 0.15, callP: 0.65, alreadyP: 0.20),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.40, callP: 0.45, alreadyP: 0.63),
              'A4s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 0.20, callP: 0.80, alreadyP: 0.35),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.12),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.25, alreadyP: 0.20),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.66),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.81),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.78),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.65),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.84),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.UTG1:
            return {
              'AA' :const ProgressInfo(allinP: 0.1, callP: 0.30, raiseP: 0.6),
              'KK' :const ProgressInfo(allinP: 0.55, callP: 0.30, raiseP: 0.15),
              'QQ' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'JJ' :const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.41),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.75),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.89),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.85, callP: 0.00, raiseP: 0.15),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.09),
              'AJs':const ProgressInfo(raiseP: 0.30, callP: 0.70, alreadyP: 0.10),
              'ATs':const ProgressInfo(raiseP: 0.11, callP: 0.80, alreadyP: 0.00),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.20, callP: 0.70, alreadyP: 0.46),
              'A4s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 0.25, callP: 0.75, alreadyP: 0.32),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.30, alreadyP: 0.06),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 0.80),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AQo':const ProgressInfo(raiseP: 0.00, callP: 0.20, alreadyP: 0.65),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.63),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.62),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.72),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.69),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.72),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.70),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.86),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.LJ:
            return {
              'AA' :const ProgressInfo(allinP: 0.05, callP: 0.15, raiseP: 0.8),
              'KK' :const ProgressInfo(allinP: 0.75, callP: 0.25),
              'QQ' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'JJ' :const ProgressInfo(raiseP: 0.22, callP: 0.78, alreadyP: 0.30),
              'TT' :const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.41),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.84),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.7, callP: 0.00, raiseP: 0.3),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.20, callP: 0.80, alreadyP: 0.19),
              'ATs':const ProgressInfo(raiseP: 0.30, callP: 0.70, alreadyP: 0.00),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.20, callP: 0.80, alreadyP: 0.49),
              'A4s':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.90),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKo':const ProgressInfo(allinP: 0.35, callP: 0.65, alreadyP: 0.15),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.50, alreadyP: 0.14),
              'KJs':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.00),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.60),


              'AQo':const ProgressInfo(raiseP: 0.00, callP: 0.50, alreadyP: 0.53),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.38),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.55, alreadyP: 0.65),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.76),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.57),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.78),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.66),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.78),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.HJ:
            return {
              'AA' :const ProgressInfo(raiseP: 0.65, callP: 0.35),
              'KK' :const ProgressInfo(allinP: 1.00, callP: 0.00),
              'QQ' :const ProgressInfo(allinP: 0.15, callP: 0.70, raiseP: 0.15),
              'JJ' :const ProgressInfo(allinP: 0.60, callP: 0.40, alreadyP: 0.20),
              'TT' :const ProgressInfo(raiseP: 0.20, callP: 0.80, alreadyP: 0.35),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.75),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.91),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.7, callP: 0.00, raiseP: 0.3),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.16),
              'ATs':const ProgressInfo(allinP: 0.3, callP: 0.45, alreadyP: 0.0, raiseP :0.25),
              'A9s':const ProgressInfo(raiseP: 0.00, callP: 0.40, alreadyP: 0.67),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 0.40, alreadyP: 0.56),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.10, callP: 0.90, alreadyP: 0.43),
              'A4s':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.74),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 0.85, callP: 0.15, alreadyP: 0.11),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.14),
              'KJs':const ProgressInfo(raiseP: 0.15, callP: 0.33, alreadyP: 0.00),
              'KTs':const ProgressInfo(raiseP: 0.10, callP: 0.65, alreadyP: 0.17),


              'AQo':const ProgressInfo(raiseP: 0.10, callP: 0.20, alreadyP: 0.39),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.30),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.39),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.30, alreadyP: 0.77),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.68),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.54),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.81),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.CO:
            return {
              'AA' :const ProgressInfo(raiseP: 0.65, callP: 0.35),
              'KK' :const ProgressInfo(allinP: 1.00, callP: 0.00),
              'QQ' :const ProgressInfo(allinP: 0.35, callP: 0.50, raiseP :0.15),
              'JJ' :const ProgressInfo(allinP: 0.45, callP: 0.55, alreadyP: 0.09),
              'TT' :const ProgressInfo(allinP: 0.50, callP: 0.50, alreadyP: 0.35),
              '99' :const ProgressInfo(raiseP: 0.10, callP: 0.90, alreadyP: 0.41),
              '88' :const ProgressInfo(raiseP: 0.16, callP: 0.84, alreadyP: 0.45),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.70),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.85),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.7, callP: 0.00, raiseP: 0.3),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.00),
              'ATs':const ProgressInfo(allinP: 0.25, callP: 0.75, alreadyP: 0.00),
              'A9s':const ProgressInfo(raiseP: 0.00, callP: 0.20, alreadyP: 0.29),
              'A8s':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.46),
              'A7s':const ProgressInfo(allinP: 0.05, callP: 0.40, alreadyP: 0.67, raiseP: 0.2),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(allinP: 0.30, callP: 0.70, alreadyP: 0.32),
              'A4s':const ProgressInfo(allinP: 0.40, callP: 0.60, alreadyP: 0.61),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 1.00, callP: 0.00, alreadyP: 0.08),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.11),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KTs':const ProgressInfo(raiseP: 0.15, callP: 0.40),
              'K9s':const ProgressInfo(raiseP: 0.25, callP: 0.00, alreadyP: 0.68),


              'AQo':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.47),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.30, alreadyP: 0.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.56, alreadyP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.73, alreadyP: 0.00),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.22),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.30, alreadyP: 0.48),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.54),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.48),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.47),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.51),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.74),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.BTN:
            return {
              'AA' :const ProgressInfo(raiseP: 0.30, callP: 0.70),
              'KK' :const ProgressInfo(allinP: 1.00, callP: 0.00),
              'QQ' :const ProgressInfo(allinP: 0.6, callP: 0.30, raiseP: 0.1),
              'JJ' :const ProgressInfo(allinP: 0.60, callP: 0.40),
              'TT' :const ProgressInfo(allinP: 0.30, callP: 0.70, alreadyP: 0.20),
              '99' :const ProgressInfo(allinP: 0.35, callP: 0.65, alreadyP: 0.53),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.42),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.35),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.70),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.8, callP: 0.00, raiseP: 0.2),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.30),
              'A9s':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.12),
              'A8s':const ProgressInfo(allinP: 0.25, callP: 0.75, alreadyP: 0.00),
              'A7s':const ProgressInfo(allinP: 0.6, callP: 0.30, alreadyP: 0.30, raiseP: 0.1),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.70),
              'A5s':const ProgressInfo(allinP: 0.70, callP: 0.30, alreadyP: 0.00),
              'A4s':const ProgressInfo(allinP: 0.50, callP: 0.50, alreadyP: 0.08),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.89),

              'AKo':const ProgressInfo(allinP: 1.00, callP: 0.00),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.19),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.18),
              'KTs':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.06),
              'K9s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'K8s':const ProgressInfo(raiseP: 0.00, callP: 0.50, alreadyP: 0.78),
              'K7s':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.66),
              'K6s':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.23),
              'K5s':const ProgressInfo(raiseP: 0.00, callP: 0.35, alreadyP: 0.55),


              'AQo':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.58),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.50, alreadyP: 0.08),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.11),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.08),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.26),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.07),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.40, alreadyP: 0.00),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.70, alreadyP: 0.39),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.30),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.35, alreadyP: 0.56),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.17),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.61),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.28),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.32),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.54),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      } else if (tournaSelection.myTournaPosition == TournaPosition.BB) {
        switch (tournaSelection.opponentTournaPosition) {
          case TournaPosition.UTG:
            return {
              'AA' :const ProgressInfo(allinP: 0.17, callP: 0.18, raiseP: 0.65),
              'KK' :const ProgressInfo(allinP: 0.45, callP: 0.35, raiseP: 0.2),
              'QQ' :const ProgressInfo(raiseP: 0.10, callP: 0.90, alreadyP: 0.28),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.78),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.95),



              'AKs':const ProgressInfo(allinP: 1.00, callP: 0.00),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.81),
              'AJs':const ProgressInfo(raiseP: 0.40, callP: 0.60, alreadyP: 0.80),
              'ATs':const ProgressInfo(raiseP: 0.32, callP: 0.68, alreadyP: 0.59),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.20, callP: 0.71, alreadyP: 0.79),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.40, callP: 0.35, alreadyP: 0.55),
              'A4s':const ProgressInfo(raiseP: 0.16, callP: 0.10, alreadyP: 0.50),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 0.1, callP: 0.75, alreadyP: 0.54, raiseP: 0.15),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.30, alreadyP: 0.49),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.80),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.50, alreadyP: 0.71),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.80, alreadyP: 0.46),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.75, alreadyP: 0.59),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.90, alreadyP: 0.55),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.40, alreadyP: 0.62),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.UTG1:
            return {
              'AA' :const ProgressInfo(allinP: 0.2, callP: 0.15, raiseP: 0.65),
              'KK' :const ProgressInfo(allinP: 0.45, callP: 0.40, raiseP: 0.15),
              'QQ' :const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.13),
              'JJ' :const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.73),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.91),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.8, callP: 0.00, raiseP: 0.2),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.66),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.68),
              'A9s':const ProgressInfo(raiseP: 0.40, callP: 0.60, alreadyP: 0.87),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 0.80, alreadyP: 0.65),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.40, callP: 0.60, alreadyP: 0.57),
              'A4s':const ProgressInfo(raiseP: 0.20, callP: 0.00, alreadyP: 0.69),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 0.30, callP: 0.70, alreadyP: 0.46),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.68),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.25, alreadyP: 0.44),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.72),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.60),


              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.60, alreadyP: 0.74),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.62),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.80, alreadyP: 0.65),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.90, alreadyP: 0.52),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.30, alreadyP: 0.62),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.LJ:
            return {
              'AA' :const ProgressInfo(allinP: 0.1, callP: 0.25, raiseP: 0.65),
              'KK' :const ProgressInfo(allinP: 0.6, callP: 0.3,raiseP: 0.1),
              'QQ' :const ProgressInfo(raiseP: 0.0, callP: 1.00),
              'JJ' :const ProgressInfo(raiseP: 0.25, callP: 0.75, alreadyP: 0.52),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.88),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.94),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.75, callP: 0.00, raiseP: 0.25),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'A9s':const ProgressInfo(raiseP: 0.10, callP: 0.90, alreadyP: 0.61),
              'A8s':const ProgressInfo(raiseP: 0.25, callP: 0.75, alreadyP: 0.74),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.35, callP: 0.65, alreadyP: 0.64),
              'A4s':const ProgressInfo(raiseP: 0.40, callP: 0.60, alreadyP: 0.83),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 0.30, callP: 0.70, alreadyP: 0.26),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.87),
              'KJs':const ProgressInfo(raiseP: 0.15, callP: 0.85, alreadyP: 0.57),



              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.84),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.40, callP: 0.0 , alreadyP: 0.89),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.54),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.40, alreadyP: 0.53),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.42),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.45, alreadyP: 0.66),



              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.20, alreadyP: 0.70),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.50),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.25, alreadyP: 0.55),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.HJ:
            return {
              'AA' :const ProgressInfo(raiseP: 0.80, callP: 0.20),
              'KK' :const ProgressInfo(allinP: 0.8, callP: 0.1, raiseP: 0.1),
              'QQ' :const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'JJ' :const ProgressInfo(allinP: 0.5, callP: 0.40, alreadyP: 0.14,raiseP: 0.1),
              'TT' :const ProgressInfo(raiseP: 0.35, callP: 0.65, alreadyP: 0.63),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.35, callP: 0.15, raiseP: 0.5),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'A9s':const ProgressInfo(raiseP: 1.00, callP: 0.00, alreadyP: 0.88),
              'A8s':const ProgressInfo(raiseP: 0.40, callP: 0.60, alreadyP: 0.46),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.84),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.20, callP: 0.80, alreadyP: 0.76),
              'A4s':const ProgressInfo(raiseP: 0.20, callP: 0.80, alreadyP: 0.73),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 0.71, callP: 0.29),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.67),
              'KTs':const ProgressInfo(raiseP: 1.00, callP: 0.00, alreadyP: 0.79),


              'AQo':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.85, alreadyP: 0.19),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.80, alreadyP: 0.23),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),



              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.71),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.47),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.50, alreadyP: 0.45),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.75, alreadyP: 0.39),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.40, alreadyP: 0.54),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.CO:
            return {
              'AA' :const ProgressInfo(raiseP: 0.7, callP: 0.3),
              'KK' :const ProgressInfo(allinP: 1.00, callP: 0.00),
              'QQ' :const ProgressInfo(allinP: 0.3, callP: 0.55, raiseP: 0.15),
              'JJ' :const ProgressInfo(allinP: 0.4, callP: 0.5, raiseP: 0.1),
              'TT' :const ProgressInfo(allinP: 0.3, callP: 0.50, alreadyP: 0.30, raiseP: 0.2),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.79),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.91),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.35, callP: 0.25, raiseP: 0.4),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'A9s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'A8s':const ProgressInfo(raiseP: 0.30, callP: 0.70, alreadyP: 0.74),
              'A7s':const ProgressInfo(allinP: 1.00, callP: 0.00, alreadyP: 0.83),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(allinP: 0.65, callP: 0.35, alreadyP: 0.60),
              'A4s':const ProgressInfo(allinP: 0.70, callP: 0.30, alreadyP: 0.67),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.78),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 0.89, callP: 0.11),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.44),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.91),
              'KTs':const ProgressInfo(raiseP: 0.75, callP: 0.25, alreadyP: 0.87),
              'K9s':const ProgressInfo(raiseP: 1.00, callP: 0.00, alreadyP: 0.84),


              'AQo':const ProgressInfo(raiseP: 0.20, callP: 0.80, alreadyP: 0.50),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.08),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.90, alreadyP: 0.00),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.50, alreadyP: 0.33),



              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.45),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.39),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.35),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.37),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.55),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.BTN:
            return {
              'AA' :const ProgressInfo(raiseP: 0.50, callP: 0.50),
              'KK' :const ProgressInfo(allinP: 0.85, callP: 0.00, raiseP: 0.15),
              'QQ' :const ProgressInfo(allinP: 0.5, callP: 0.40, raiseP: 0.1),
              'JJ' :const ProgressInfo(allinP: 0.3, callP: 0.6, raiseP: 0.1),
              'TT' :const ProgressInfo(allinP: 0.25, callP: 0.75),
              '99' :const ProgressInfo(allinP: 0.40, callP: 0.60, alreadyP: 0.38),
              '88' :const ProgressInfo(allinP: 0.1, callP: 0.60, alreadyP: 0.66, raiseP: 0.3),
              '77' :const ProgressInfo(allinP: 0.1, callP: 0.80, alreadyP: 0.85, raiseP: 0.1),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.7, callP: 0.00, raiseP: 0.3),
              'AQs':const ProgressInfo(raiseP: 0.1, callP: 0.9),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.35),
              'A9s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(allinP: 1.00, callP: 0.00),
              'A4s':const ProgressInfo(allinP: 0.70, callP: 0.30, alreadyP: 0.64),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.67),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 1.00, callP: 0.00),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KTs':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.65),
              'K9s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'K6s':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.76),


              'AQo':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.65, alreadyP: 0.55),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.73),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.62),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.56),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.82),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.35),



              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.70, alreadyP: 0.28),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.60, alreadyP: 0.18),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.00),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.17),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.29),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.90),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          case TournaPosition.SB:
            return {
              'AA' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'KK' :const ProgressInfo(allinP: 0.50, callP: 0.50),
              'QQ' :const ProgressInfo(allinP: 0.80, callP: 0.20),
              'JJ' :const ProgressInfo(allinP: 0.35, callP: 0.65),
              'TT' :const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.66),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '88' :const ProgressInfo(raiseP: 0.00, callP: 0.00),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(allinP: 0.66, callP: 0.34),
              'AQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
              'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.30),
              'ATs':const ProgressInfo(allinP: 0.35, callP: 0.65, alreadyP: 0.67),
              'A9s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'A8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(allinP: 0.90, callP: 0.10, alreadyP: 0.33),
              'A4s':const ProgressInfo(allinP: 0.50, callP: 0.50, alreadyP: 0.60),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(allinP: 1.00, callP: 0.00),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.61),
              'KJs':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.60),
              'KTs':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.53),
              'K9s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
              'K6s':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.72),


              'AQo':const ProgressInfo(raiseP: 0.00, callP: 1.00, alreadyP: 0.61),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.82),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.00, alreadyP: 0.00),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.84),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.90),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.81),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.89),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.50),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.85),



              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.30),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.72),


              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.40),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.51),


              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.58),


              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 1.00, alreadyP: 0.59),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            };
          default : {
            return {
              'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


              'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

              'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
              '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            };
          }
        }
      }
    }
  }
  //스택,내 포지션,상대 포지션 선택됨
  else if (tournaSelection.myTournaPosition != TournaPosition.none &&
      tournaSelection.opponentTournaPosition != TournaPosition.none) {

    if (tournaSelection.myTournaPosition == TournaPosition.UTG1) {

      switch (tournaSelection.opponentTournaPosition) {
        case TournaPosition.UTG:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),
            'AJs':const ProgressInfo(raiseP: 0.53, callP: 0.47),
            'ATs':const ProgressInfo(raiseP: 0.63, callP: 0.37),
            'A9s':const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
            'A8s':const ProgressInfo(raiseP: 0.24, callP: 0.32),
            'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A5s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'A4s':const ProgressInfo(raiseP: 0.26, callP: 0.38),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AKo':const ProgressInfo(raiseP: 0.48, callP: 0.52),
            'KK' :const ProgressInfo(raiseP: 0.75, callP: 0.25),
            'KQs':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'KJs':const ProgressInfo(raiseP: 0.66, callP: 0.34),
            'KTs':const ProgressInfo(raiseP: 0.67, callP: 0.33),
            'K9s':const ProgressInfo(raiseP: 0.14, callP: 0.0 ),


            'AQo':const ProgressInfo(raiseP: 0.56, callP: 0.41),
            'KQo':const ProgressInfo(raiseP: 0.27, callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.52, callP: 0.48),
            'QJs':const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
            'QTs':const ProgressInfo(raiseP: 0.34, callP: 0.66),


            'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JJ' :const ProgressInfo(raiseP: 0.52, callP: 0.48),
            'JTs':const ProgressInfo(raiseP: 0.24, callP: 0.76),


            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'TT' :const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
            'T9s':const ProgressInfo(raiseP: 0.1 , callP: 0.42),
            'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '99' :const ProgressInfo(raiseP: 0.35, callP: 0.65),
            '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.18),
            '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '88' :const ProgressInfo(raiseP: 0.33, callP: 0.67),
            '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.09),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '77' :const ProgressInfo(raiseP: 0.31, callP: 0.69),
            '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.13),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '66' :const ProgressInfo(raiseP: 0.25, callP: 0.64),
            '65s':const ProgressInfo(raiseP: 0.2 , callP: 0.23),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '55' :const ProgressInfo(raiseP: 0.00, callP: 0.40),
            '54s':const ProgressInfo(raiseP: 0.11, callP: 0.23),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.3 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.39),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.43),
          };
        default : {
          return {
            'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          };
        }
      }

    } else if (tournaSelection.myTournaPosition == TournaPosition.LJ) {
      switch (tournaSelection.opponentTournaPosition) {
        case TournaPosition.UTG:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'AJs':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'ATs':const ProgressInfo(raiseP: 0.67, callP: 0.33),
            'A9s':const ProgressInfo(raiseP: 0.5 , callP: 0.4 ),
            'A8s':const ProgressInfo(raiseP: 0.36, callP: 0.54),
            'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.24),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A5s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'A4s':const ProgressInfo(raiseP: 0.29, callP: 0.47),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AKo':const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
            'KK' :const ProgressInfo(raiseP: 0.86, callP: 0.14),
            'KQs':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'KJs':const ProgressInfo(raiseP: 0.55, callP: 0.45),
            'KTs':const ProgressInfo(raiseP: 0.56, callP: 0.44),
            'K9s':const ProgressInfo(raiseP: 0.36, callP: 0.00),
            'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AQo':const ProgressInfo(raiseP: 0.51, callP: 0.46),
            'KQo':const ProgressInfo(raiseP: 0.36, callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
            'QJs':const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
            'QTs':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AJo':const ProgressInfo(raiseP: 0.15, callP: 0.0 ),

            'JJ' :const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
            'JTs':const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),
            'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.25),


            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'TT' :const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
            'T9s':const ProgressInfo(raiseP: 0.24, callP: 0.76),


            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '99' :const ProgressInfo(raiseP: 0.35, callP: 0.65),
            '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.26),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '88' :const ProgressInfo(raiseP: 0.31, callP: 0.69),
            '87s':const ProgressInfo(raiseP: 0.10, callP: 0.15),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '77' :const ProgressInfo(raiseP: 0.28, callP: 0.72),
            '76s':const ProgressInfo(raiseP: 0.10, callP: 0.20),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '66' :const ProgressInfo(raiseP: 0.25, callP: 0.75),
            '65s':const ProgressInfo(raiseP: 0.20, callP: 0.26),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '55' :const ProgressInfo(raiseP: 0.1 , callP: 0.6 ),
            '54s':const ProgressInfo(raiseP: 0.10, callP: 0.25),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.49),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.48),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.59),
          };
        case TournaPosition.UTG1:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.51, callP: 0.49),
            'JJ' :const ProgressInfo(raiseP: 0.53, callP: 0.47),
            'TT' :const ProgressInfo(raiseP: 0.51, callP: 0.49),
            '99' :const ProgressInfo(raiseP: 0.39, callP: 0.61),
            '88' :const ProgressInfo(raiseP: 0.36, callP: 0.64),
            '77' :const ProgressInfo(raiseP: 0.34, callP: 0.66),
            '66' :const ProgressInfo(raiseP: 0.27, callP: 0.73),
            '55' :const ProgressInfo(raiseP: 0.16, callP: 0.58),
            '44' :const ProgressInfo(raiseP: 0.00, callP: 0.51),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.46),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.54),


            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'AJs':const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'ATs':const ProgressInfo(raiseP: 0.67, callP: 0.33),
            'A9s':const ProgressInfo(raiseP: 0.63, callP: 0.37),
            'A8s':const ProgressInfo(raiseP: 0.46, callP: 0.54),
            'A7s':const ProgressInfo(raiseP: 0.00, callP: 0.30),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A5s':const ProgressInfo(raiseP: 0.52, callP: 0.48),
            'A4s':const ProgressInfo(raiseP: 0.31, callP: 0.54),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.18),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AKo':const ProgressInfo(raiseP: 0.55, callP: 0.45),
            'KQs':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'KJs':const ProgressInfo(raiseP: 0.56, callP: 0.44),
            'KTs':const ProgressInfo(raiseP: 0.6 , callP: 0.4 ),
            'K9s':const ProgressInfo(raiseP: 0.58, callP: 0.15),

            'AQo':const ProgressInfo(raiseP: 0.59, callP: 0.41),
            'KQo':const ProgressInfo(raiseP: 0.42, callP: 0.09),
            'QJs':const ProgressInfo(raiseP: 0.61, callP: 0.39),
            'QTs':const ProgressInfo(raiseP: 0.4 , callP: 0.6 ),


            'AJo':const ProgressInfo(raiseP: 0.23, callP: 0.12),
            'JTs':const ProgressInfo(raiseP: 0.46, callP: 0.54),
            'J9s':const ProgressInfo(raiseP: 0.00, callP: 0.28),


            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9s':const ProgressInfo(raiseP: 0.26, callP: 0.74),


            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.29),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.08, callP: 0.14),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.00, callP: 0.17),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.21, callP: 0.23),


            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.00, callP: 0.27),


            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        default : {
          return {
            'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          };
        }
      }
    } else if (tournaSelection.myTournaPosition == TournaPosition.HJ) {
      switch (tournaSelection.opponentTournaPosition) {

        case TournaPosition.UTG:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 1.0 ),
            'KK' :const ProgressInfo(raiseP: 0.85, callP: 0.15),
            'QQ' :const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'JJ' :const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'TT' :const ProgressInfo(raiseP: 0.45, callP: 0.55),
            '99' :const ProgressInfo(raiseP: 0.33, callP: 0.67),
            '88' :const ProgressInfo(raiseP: 0.26, callP: 0.74),
            '77' :const ProgressInfo(raiseP: 0.23, callP: 0.77),
            '66' :const ProgressInfo(raiseP: 0.19, callP: 0.81),
            '55' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '44' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'AJs':const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'ATs':const ProgressInfo(raiseP: 0.67, callP: 0.33),
            'A9s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'A8s':const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'A7s':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.2 ),
            'A5s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'A4s':const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.4 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AKo':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'KQs':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            'KJs':const ProgressInfo(raiseP: 0.4 , callP: 0.6 ),
            'KTs':const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
            'K9s':const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),

            'AQo':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'KQo':const ProgressInfo(raiseP: 0.44, callP: 0.27),
            'QJs':const ProgressInfo(raiseP: 0.4 , callP: 0.6 ),
            'QTs':const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),


            'AJo':const ProgressInfo(raiseP: 0.26, callP: 0.24),
            'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTs':const ProgressInfo(raiseP: 0.27, callP: 0.73),
            'J9s':const ProgressInfo(raiseP: 0.25, callP: 0.75),


            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9s':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.69),


            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.54),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.13, callP: 0.3),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.12, callP: 0.32),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.27, callP: 0.56),


            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.09, callP: 0.47),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.UTG1:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 1.0 ),
            'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'QQ' :const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'JJ' :const ProgressInfo(raiseP: 0.48, callP: 0.52),
            'TT' :const ProgressInfo(raiseP: 0.46, callP: 0.54),
            '99' :const ProgressInfo(raiseP: 0.39, callP: 0.61),
            '88' :const ProgressInfo(raiseP: 0.31, callP: 0.69),
            '77' :const ProgressInfo(raiseP: 0.28, callP: 0.72),
            '66' :const ProgressInfo(raiseP: 0.22, callP: 0.78),
            '55' :const ProgressInfo(raiseP: 0.16, callP: 0.84),
            '44' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.83),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.5 , callP: 0.5),
            'AJs':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'ATs':const ProgressInfo(raiseP: 0.68, callP: 0.32),
            'A9s':const ProgressInfo(raiseP: 0.52, callP: 0.48),
            'A8s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'A7s':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.36),
            'A5s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'A4s':const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.48),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AKo':const ProgressInfo(raiseP: 0.46, callP: 0.54),
            'KQs':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'KJs':const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'KTs':const ProgressInfo(raiseP: 0.49, callP: 0.51),
            'K9s':const ProgressInfo(raiseP: 0.57, callP: 0.43),

            'AQo':const ProgressInfo(raiseP: 0.47, callP: 0.53),
            'KQo':const ProgressInfo(raiseP: 0.5 , callP: 0.38),
            'QJs':const ProgressInfo(raiseP: 0.48, callP: 0.52),
            'QTs':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.12),


            'AJo':const ProgressInfo(raiseP: 0.27, callP: 0.43),
            'KJo':const ProgressInfo(raiseP: 0.00, callP: 0.0 ),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTs':const ProgressInfo(raiseP: 0.43, callP: 0.57),
            'J9s':const ProgressInfo(raiseP: 0.39, callP: 0.61),


            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'T8s':const ProgressInfo(raiseP: 0.00, callP: 0.53),


            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.06, callP: 0.68),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.16, callP: 0.34),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.08, callP: 0.28),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.26, callP: 0.41),


            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.05, callP: 0.39),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.LJ:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 1.0 ),
            'KK' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.55, callP: 0.45),
            'JJ' :const ProgressInfo(raiseP: 0.48, callP: 0.52),
            'TT' :const ProgressInfo(raiseP: 0.44, callP: 0.56),
            '99' :const ProgressInfo(raiseP: 0.33, callP: 0.67),
            '88' :const ProgressInfo(raiseP: 0.31, callP: 0.69),
            '77' :const ProgressInfo(raiseP: 0.27, callP: 0.73),
            '66' :const ProgressInfo(raiseP: 0.25, callP: 0.75),
            '55' :const ProgressInfo(raiseP: 0.23, callP: 0.77),
            '44' :const ProgressInfo(raiseP: 0.21, callP: 0.79),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.69),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.72),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.63, callP: 0.37),
            'AJs':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'ATs':const ProgressInfo(raiseP: 0.49, callP: 0.51),
            'A9s':const ProgressInfo(raiseP: 0.53, callP: 0.47),
            'A8s':const ProgressInfo(raiseP: 0.43, callP: 0.57),
            'A7s':const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
            'A6s':const ProgressInfo(raiseP: 0.11, callP: 0.34),
            'A5s':const ProgressInfo(raiseP: 0.54, callP: 0.46),
            'A4s':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'A3s':const ProgressInfo(raiseP: 0.33, callP: 0.53),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AKo':const ProgressInfo(raiseP: 0.58, callP: 0.42),
            'KQs':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'KJs':const ProgressInfo(raiseP: 0.52, callP: 0.48),
            'KTs':const ProgressInfo(raiseP: 0.51, callP: 0.49),
            'K9s':const ProgressInfo(raiseP: 0.68, callP: 0.32),
            'K8s':const ProgressInfo(raiseP: 0.00, callP: 0.00),
            'K6s':const ProgressInfo(raiseP: 0.00, callP: 0.00),

            'AQo':const ProgressInfo(raiseP: 0.52, callP: 0.48),
            'KQo':const ProgressInfo(raiseP: 0.64, callP: 0.36),
            'QJs':const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'QTs':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'Q9s':const ProgressInfo(raiseP: 0.26, callP: 0.18),


            'AJo':const ProgressInfo(raiseP: 0.53, callP: 0.47),
            'KJo':const ProgressInfo(raiseP: 0.00, callP: 0.00),
            'JTs':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'J9s':const ProgressInfo(raiseP: 0.47, callP: 0.53),


            'ATo':const ProgressInfo(raiseP: 0.16, callP: 0.0 ),
            'T9s':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'T8s':const ProgressInfo(raiseP: 0.12, callP: 0.26),


            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.12, callP: 0.58),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.12, callP: 0.3 ),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.09, callP: 0.2 ),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.29, callP: 0.24),


            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.09, callP: 0.3 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        default : {
          return {
            'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          };
        }
      }
    } else if (tournaSelection.myTournaPosition == TournaPosition.CO) {
      switch (tournaSelection.opponentTournaPosition) {

        case TournaPosition.UTG:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 0.87, callP: 0.13),
            'QQ' :const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'JJ' :const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'TT' :const ProgressInfo(raiseP: 0.44, callP: 0.56),
            '99' :const ProgressInfo(raiseP: 0.33, callP: 0.67),
            '88' :const ProgressInfo(raiseP: 0.24, callP: 0.76),
            '77' :const ProgressInfo(raiseP: 0.20, callP: 0.8 ),
            '66' :const ProgressInfo(raiseP: 0.16, callP: 0.84),
            '55' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.57, callP: 0.43),
            'AJs':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'ATs':const ProgressInfo(raiseP: 0.61, callP: 0.39),
            'A9s':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'A8s':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'A7s':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.84),
            'A5s':const ProgressInfo(raiseP: 0.43, callP: 0.57),
            'A4s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'A3s':const ProgressInfo(raiseP: 0.00, callP: 1.0),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.14),

            'AKo':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'KQs':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            'KJs':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'KTs':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'K9s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.36),
            'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
            'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.29),

            'AQo':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'KQo':const ProgressInfo(raiseP: 0.47, callP: 0.53),
            'QJs':const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),
            'QTs':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            'Q9s':const ProgressInfo(raiseP: 0.22, callP: 0.78),


            'AJo':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'KJo':const ProgressInfo(raiseP: 0.00, callP: 0.14),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTs':const ProgressInfo(raiseP: 0.4 , callP: 0.6 ),
            'J9s':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


            'ATo':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
            'T9s':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            'T8s':const ProgressInfo(raiseP: 0.17, callP: 0.83),


            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.07, callP: 0.93),
            '97s':const ProgressInfo(raiseP: 0.00, callP: 0.29),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.22, callP: 0.78),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.19),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.16, callP: 0.84),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.32, callP: 0.68),


            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.14, callP: 0.86),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.UTG1:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'QQ' :const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'JJ' :const ProgressInfo(raiseP: 0.47, callP: 0.53),
            'TT' :const ProgressInfo(raiseP: 0.46, callP: 0.54),
            '99' :const ProgressInfo(raiseP: 0.39, callP: 0.61),
            '88' :const ProgressInfo(raiseP: 0.29, callP: 0.71),
            '77' :const ProgressInfo(raiseP: 0.23, callP: 0.77),
            '66' :const ProgressInfo(raiseP: 0.16, callP: 0.84),
            '55' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.76, callP: 0.24),
            'AJs':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'ATs':const ProgressInfo(raiseP: 0.6 , callP: 0.4 ),
            'A9s':const ProgressInfo(raiseP: 0.49, callP: 0.51),
            'A8s':const ProgressInfo(raiseP: 0.34, callP: 0.66),

            'A7s':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'A6s':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            'A5s':const ProgressInfo(raiseP: 0.48, callP: 0.52),
            'A4s':const ProgressInfo(raiseP: 0.22, callP: 0.78),
            'A3s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.29),

            'AKo':const ProgressInfo(raiseP: 0.43, callP: 0.57),
            'KQs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'KJs':const ProgressInfo(raiseP: 0.49, callP: 0.51),
            'KTs':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'K9s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'K8s':const ProgressInfo(raiseP: 0.19, callP: 0.37),
            'K7s':const ProgressInfo(raiseP: 0.11, callP: 0.34),
            'K6s':const ProgressInfo(raiseP: 0.08, callP: 0.27),

            'AQo':const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),
            'KQo':const ProgressInfo(raiseP: 0.46, callP: 0.54),
            'QJs':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'QTs':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            'Q9s':const ProgressInfo(raiseP: 0.32, callP: 0.68),


            'AJo':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'KJo':const ProgressInfo(raiseP: 0.17, callP: 0.27),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTs':const ProgressInfo(raiseP: 0.47, callP: 0.53),
            'J9s':const ProgressInfo(raiseP: 0.31, callP: 0.69),



            'ATo':const ProgressInfo(raiseP: 0.16, callP: 0.13),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
            'T9s':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            'T8s':const ProgressInfo(raiseP: 0.14, callP: 0.86),


            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            '97s':const ProgressInfo(raiseP: 0.00, callP: 0.44),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.23),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.19, callP: 0.63),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.34, callP: 0.66),


            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.16, callP: 0.84),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.LJ:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.59, callP: 0.41),
            'JJ' :const ProgressInfo(raiseP: 0.48, callP: 0.52),
            'TT' :const ProgressInfo(raiseP: 0.4 , callP: 0.6 ),
            '99' :const ProgressInfo(raiseP: 0.32, callP: 0.68),
            '88' :const ProgressInfo(raiseP: 0.28, callP: 0.72),
            '77' :const ProgressInfo(raiseP: 0.24, callP: 0.76),
            '66' :const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            '55' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '44' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.68, callP: 0.32),
            'AJs':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'ATs':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'A9s':const ProgressInfo(raiseP: 0.49, callP: 0.51),
            'A8s':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'A7s':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'A6s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'A5s':const ProgressInfo(raiseP: 0.47, callP: 0.53),
            'A4s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'A3s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'A2s':const ProgressInfo(raiseP: 0.07, callP: 0.56),

            'AKo':const ProgressInfo(raiseP: 0.59, callP: 0.41),
            'KQs':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            'KJs':const ProgressInfo(raiseP: 0.56, callP: 0.44),
            'KTs':const ProgressInfo(raiseP: 0.49, callP: 0.51),
            'K9s':const ProgressInfo(raiseP: 0.58, callP: 0.42),
            'K8s':const ProgressInfo(raiseP: 0.26, callP: 0.37),
            'K7s':const ProgressInfo(raiseP: 0.13, callP: 0.2 ),
            'K6s':const ProgressInfo(raiseP: 0.22, callP: 0.39),

            'AQo':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'KQo':const ProgressInfo(raiseP: 0.47, callP: 0.53),
            'QJs':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            'QTs':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'Q9s':const ProgressInfo(raiseP: 0.55, callP: 0.45),


            'AJo':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'KJo':const ProgressInfo(raiseP: 0.27, callP: 0.42),
            'QJo':const ProgressInfo(raiseP: 0.16, callP: 0.07),
            'JTs':const ProgressInfo(raiseP: 0.4 , callP: 0.6 ),
            'J9s':const ProgressInfo(raiseP: 0.37, callP: 0.63),



            'ATo':const ProgressInfo(raiseP: 0.47, callP: 0.23),
            'T9s':const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),
            'T8s':const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),


            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            '97s':const ProgressInfo(raiseP: 0.00, callP: 0.31),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.2 , callP: 0.41),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.43, callP: 0.57),


            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.23, callP: 0.61),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.HJ:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.65, callP: 0.35),
            'JJ' :const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'TT' :const ProgressInfo(raiseP: 0.38, callP: 0.62),
            '99' :const ProgressInfo(raiseP: 0.25, callP: 0.75),
            '88' :const ProgressInfo(raiseP: 0.26, callP: 0.74),
            '77' :const ProgressInfo(raiseP: 0.18, callP: 0.82),
            '66' :const ProgressInfo(raiseP: 0.17, callP: 0.83),
            '55' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.90, callP: 0.10),
            'AJs':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            'ATs':const ProgressInfo(raiseP: 0.09, callP: 0.91),
            'A9s':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'A8s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'A7s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'A6s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'A5s':const ProgressInfo(raiseP: 0.46, callP: 0.54),
            'A4s':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'A3s':const ProgressInfo(raiseP: 0.29, callP: 0.71),
            'A2s':const ProgressInfo(raiseP: 0.25, callP: 0.75),

            'AKo':const ProgressInfo(raiseP: 0.74, callP: 0.26),
            'KQs':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'KJs':const ProgressInfo(raiseP: 0.39, callP: 0.61),
            'KTs':const ProgressInfo(raiseP: 0.30, callP: 0.70),
            'K9s':const ProgressInfo(raiseP: 0.54, callP: 0.46),
            'K8s':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'K7s':const ProgressInfo(raiseP: 0.52, callP: 0.39),
            'K6s':const ProgressInfo(raiseP: 0.29, callP: 0.56),
            'K5s':const ProgressInfo(raiseP: 0.00, callP: 0.00),

            'AQo':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            'KQo':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'QJs':const ProgressInfo(raiseP: 0.22, callP: 0.78),
            'QTs':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'Q9s':const ProgressInfo(raiseP: 0.65, callP: 0.35),
            'Q8s':const ProgressInfo(raiseP: 0.43, callP: 0.00),


            'AJo':const ProgressInfo(raiseP: 0.50, callP: 0.50),
            'KJo':const ProgressInfo(raiseP: 0.33, callP: 0.49),
            'QJo':const ProgressInfo(raiseP: 0.28, callP: 0.23),
            'JTs':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'J9s':const ProgressInfo(raiseP: 0.50, callP: 0.50),
            'J8s':const ProgressInfo(raiseP: 0.19, callP: 0.12),




            'ATo':const ProgressInfo(raiseP: 0.59, callP: 0.41),
            'T9s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'T8s':const ProgressInfo(raiseP: 0.45, callP: 0.55),


            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            '97s':const ProgressInfo(raiseP: 0.00, callP: 0.38),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.31, callP: 0.53),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.41, callP: 0.59),


            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.28, callP: 0.58),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        default : {
          return {
            'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          };
        }
      }
    } else if (tournaSelection.myTournaPosition == TournaPosition.BTN) {
      switch (tournaSelection.opponentTournaPosition) {

        case TournaPosition.UTG:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 0.93, callP: 0.07),
            'QQ' :const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'JJ' :const ProgressInfo(raiseP: 0.43, callP: 0.57),
            'TT' :const ProgressInfo(raiseP: 0.43, callP: 0.57),
            '99' :const ProgressInfo(raiseP: 0.32, callP: 0.68),
            '88' :const ProgressInfo(raiseP: 0.24, callP: 0.76),
            '77' :const ProgressInfo(raiseP: 0.15, callP: 0.85),
            '66' :const ProgressInfo(raiseP: 0.09, callP: 0.91),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.53, callP: 0.47),
            'AJs':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            'ATs':const ProgressInfo(raiseP: 0.71, callP: 0.29),
            'A9s':const ProgressInfo(raiseP: 0.09, callP: 0.91),
            'A8s':const ProgressInfo(raiseP: 0.17, callP: 0.83),
            'A7s':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A5s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'A4s':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKo':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'KJs':const ProgressInfo(raiseP: 0.47, callP: 0.53),
            'KTs':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'K9s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'K8s':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            'K7s':const ProgressInfo(raiseP: 0.10, callP: 0.9 ),
            'K6s':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.8 ),

            'AQo':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            'KQo':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            'QJs':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'QTs':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'Q9s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'Q8s':const ProgressInfo(raiseP: 0.2 , callP: 0.4 ),


            'AJo':const ProgressInfo(raiseP: 0.27, callP: 0.73),
            'KJo':const ProgressInfo(raiseP: 0.15, callP: 0.45),
            'QJo':const ProgressInfo(raiseP: 0.00, callP: 0.34),
            'JTs':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'J9s':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            'J8s':const ProgressInfo(raiseP: 0.09, callP: 0.91),


            'ATo':const ProgressInfo(raiseP: 0.33, callP: 0.57),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.19),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.33),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.55),
            'T9s':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            'T8s':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.74),


            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.08, callP: 0.92),
            '97s':const ProgressInfo(raiseP: 0.00, callP: 1.0 ),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.61),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.92),


            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.2 ),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.UTG1:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'QQ' :const ProgressInfo(raiseP: 0.37, callP: 0.63),
            'JJ' :const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'TT' :const ProgressInfo(raiseP: 0.46, callP: 0.54),
            '99' :const ProgressInfo(raiseP: 0.35, callP: 0.65),
            '88' :const ProgressInfo(raiseP: 0.28, callP: 0.72),
            '77' :const ProgressInfo(raiseP: 0.24, callP: 0.76),
            '66' :const ProgressInfo(raiseP: 0.10, callP: 0.90),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.67, callP: 0.33),
            'AJs':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'ATs':const ProgressInfo(raiseP: 0.56, callP: 0.44),
            'A9s':const ProgressInfo(raiseP: 0.43, callP: 0.57),
            'A8s':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            'A7s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A5s':const ProgressInfo(raiseP: 0.54, callP: 0.46),
            'A4s':const ProgressInfo(raiseP: 0.19, callP: 0.81),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKo':const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'KQs':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'KJs':const ProgressInfo(raiseP: 0.46, callP: 0.54),
            'KTs':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'K9s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'K8s':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            'K7s':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'K6s':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            'K5s':const ProgressInfo(raiseP: 0.07, callP: 0.93),
            'K4s':const ProgressInfo(raiseP: 0.00, callP: 0.17),

            'AQo':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'KQo':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'QJs':const ProgressInfo(raiseP: 0.27, callP: 0.73),
            'QTs':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'Q9s':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            'Q8s':const ProgressInfo(raiseP: 0.25, callP: 0.75),


            'AJo':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'KJo':const ProgressInfo(raiseP: 0.26, callP: 0.71),
            'QJo':const ProgressInfo(raiseP: 0.19, callP: 0.47),
            'JTs':const ProgressInfo(raiseP: 0.62, callP: 0.38),
            'J9s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'J8s':const ProgressInfo(raiseP: 0.09, callP: 0.91),


            'ATo':const ProgressInfo(raiseP: 0.40, callP: 0.60),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.21),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.36),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.57),
            'T9s':const ProgressInfo(raiseP: 0.22, callP: 0.78),
            'T8s':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.87),


            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            '97s':const ProgressInfo(raiseP: 0.00, callP: 1.0 ),
            '96s':const ProgressInfo(raiseP: 0.00, callP: 0.28),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.20, callP: 0.80),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.69),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.35, callP: 0.75),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.76),


            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.19, callP: 0.81),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.98),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.LJ:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'QQ' :const ProgressInfo(raiseP: 0.64, callP: 0.36),
            'JJ' :const ProgressInfo(raiseP: 0.47, callP: 0.53),
            'TT' :const ProgressInfo(raiseP: 0.41, callP: 0.59),
            '99' :const ProgressInfo(raiseP: 0.31, callP: 0.69),
            '88' :const ProgressInfo(raiseP: 0.24, callP: 0.76),
            '77' :const ProgressInfo(raiseP: 0.19, callP: 0.81),
            '66' :const ProgressInfo(raiseP: 0.13, callP: 0.87),
            '55' :const ProgressInfo(raiseP: 0.06, callP: 0.94),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.78, callP: 0.22),
            'AJs':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'ATs':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            'A9s':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'A8s':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            'A7s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'A6s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'A5s':const ProgressInfo(raiseP: 0.48, callP: 0.52),
            'A4s':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            'A3s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKo':const ProgressInfo(raiseP: 0.62, callP: 0.38),
            'KQs':const ProgressInfo(raiseP: 0.19, callP: 0.81),
            'KJs':const ProgressInfo(raiseP: 0.49, callP: 0.51),
            'KTs':const ProgressInfo(raiseP: 0.52, callP: 0.48),
            'K9s':const ProgressInfo(raiseP: 0.40, callP: 0.60),
            'K8s':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            'K7s':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'K6s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'K5s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'K4s':const ProgressInfo(raiseP: 0.00, callP: 0.10),

            'AQo':const ProgressInfo(raiseP: 0.39, callP: 0.61),
            'KQo':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            'QJs':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            'QTs':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'Q9s':const ProgressInfo(raiseP: 0.20, callP: 0.80),
            'Q8s':const ProgressInfo(raiseP: 0.50, callP: 0.50),


            'AJo':const ProgressInfo(raiseP: 0.22, callP: 0.78),
            'KJo':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            'QJo':const ProgressInfo(raiseP: 0.35, callP: 0.50),
            'JTs':const ProgressInfo(raiseP: 0.59, callP: 0.41),
            'J9s':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'J8s':const ProgressInfo(raiseP: 0.30, callP: 0.70),


            'ATo':const ProgressInfo(raiseP: 0.49, callP: 0.51),
            'KTo':const ProgressInfo(raiseP: 0.15, callP: 0.30),
            'QTo':const ProgressInfo(raiseP: 0.11, callP: 0.32),
            'JTo':const ProgressInfo(raiseP: 0.00, callP: 0.40),
            'T9s':const ProgressInfo(raiseP: 0.29, callP: 0.71),
            'T8s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.38),


            'A9o':const ProgressInfo(raiseP: 0.11, callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            '97s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '96s':const ProgressInfo(raiseP: 0.00, callP: 0.07),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.30, callP: 0.70),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.40),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.47, callP: 0.53),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.43),


            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.30, callP: 0.70),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.54),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.HJ:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'QQ' :const ProgressInfo(raiseP: 0.83, callP: 0.17),
            'JJ' :const ProgressInfo(raiseP: 0.40, callP: 0.60),
            'TT' :const ProgressInfo(raiseP: 0.36, callP: 0.64),
            '99' :const ProgressInfo(raiseP: 0.27, callP: 0.73),
            '88' :const ProgressInfo(raiseP: 0.26, callP: 0.74),
            '77' :const ProgressInfo(raiseP: 0.18, callP: 0.82),
            '66' :const ProgressInfo(raiseP: 0.13, callP: 0.87),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'AJs':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A9s':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            'A8s':const ProgressInfo(raiseP: 0.40, callP: 0.60),
            'A7s':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            'A6s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'A5s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'A4s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'A3s':const ProgressInfo(raiseP: 0.22, callP: 0.78),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKo':const ProgressInfo(raiseP: 0.84, callP: 0.16),
            'KQs':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'KJs':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            'KTs':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'K9s':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            'K8s':const ProgressInfo(raiseP: 0.27, callP: 0.73),
            'K7s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'K6s':const ProgressInfo(raiseP: 0.29, callP: 0.71),
            'K5s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'K4s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'K3s':const ProgressInfo(raiseP: 0.00, callP: 0.09),

            'AQo':const ProgressInfo(raiseP: 0.27, callP: 0.73),
            'KQo':const ProgressInfo(raiseP: 0.27, callP: 0.73),
            'QJs':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'QTs':const ProgressInfo(raiseP: 0.29, callP: 0.71),
            'Q9s':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'Q8s':const ProgressInfo(raiseP: 0.48, callP: 0.52),
            'Q7s':const ProgressInfo(raiseP: 0.00, callP: 0.29),
            'Q6s':const ProgressInfo(raiseP: 0.46, callP: 0.33),


            'AJo':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            'KJo':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'QJo':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'JTs':const ProgressInfo(raiseP: 0.56, callP: 0.44),
            'J9s':const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'J8s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'J7s':const ProgressInfo(raiseP: 0.09, callP: 0.00),


            'ATo':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'KTo':const ProgressInfo(raiseP: 0.27, callP: 0.49),
            'QTo':const ProgressInfo(raiseP: 0.17, callP: 0.43),
            'JTo':const ProgressInfo(raiseP: 0.18, callP: 0.49),
            'T9s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'T8s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'T7s':const ProgressInfo(raiseP: 0.26, callP: 0.49),


            'A9o':const ProgressInfo(raiseP: 0.47, callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            '97s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '96s':const ProgressInfo(raiseP: 0.00, callP: 0.39),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.57),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.44),


            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.60),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.CO:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'QQ' :const ProgressInfo(raiseP: 0.90, callP: 0.10),
            'JJ' :const ProgressInfo(raiseP: 0.68, callP: 0.32),
            'TT' :const ProgressInfo(raiseP: 0.48, callP: 0.52),
            '99' :const ProgressInfo(raiseP: 0.31, callP: 0.69),
            '88' :const ProgressInfo(raiseP: 0.26, callP: 0.74),
            '77' :const ProgressInfo(raiseP: 0.24, callP: 0.76),
            '66' :const ProgressInfo(raiseP: 0.22, callP: 0.78),
            '55' :const ProgressInfo(raiseP: 0.10, callP: 0.90),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.00, callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'AJs':const ProgressInfo(raiseP: 0.29, callP: 0.71),
            'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A9s':const ProgressInfo(raiseP: 0.06, callP: 0.94),
            'A8s':const ProgressInfo(raiseP: 0.19, callP: 0.81),
            'A7s':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            'A6s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'A5s':const ProgressInfo(raiseP: 0.55, callP: 0.45),
            'A4s':const ProgressInfo(raiseP: 0.49, callP: 0.51),
            'A3s':const ProgressInfo(raiseP: 0.39, callP: 0.61),
            'A2s':const ProgressInfo(raiseP: 0.18, callP: 0.82),

            'AKo':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'KQs':const ProgressInfo(raiseP: 0.38, callP: 0.67),
            'KJs':const ProgressInfo(raiseP: 0.54, callP: 0.46),
            'KTs':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            'K9s':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            'K8s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'K7s':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'K6s':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            'K5s':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'K4s':const ProgressInfo(raiseP: 0.27, callP: 0.73),
            'K3s':const ProgressInfo(raiseP: 0.17, callP: 0.83),

            'AQo':const ProgressInfo(raiseP: 0.39, callP: 0.61),
            'KQo':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'QJs':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'QTs':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            'Q9s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'Q8s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'Q7s':const ProgressInfo(raiseP: 0.42, callP: 0.52),
            'Q6s':const ProgressInfo(raiseP: 0.50, callP: 0.50),
            'Q5s':const ProgressInfo(raiseP: 0.08, callP: 0.38),


            'AJo':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'KJo':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'QJo':const ProgressInfo(raiseP: 0.43, callP: 0.57),
            'JTs':const ProgressInfo(raiseP: 0.60, callP: 0.40),
            'J9s':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'J8s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'J7s':const ProgressInfo(raiseP: 0.58, callP: 0.15),


            'ATo':const ProgressInfo(raiseP: 0.39, callP: 0.61),
            'KTo':const ProgressInfo(raiseP: 0.47, callP: 0.53),
            'QTo':const ProgressInfo(raiseP: 0.48, callP: 0.52),
            'JTo':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'T9s':const ProgressInfo(raiseP: 0.46, callP: 0.54),
            'T8s':const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'T7s':const ProgressInfo(raiseP: 0.26, callP: 0.74),


            'A9o':const ProgressInfo(raiseP: 0.61, callP: 0.39),
            '98s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            '97s':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            '96s':const ProgressInfo(raiseP: 0.00, callP: 0.28),


            'A8o':const ProgressInfo(raiseP: 0.38, callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            '86s':const ProgressInfo(raiseP: 0.09, callP: 0.91),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.51),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.52, callP: 0.48),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.54),


            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.48, callP: 0.52),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.38),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.00),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        default : {
          return {
            'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          };
        }
      }
    } else if (tournaSelection.myTournaPosition == TournaPosition.SB) {
      switch (tournaSelection.opponentTournaPosition) {

        case TournaPosition.UTG:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.82, callP: 0.18),
            'JJ' :const ProgressInfo(raiseP: 0.56, callP: 0.44),
            'TT' :const ProgressInfo(raiseP: 0.31, callP: 0.69),
            '99' :const ProgressInfo(raiseP: 0.13, callP: 0.87),
            '88' :const ProgressInfo(raiseP: 0.11, callP: 0.89),
            '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AJs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'ATs':const ProgressInfo(raiseP: 0.8 , callP: 0.2 ),
            'A9s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A8s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'A7s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'A6s':const ProgressInfo(raiseP: 0.17, callP: 0.83),
            'A5s':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            'A4s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKo':const ProgressInfo(raiseP: 0.65, callP: 0.35),
            'KQs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KJs':const ProgressInfo(raiseP: 0.8 , callP: 0.2 ),
            'KTs':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'K9s':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.89),
            'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.58),
            'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.55),
            'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.1 ),

            'AQo':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'KQo':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            'QJs':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            'QTs':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'Q9s':const ProgressInfo(raiseP: 0.08, callP: 0.92),



            'AJo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.33),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.06),
            'JTs':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'J9s':const ProgressInfo(raiseP: 0.19, callP: 0.81),
            'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.41),


            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.2 ),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.2 ),
            'T9s':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'T8s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.09),


            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.51),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.42),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.22, callP: 0.78),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.07 ),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.35, callP: 0.65),



            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.09),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),



            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.UTG1:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'JJ' :const ProgressInfo(raiseP: 0.59, callP: 0.41),
            'TT' :const ProgressInfo(raiseP: 0.44, callP: 0.56),
            '99' :const ProgressInfo(raiseP: 0.25, callP: 0.75),
            '88' :const ProgressInfo(raiseP: 0.11, callP: 0.89),
            '77' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.91, callP: 0.09),
            'AJs':const ProgressInfo(raiseP: 0.90, callP: 0.10),
            'ATs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'A9s':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'A8s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'A7s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'A6s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'A5s':const ProgressInfo(raiseP: 0.54, callP: 0.46),
            'A4s':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKo':const ProgressInfo(raiseP: 0.68, callP: 0.32),
            'KQs':const ProgressInfo(raiseP: 0.94, callP: 0.06),
            'KJs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'KTs':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            'K9s':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'K8s':const ProgressInfo(raiseP: 0.06, callP: 0.94),
            'K7s':const ProgressInfo(raiseP: 0.21, callP: 0.70),
            'K6s':const ProgressInfo(raiseP: 0.21, callP: 0.76),
            'K5s':const ProgressInfo(raiseP: 0.00, callP: 0.24),

            'AQo':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            'KQo':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            'QJs':const ProgressInfo(raiseP: 0.72, callP: 0.28),
            'QTs':const ProgressInfo(raiseP: 0.19, callP: 0.81),
            'Q9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q8s':const ProgressInfo(raiseP: 0.00, callP: 0.20),



            'AJo':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.56),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.28),
            'JTs':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            'J9s':const ProgressInfo(raiseP: 0.29, callP: 0.71),
            'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.41),


            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.56),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.07),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.17),
            'T9s':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'T8s':const ProgressInfo(raiseP: 0.17, callP: 0.83),



            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.68),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.44),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.28, callP: 0.72),



            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.30, callP: 0.70),



            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.06),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),



            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.LJ:
          return {
            'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'JJ' :const ProgressInfo(raiseP: 0.70, callP: 0.30),
            'TT' :const ProgressInfo(raiseP: 0.59, callP: 0.41),
            '99' :const ProgressInfo(raiseP: 0.33, callP: 0.67),
            '88' :const ProgressInfo(raiseP: 0.16, callP: 0.84),
            '77' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'AJs':const ProgressInfo(raiseP: 0.81, callP: 0.19),
            'ATs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'A9s':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            'A8s':const ProgressInfo(raiseP: 0.30, callP: 0.70),
            'A7s':const ProgressInfo(raiseP: 0.09, callP: 0.91),
            'A6s':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'A5s':const ProgressInfo(raiseP: 0.51, callP: 0.49),
            'A4s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKo':const ProgressInfo(raiseP: 0.85, callP: 0.15),
            'KQs':const ProgressInfo(raiseP: 0.86, callP: 0.14),
            'KJs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'KTs':const ProgressInfo(raiseP: 0.40, callP: 0.60),
            'K9s':const ProgressInfo(raiseP: 0.27, callP: 0.73),
            'K8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K7s':const ProgressInfo(raiseP: 0.27, callP: 0.73),
            'K6s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'K5s':const ProgressInfo(raiseP: 0.00, callP: 0.37),

            'AQo':const ProgressInfo(raiseP: 0.47, callP: 0.53),
            'KQo':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'QJs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'QTs':const ProgressInfo(raiseP: 0.50, callP: 0.50),
            'Q9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q8s':const ProgressInfo(raiseP: 0.00, callP: 0.48),



            'AJo':const ProgressInfo(raiseP: 0.08, callP: 0.92),
            'KJo':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.54),
            'JTs':const ProgressInfo(raiseP: 0.62, callP: 0.38),
            'J9s':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            'J8s':const ProgressInfo(raiseP: 0.15, callP: 0.85),


            'ATo':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'KTo':const ProgressInfo(raiseP: 0.00, callP: 0.10),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.20),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.23),
            'T9s':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'T8s':const ProgressInfo(raiseP: 0.15, callP: 0.85),



            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            '97s':const ProgressInfo(raiseP: 0.07, callP: 0.93),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.43, callP: 0.57),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.36),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.22, callP: 0.78),



            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.34, callP: 0.66),



            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.22, callP: 0.78),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),



            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.HJ:
          return {
            'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'JJ' :const ProgressInfo(raiseP: 0.80, callP: 0.20),
            'TT' :const ProgressInfo(raiseP: 0.65, callP: 0.35),
            '99' :const ProgressInfo(raiseP: 0.45, callP: 0.55),
            '88' :const ProgressInfo(raiseP: 0.25, callP: 0.75),
            '77' :const ProgressInfo(raiseP: 0.09, callP: 0.91),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'AJs':const ProgressInfo(raiseP: 0.84, callP: 0.16),
            'ATs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'A9s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'A8s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'A7s':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'A6s':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'A5s':const ProgressInfo(raiseP: 0.57, callP: 0.43),
            'A4s':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKo':const ProgressInfo(raiseP: 0.89, callP: 0.11),
            'KQs':const ProgressInfo(raiseP: 0.86, callP: 0.14),
            'KJs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'KTs':const ProgressInfo(raiseP: 0.83, callP: 0.17),
            'K9s':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            'K8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K7s':const ProgressInfo(raiseP: 0.20, callP: 0.80),
            'K6s':const ProgressInfo(raiseP: 0.40, callP: 0.60),
            'K5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K4s':const ProgressInfo(raiseP: 0.00, callP: 0.48),

            'AQo':const ProgressInfo(raiseP: 0.61, callP: 0.39),
            'KQo':const ProgressInfo(raiseP: 0.29, callP: 0.71),
            'QJs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'QTs':const ProgressInfo(raiseP: 0.81, callP: 0.19),
            'Q9s':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            'Q8s':const ProgressInfo(raiseP: 0.17, callP: 0.83),
            'Q6s':const ProgressInfo(raiseP: 0.00, callP: 0.33),
            'Q5s':const ProgressInfo(raiseP: 0.00, callP: 0.08),



            'AJo':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            'KJo':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'QJo':const ProgressInfo(raiseP: 0.00, callP: 0.87),
            'JTs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'J9s':const ProgressInfo(raiseP: 0.46, callP: 0.54),
            'J8s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'J7s':const ProgressInfo(raiseP: 0.00, callP: 0.27),


            'ATo':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'KTo':const ProgressInfo(raiseP: 0.00, callP: 0.39),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.39),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.39),
            'T9s':const ProgressInfo(raiseP: 0.61, callP: 0.39),
            'T8s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'T7s':const ProgressInfo(raiseP: 0.00, callP: 0.27),



            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            '97s':const ProgressInfo(raiseP: 0.15, callP: 0.85),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            '86s':const ProgressInfo(raiseP: 0.09, callP: 0.62),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.44, callP: 0.56),



            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.46, callP: 0.54),



            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.19, callP: 0.81),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),



            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.CO:
          return {
            'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'JJ' :const ProgressInfo(raiseP: 0.91, callP: 0.09),
            'TT' :const ProgressInfo(raiseP: 0.65, callP: 0.35),
            '99' :const ProgressInfo(raiseP: 0.59, callP: 0.41),
            '88' :const ProgressInfo(raiseP: 0.55, callP: 0.45),
            '77' :const ProgressInfo(raiseP: 0.30, callP: 0.70),
            '66' :const ProgressInfo(raiseP: 0.15, callP: 0.85),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'AJs':const ProgressInfo(raiseP: 0.91, callP: 0.09),
            'ATs':const ProgressInfo(raiseP: 0.90, callP: 0.10),
            'A9s':const ProgressInfo(raiseP: 0.71, callP: 0.29),
            'A8s':const ProgressInfo(raiseP: 0.54, callP: 0.46),
            'A7s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'A6s':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            'A5s':const ProgressInfo(raiseP: 0.68, callP: 0.32),
            'A4s':const ProgressInfo(raiseP: 0.39, callP: 0.61),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'AKo':const ProgressInfo(raiseP: 0.92, callP: 0.08),
            'KQs':const ProgressInfo(raiseP: 0.89, callP: 0.11),
            'KJs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'KTs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'K9s':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'K8s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'K7s':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'K6s':const ProgressInfo(raiseP: 0.40, callP: 0.60),
            'K5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K4s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K3s':const ProgressInfo(raiseP: 0.00, callP: 0.67),

            'AQo':const ProgressInfo(raiseP: 0.53, callP: 0.47),
            'KQo':const ProgressInfo(raiseP: 0.59, callP: 0.41),
            'QJs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'QTs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'Q9s':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'Q8s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'Q7s':const ProgressInfo(raiseP: 0.00, callP: 0.47),
            'Q6s':const ProgressInfo(raiseP: 0.00, callP: 0.84),
            'Q5s':const ProgressInfo(raiseP: 0.00, callP: 0.40),



            'AJo':const ProgressInfo(raiseP: 0.55, callP: 0.45),
            'KJo':const ProgressInfo(raiseP: 0.20, callP: 0.80),
            'QJo':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            'JTs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'J9s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'J8s':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            'J7s':const ProgressInfo(raiseP: 0.00, callP: 0.13),


            'ATo':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'KTo':const ProgressInfo(raiseP: 0.17, callP: 0.83),
            'QTo':const ProgressInfo(raiseP: 0.09, callP: 0.67),
            'JTo':const ProgressInfo(raiseP: 0.15, callP: 0.70),
            'T9s':const ProgressInfo(raiseP: 0.78, callP: 0.22),
            'T8s':const ProgressInfo(raiseP: 0.52, callP: 0.48),
            'T7s':const ProgressInfo(raiseP: 0.07, callP: 0.66),



            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.66),
            '98s':const ProgressInfo(raiseP: 0.46, callP: 0.54),
            '97s':const ProgressInfo(raiseP: 0.19, callP: 0.81),


            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.52, callP: 0.48),
            '86s':const ProgressInfo(raiseP: 0.18, callP: 0.82),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.53, callP: 0.47),
            '75s':const ProgressInfo(raiseP: 0.00, callP: 0.09),



            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.49, callP: 0.51),



            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.26, callP: 0.74),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),



            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.BTN:
          return {
            'AA' :const ProgressInfo(raiseP: 1.00, callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.00, callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'JJ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'TT' :const ProgressInfo(raiseP: 0.80, callP: 0.20),
            '99' :const ProgressInfo(raiseP: 0.47, callP: 0.53),
            '88' :const ProgressInfo(raiseP: 0.58, callP: 0.42),
            '77' :const ProgressInfo(raiseP: 0.65, callP: 0.35),
            '66' :const ProgressInfo(raiseP: 0.30, callP: 0.70),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'AJs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'ATs':const ProgressInfo(raiseP: 0.70, callP: 0.30),
            'A9s':const ProgressInfo(raiseP: 0.88, callP: 0.12),
            'A8s':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'A7s':const ProgressInfo(raiseP: 0.70, callP: 0.30),
            'A6s':const ProgressInfo(raiseP: 0.30, callP: 0.70),
            'A5s':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'A4s':const ProgressInfo(raiseP: 0.92, callP: 0.08),
            'A3s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'A2s':const ProgressInfo(raiseP: 0.11, callP: 0.89),


            'AKo':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'KQs':const ProgressInfo(raiseP: 0.81, callP: 0.19),
            'KJs':const ProgressInfo(raiseP: 0.82, callP: 0.18),
            'KTs':const ProgressInfo(raiseP: 0.94, callP: 0.06),
            'K9s':const ProgressInfo(raiseP: 0.89, callP: 0.11),
            'K8s':const ProgressInfo(raiseP: 0.22, callP: 0.78),
            'K7s':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'K6s':const ProgressInfo(raiseP: 0.77, callP: 0.23),
            'K5s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'K4s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K3s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K2s':const ProgressInfo(raiseP: 0.00, callP: 1.00),

            'AQo':const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'KQo':const ProgressInfo(raiseP: 0.92, callP: 0.08),
            'QJs':const ProgressInfo(raiseP: 0.89, callP: 0.11),
            'QTs':const ProgressInfo(raiseP: 0.92, callP: 0.08),
            'Q9s':const ProgressInfo(raiseP: 0.55, callP: 0.45),
            'Q8s':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'Q7s':const ProgressInfo(raiseP: 0.09, callP: 0.91),
            'Q6s':const ProgressInfo(raiseP: 0.52, callP: 0.48),
            'Q5s':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            'Q4s':const ProgressInfo(raiseP: 0.00, callP: 0.56),



            'AJo':const ProgressInfo(raiseP: 0.74, callP: 0.26),
            'KJo':const ProgressInfo(raiseP: 0.56, callP: 0.44),
            'QJo':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            'JTs':const ProgressInfo(raiseP: 0.93, callP: 0.07),
            'J9s':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'J8s':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'J7s':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            'J6s':const ProgressInfo(raiseP: 0.00, callP: 0.13),


            'ATo':const ProgressInfo(raiseP: 0.71, callP: 0.29),
            'KTo':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'QTo':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            'JTo':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            'T9s':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'T8s':const ProgressInfo(raiseP: 0.61, callP: 0.39),
            'T7s':const ProgressInfo(raiseP: 0.21, callP: 0.79),



            'A9o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'K9o':const ProgressInfo(raiseP: 0.00, callP: 0.37),
            'J9o':const ProgressInfo(raiseP: 0.00, callP: 0.27),
            'T9o':const ProgressInfo(raiseP: 0.00, callP: 0.33),
            '98s':const ProgressInfo(raiseP: 0.70, callP: 0.30),
            '97s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            '96s':const ProgressInfo(raiseP: 0.00, callP: 0.44),


            'A8o':const ProgressInfo(raiseP: 0.06, callP: 0.94),
            '87s':const ProgressInfo(raiseP: 0.83, callP: 0.17),
            '86s':const ProgressInfo(raiseP: 0.39, callP: 0.61),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.17),
            '76s':const ProgressInfo(raiseP: 0.72, callP: 0.28),
            '75s':const ProgressInfo(raiseP: 0.00, callP: 0.23),



            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.68, callP: 0.32),
            '64s':const ProgressInfo(raiseP: 0.00, callP: 0.15),



            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.17),
            '54s':const ProgressInfo(raiseP: 0.46, callP: 0.54),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),



            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.BB:
          return {
            'AA' :const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),
            'AKs':const ProgressInfo(raiseP: 0.5, callP: 0.5),
            'AQs':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'AJs':const ProgressInfo(raiseP: 0.6 , callP: 0.4 ),
            'ATs':const ProgressInfo(raiseP: 0.65, callP: 0.35),
            'A9s':const ProgressInfo(raiseP: 0.5, callP: 0.5),
            'A8s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'A7s':const ProgressInfo(raiseP: 0.3, callP: 0.7),
            'A6s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            'A5s':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            'A4s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AKo':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            'KK' :const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'KQs':const ProgressInfo(raiseP: 0.6, callP: 0.4),
            'KJs':const ProgressInfo(raiseP: 0.6, callP: 0.4),
            'KTs':const ProgressInfo(raiseP: 0.5, callP: 0.5),
            'K9s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            'K8s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            'K7s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'K6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K4s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AQo':const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),
            'KQo':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'QQ' :const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'QJs':const ProgressInfo(raiseP: 0.6, callP: 0.4),
            'QTs':const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
            'Q9s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            'Q8s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q4s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'Q3s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'Q2s':const ProgressInfo(raiseP: 0.1, callP: 0.9),

            'AJo':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'KJo':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'JJ' :const ProgressInfo(raiseP: 0.3, callP: 0.7),
            'JTs':const ProgressInfo(raiseP: 0.5, callP: 0.5),
            'J9s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            'J8s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J6s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            'J5s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'J4s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            'J3s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'J2s':const ProgressInfo(raiseP: 0.15, callP: 0.85),

            'ATo':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'KTo':const ProgressInfo(raiseP: 0.0, callP: 1.0),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'TT' :const ProgressInfo(raiseP: 0.3, callP: 0.7),
            'T9s':const ProgressInfo(raiseP: 0.3, callP: 0.7),
            'T8s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T6s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            'T5s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            'T4s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            'T3s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            'T2s':const ProgressInfo(raiseP: 0.1, callP: 0.9),

            'A9o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'K9o':const ProgressInfo(raiseP: 0.20, callP: 0.80),
            'Q9o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'J9o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'T9o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            '99' :const ProgressInfo(raiseP: 0.25, callP: 0.75),
            '98s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            '97s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '96s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            '95s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            '94s':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A8o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'K8o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'Q8o':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            'J8o':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            'T8o':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            '98o':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            '88' :const ProgressInfo(raiseP: 0.2, callP: 0.8),
            '87s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            '86s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            '85s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            '84s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A7o':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            'K7o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            'Q7o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            'J7o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'T7o':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            '97o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            '87o':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            '77' :const ProgressInfo(raiseP: 0.15, callP: 0.85),
            '76s':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            '75s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            '74s':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            '73s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A6o':const ProgressInfo(raiseP: 0.20, callP: 0.80),
            'K6o':const ProgressInfo(raiseP: 0.20, callP: 0.80),
            'Q6o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            'J6o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T6o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '96o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '76o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '66' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '65s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            '64s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            '63s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A5o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            'K5o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'Q5o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'J5o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T5o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '95o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '85o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '54s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            '53s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            '52s':const ProgressInfo(raiseP: 0.25, callP: 0.75),

            'A4o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            'K4o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J4o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T4o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.3),
            '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.75),
            '74o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '43s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            '42s':const ProgressInfo(raiseP: 0.15, callP: 0.85),

            'A3o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
            'K3o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J3o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T3o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.15),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0, callP: 1.0),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J2o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.5 ),

            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          };
        default : {
          return {
            'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          };
        }
      }
    } else if (tournaSelection.myTournaPosition == TournaPosition.BB) {
      switch (tournaSelection.opponentTournaPosition) {
        case TournaPosition.UTG:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.19, callP: 0.81),
            'AJs':const ProgressInfo(raiseP: 0.20, callP: 0.8 ),
            'ATs':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'A9s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A8s':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            'A7s':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A5s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'A4s':const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'A2s':const ProgressInfo(raiseP: 0.14, callP: 0.86),

            'AKo':const ProgressInfo(raiseP: 0.46, callP: 0.54),
            'KK' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KQs':const ProgressInfo(raiseP: 0.57, callP: 0.43),
            'KJs':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            'KTs':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            'K9s':const ProgressInfo(raiseP: 0.1 , callP: 0.9 ),
            'K8s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K6s':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'K5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AQo':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'KQo':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'QQ' :const ProgressInfo(raiseP: 0.72, callP: 0.28),
            'QJs':const ProgressInfo(raiseP: 0.51, callP: 0.49),
            'QTs':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            'Q9s':const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),
            'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AJo':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'KJo':const ProgressInfo(raiseP: 0.09, callP: 0.91),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'JJ' :const ProgressInfo(raiseP: 0.22, callP: 0.78),
            'JTs':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
            'J9s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'J8s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'ATo':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'TT' :const ProgressInfo(raiseP: 0.05, callP: 0.95),
            'T9s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'T8s':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '98s':const ProgressInfo(raiseP: 0.29, callP: 0.71),
            '97s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '96s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.69),
            'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.2 ),
            'T8o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '87s':const ProgressInfo(raiseP: 0.54, callP: 0.46),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.56),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.54),

            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.32),
            'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.28),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '76s':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.3 ),
            'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.52),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '65s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.24),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.85),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '54s':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.82),
            'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.00),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.64),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.11),
            'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.13),
            '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          };
        case TournaPosition.UTG1:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.87, callP: 0.28),
            'JJ' :const ProgressInfo(raiseP: 0.27, callP: 0.78),
            'TT' :const ProgressInfo(raiseP: 0.09, callP: 0.95),
            '99' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'ATs':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'A9s':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            'A8s':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            'A7s':const ProgressInfo(raiseP: 0.29, callP: 0.71),
            'A6s':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            'A5s':const ProgressInfo(raiseP: 0.43, callP: 0.57),
            'A4s':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            'A3s':const ProgressInfo(raiseP: 0.19, callP: 0.81),
            'A2s':const ProgressInfo(raiseP: 0.00, callP: 1.00),

            'AKo':const ProgressInfo(raiseP: 0.54, callP: 0.46),
            'KQs':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            'KJs':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'KTs':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            'K9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K8s':const ProgressInfo(raiseP: 0.06, callP: 0.94),
            'K7s':const ProgressInfo(raiseP: 0.19, callP: 0.81),
            'K6s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'K5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AQo':const ProgressInfo(raiseP: 0.05, callP: 0.95),
            'KQo':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            'QJs':const ProgressInfo(raiseP: 0.56, callP: 0.44),
            'QTs':const ProgressInfo(raiseP: 0.17, callP: 0.83),
            'Q9s':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            'Q8s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AJo':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            'KJo':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'JTs':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            'J9s':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'J8s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'ATo':const ProgressInfo(raiseP: 0.22, callP: 0.78),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T9s':const ProgressInfo(raiseP: 0.40, callP: 0.60),
            'T8s':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '98s':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            '97s':const ProgressInfo(raiseP: 0.17, callP: 0.83),
            '96s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K8o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.5 ),
            'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.67),
            'T8o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '87s':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.91),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '76s':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.69),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.64),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '65s':const ProgressInfo(raiseP: 0.48, callP: 0.52),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A5o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.41),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '54s':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.08),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.94),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.70),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.15),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.LJ:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'JJ' :const ProgressInfo(raiseP: 0.48, callP: 0.52),
            'TT' :const ProgressInfo(raiseP: 0.12, callP: 0.88),
            '99' :const ProgressInfo(raiseP: 0.06, callP: 0.94),
            '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A9s':const ProgressInfo(raiseP: 0.39, callP: 0.61),
            'A8s':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'A7s':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'A6s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'A5s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'A4s':const ProgressInfo(raiseP: 0.17, callP: 0.83),
            'A3s':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            'A2s':const ProgressInfo(raiseP: 0.28, callP: 0.72),

            'AKo':const ProgressInfo(raiseP: 0.74, callP: 0.26),
            'KQs':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            'KJs':const ProgressInfo(raiseP: 0.43, callP: 0.57),
            'KTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K7s':const ProgressInfo(raiseP: 0.39, callP: 0.61),
            'K6s':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'K5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AQo':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            'KQo':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'QJs':const ProgressInfo(raiseP: 0.66, callP: 0.34),
            'QTs':const ProgressInfo(raiseP: 0.31, callP: 0.69),
            'Q9s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'Q8s':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AJo':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'KJo':const ProgressInfo(raiseP: 0.09, callP: 0.91),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'JTs':const ProgressInfo(raiseP: 0.46, callP: 0.54),
            'J9s':const ProgressInfo(raiseP: 0.47, callP: 0.53),
            'J8s':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            'J7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'ATo':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'KTo':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T9s':const ProgressInfo(raiseP: 0.58, callP: 0.42),
            'T8s':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '98s':const ProgressInfo(raiseP: 0.30, callP: 0.70),
            '97s':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            '96s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K8o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.80),
            'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.91),
            'T8o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '87s':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            '86s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.91),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '76s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.09),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.52),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '65s':const ProgressInfo(raiseP: 0.50, callP: 0.50),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A5o':const ProgressInfo(raiseP: 0.06, callP: 0.94),
            'K5o':const ProgressInfo(raiseP: 0.00, callP: 0.28),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.39),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '54s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.15),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.12),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.90),
            '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.HJ:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'JJ' :const ProgressInfo(raiseP: 0.86, callP: 0.14),
            'TT' :const ProgressInfo(raiseP: 0.37, callP: 0.63),
            '99' :const ProgressInfo(raiseP: 0.05, callP: 0.95),
            '88' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'AJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A9s':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            'A8s':const ProgressInfo(raiseP: 0.54, callP: 0.46),
            'A7s':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            'A6s':const ProgressInfo(raiseP: 0.09, callP: 0.91),
            'A5s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'A4s':const ProgressInfo(raiseP: 0.27, callP: 0.73),
            'A3s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A2s':const ProgressInfo(raiseP: 0.00, callP: 1.00),

            'AKo':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'KQs':const ProgressInfo(raiseP: 0.05, callP: 0.95),
            'KJs':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'KTs':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            'K9s':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            'K8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K7s':const ProgressInfo(raiseP: 0.30, callP: 0.70),
            'K6s':const ProgressInfo(raiseP: 0.46, callP: 0.54),
            'K5s':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            'K4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AQo':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            'KQo':const ProgressInfo(raiseP: 0.17, callP: 0.83),
            'QJs':const ProgressInfo(raiseP: 0.27, callP: 0.73),
            'QTs':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'Q9s':const ProgressInfo(raiseP: 0.39, callP: 0.61),
            'Q8s':const ProgressInfo(raiseP: 0.43, callP: 0.57),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.08, callP: 0.92),
            'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AJo':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'KJo':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'QJo':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            'JTs':const ProgressInfo(raiseP: 0.81, callP: 0.19),
            'J9s':const ProgressInfo(raiseP: 0.85, callP: 0.15),
            'J8s':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            'J7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'ATo':const ProgressInfo(raiseP: 0.08, callP: 0.92),
            'KTo':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            'QTo':const ProgressInfo(raiseP: 0.06, callP: 0.94),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T9s':const ProgressInfo(raiseP: 0.77, callP: 0.23),
            'T8s':const ProgressInfo(raiseP: 0.53, callP: 0.47),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A9o':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'K9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '98s':const ProgressInfo(raiseP: 0.29, callP: 0.71),
            '97s':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            '96s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K8o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.91),
            'T8o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '87s':const ProgressInfo(raiseP: 0.53, callP: 0.47),
            '86s':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.43),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.15),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '76s':const ProgressInfo(raiseP: 0.55, callP: 0.45),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.41),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '65s':const ProgressInfo(raiseP: 0.61, callP: 0.39),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A5o':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            'K5o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.44),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '54s':const ProgressInfo(raiseP: 0.46, callP: 0.54),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A4o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.39),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.32),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A3o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.55),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          };
        case TournaPosition.CO:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'JJ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'TT' :const ProgressInfo(raiseP: 0.70, callP: 0.30),
            '99' :const ProgressInfo(raiseP: 0.21, callP: 0.79),
            '88' :const ProgressInfo(raiseP: 0.09, callP: 0.91),
            '77' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'AJs':const ProgressInfo(raiseP: 0.36, callP: 0.64),
            'ATs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A8s':const ProgressInfo(raiseP: 0.26, callP: 0.74),
            'A7s':const ProgressInfo(raiseP: 0.17, callP: 0.83),
            'A6s':const ProgressInfo(raiseP: 0.07, callP: 0.93),
            'A5s':const ProgressInfo(raiseP: 0.40, callP: 0.60),
            'A4s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'A3s':const ProgressInfo(raiseP: 0.22, callP: 0.78),
            'A2s':const ProgressInfo(raiseP: 0.00, callP: 1.00),

            'AKo':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'KQs':const ProgressInfo(raiseP: 0.56, callP: 0.44),
            'KJs':const ProgressInfo(raiseP: 0.09, callP: 0.91),
            'KTs':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            'K9s':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            'K8s':const ProgressInfo(raiseP: 0.40, callP: 0.60),
            'K7s':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'K6s':const ProgressInfo(raiseP: 0.37, callP: 0.63),
            'K5s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'K4s':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AQo':const ProgressInfo(raiseP: 0.50, callP: 0.50),
            'KQo':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'QTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q9s':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'Q8s':const ProgressInfo(raiseP: 0.39, callP: 0.61),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'Q5s':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AJo':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            'KJo':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            'QJo':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            'JTs':const ProgressInfo(raiseP: 0.92, callP: 0.08),
            'J9s':const ProgressInfo(raiseP: 0.67, callP: 0.33),
            'J8s':const ProgressInfo(raiseP: 0.61, callP: 0.39),
            'J7s':const ProgressInfo(raiseP: 0.40, callP: 0.60),
            'J6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'ATo':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'KTo':const ProgressInfo(raiseP: 0.19, callP: 0.81),
            'QTo':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T9s':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'T8s':const ProgressInfo(raiseP: 0.67, callP: 0.33),
            'T7s':const ProgressInfo(raiseP: 0.52, callP: 0.48),
            'T6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A9o':const ProgressInfo(raiseP: 0.06, callP: 0.94),
            'K9o':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '98s':const ProgressInfo(raiseP: 0.55, callP: 0.45),
            '97s':const ProgressInfo(raiseP: 0.52, callP: 0.48),
            '96s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A8o':const ProgressInfo(raiseP: 0.20, callP: 0.80),
            'K8o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'J8o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'T8o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '87s':const ProgressInfo(raiseP: 0.61, callP: 0.39),
            '86s':const ProgressInfo(raiseP: 0.50, callP: 0.50),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


            'A7o':const ProgressInfo(raiseP: 0.08, callP: 0.92),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.84),
            'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.82),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '76s':const ProgressInfo(raiseP: 0.65, callP: 0.35),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A6o':const ProgressInfo(raiseP: 0.09, callP: 0.91),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.10),
            '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.12),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '65s':const ProgressInfo(raiseP: 0.63, callP: 0.37),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A5o':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            'K5o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q5o':const ProgressInfo(raiseP: 0.00, callP: 0.69),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.48),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '54s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A4o':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'K4o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.23),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.52),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.67),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.66),
            '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.28),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.28),


          };
        case TournaPosition.BTN:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'JJ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'TT' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            '99' :const ProgressInfo(raiseP: 0.62, callP: 0.38),
            '88' :const ProgressInfo(raiseP: 0.34, callP: 0.66),
            '77' :const ProgressInfo(raiseP: 0.15, callP: 0.85),
            '66' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'AJs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'ATs':const ProgressInfo(raiseP: 0.65, callP: 0.35),
            'A9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A7s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A6s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A5s':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'A4s':const ProgressInfo(raiseP: 0.54, callP: 0.46),
            'A3s':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'A2s':const ProgressInfo(raiseP: 0.00, callP: 1.00),

            'AKo':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'KQs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'KJs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'KTs':const ProgressInfo(raiseP: 0.35, callP: 0.65),
            'K9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K7s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K6s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'K5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K4s':const ProgressInfo(raiseP: 0.05, callP: 0.95),
            'K3s':const ProgressInfo(raiseP: 0.05, callP: 0.95),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AQo':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'KQo':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            'QJs':const ProgressInfo(raiseP: 0.27, callP: 0.73),
            'QTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            'Q5s':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'Q4s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'AJo':const ProgressInfo(raiseP: 0.38, callP: 0.62),
            'KJo':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'QJo':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'JTs':const ProgressInfo(raiseP: 0.44, callP: 0.56),
            'J9s':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'J8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'J7s':const ProgressInfo(raiseP: 0.54, callP: 0.46),
            'J6s':const ProgressInfo(raiseP: 0.29, callP: 0.71),
            'J5s':const ProgressInfo(raiseP: 0.43, callP: 0.57),
            'J4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'J2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'ATo':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'KTo':const ProgressInfo(raiseP: 0.08, callP: 0.92),
            'QTo':const ProgressInfo(raiseP: 0.20, callP: 0.80),
            'JTo':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'T9s':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'T8s':const ProgressInfo(raiseP: 0.65, callP: 0.35),
            'T7s':const ProgressInfo(raiseP: 0.55, callP: 0.45),
            'T6s':const ProgressInfo(raiseP: 0.67, callP: 0.33),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A9o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K9o':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            'Q9o':const ProgressInfo(raiseP: 0.13, callP: 0.87),
            'J9o':const ProgressInfo(raiseP: 0.23, callP: 0.77),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '98s':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            '97s':const ProgressInfo(raiseP: 0.72, callP: 0.28),
            '96s':const ProgressInfo(raiseP: 0.57, callP: 0.43),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A8o':const ProgressInfo(raiseP: 0.08, callP: 0.92),
            'K8o':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            'Q8o':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'J8o':const ProgressInfo(raiseP: 0.19, callP: 0.81),
            'T8o':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '87s':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            '86s':const ProgressInfo(raiseP: 0.82, callP: 0.18),
            '85s':const ProgressInfo(raiseP: 0.05, callP: 0.95),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


            'A7o':const ProgressInfo(raiseP: 0.14, callP: 0.86),
            'K7o':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'Q7o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'J7o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '76s':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            '75s':const ProgressInfo(raiseP: 0.50, callP: 0.50),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A6o':const ProgressInfo(raiseP: 0.22, callP: 0.78),
            'K6o':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            'Q6o':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            'J6o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'T6o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '96o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '65s':const ProgressInfo(raiseP: 0.83, callP: 0.17),
            '64s':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A5o':const ProgressInfo(raiseP: 0.05, callP: 0.95),
            'K5o':const ProgressInfo(raiseP: 0.22, callP: 0.78),
            'Q5o':const ProgressInfo(raiseP: 0.06, callP: 0.94),
            'J5o':const ProgressInfo(raiseP: 0.00, callP: 1.00),

            '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.47),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '54s':const ProgressInfo(raiseP: 0.71, callP: 0.29),
            '53s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A4o':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            'K4o':const ProgressInfo(raiseP: 0.12, callP: 0.88),
            'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.91),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'K3o':const ProgressInfo(raiseP: 0.0 , callP: 1.0),
            'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 1.0),
            'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.19),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.80),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.89),


          };
        case TournaPosition.SB:
          return {
            'AA' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'JJ' :const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'TT' :const ProgressInfo(raiseP: 0.34, callP: 0.66),
            '99' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '88' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '77' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '66' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'AKs':const ProgressInfo(raiseP: 1.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'AJs':const ProgressInfo(raiseP: 0.70, callP: 0.30),
            'ATs':const ProgressInfo(raiseP: 0.33, callP: 0.67),
            'A9s':const ProgressInfo(raiseP: 0.06, callP: 0.94),
            'A8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A7s':const ProgressInfo(raiseP: 0.09, callP: 0.91),
            'A6s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A5s':const ProgressInfo(raiseP: 0.67, callP: 0.33),
            'A4s':const ProgressInfo(raiseP: 0.40, callP: 0.60),
            'A3s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'A2s':const ProgressInfo(raiseP: 0.00, callP: 1.00),


            'AKo':const ProgressInfo(raiseP: 1.00, callP: 0.00),
            'KQs':const ProgressInfo(raiseP: 0.39, callP: 0.61),
            'KJs':const ProgressInfo(raiseP: 0.40, callP: 0.60),
            'KTs':const ProgressInfo(raiseP: 0.47, callP: 0.53),
            'K9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K7s':const ProgressInfo(raiseP: 0.08, callP: 0.92),
            'K6s':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            'K5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K4s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K3s':const ProgressInfo(raiseP: 0.06, callP: 0.94),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'AQo':const ProgressInfo(raiseP: 0.39, callP: 0.61),
            'KQo':const ProgressInfo(raiseP: 0.18, callP: 0.82),
            'QJs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'QTs':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q9s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'Q6s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q4s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),


            'AJo':const ProgressInfo(raiseP: 0.16, callP: 0.84),
            'KJo':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'QJo':const ProgressInfo(raiseP: 0.08, callP: 0.92),
            'JTs':const ProgressInfo(raiseP: 0.19, callP: 0.81),
            'J9s':const ProgressInfo(raiseP: 0.07, callP: 0.93),
            'J8s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'J7s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'J6s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'J5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'J4s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'J3s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'J2s':const ProgressInfo(raiseP: 0.12, callP: 0.88),


            'ATo':const ProgressInfo(raiseP: 0.11, callP: 0.89),
            'KTo':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'QTo':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'JTo':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'T9s':const ProgressInfo(raiseP: 0.50, callP: 0.50),
            'T8s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
            'T7s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'T6s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'T5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'T4s':const ProgressInfo(raiseP: 0.08, callP: 0.92),
            'T3s':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            'T2s':const ProgressInfo(raiseP: 0.33, callP: 0.67),


            'A9o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K9o':const ProgressInfo(raiseP: 0.10, callP: 0.90),
            'Q9o':const ProgressInfo(raiseP: 0.24, callP: 0.76),
            'J9o':const ProgressInfo(raiseP: 0.25, callP: 0.75),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '98s':const ProgressInfo(raiseP: 0.70, callP: 0.30),
            '97s':const ProgressInfo(raiseP: 0.28, callP: 0.72),
            '96s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '93s':const ProgressInfo(raiseP: 0.08, callP: 0.92),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A8o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K8o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'Q8o':const ProgressInfo(raiseP: 0.29, callP: 0.71),
            'J8o':const ProgressInfo(raiseP: 0.34, callP: 0.66),
            'T8o':const ProgressInfo(raiseP: 0.21, callP: 0.79),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '87s':const ProgressInfo(raiseP: 0.60, callP: 0.40),
            '86s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '85s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '84s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '83s':const ProgressInfo(raiseP: 0.00, callP: 0.74),



            'A7o':const ProgressInfo(raiseP: 0.07, callP: 0.93),
            'K7o':const ProgressInfo(raiseP: 0.08, callP: 0.92),
            'Q7o':const ProgressInfo(raiseP: 0.00, callP: 0.24),
            'J7o':const ProgressInfo(raiseP: 0.34, callP: 0.20),
            'T7o':const ProgressInfo(raiseP: 0.45, callP: 0.55),
            '97o':const ProgressInfo(raiseP: 0.10, callP: 0.73),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '76s':const ProgressInfo(raiseP: 0.49, callP: 0.51),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),



            'A6o':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            'K6o':const ProgressInfo(raiseP: 0.29, callP: 0.71),
            'Q6o':const ProgressInfo(raiseP: 0.29, callP: 0.18),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.11),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '65s':const ProgressInfo(raiseP: 0.42, callP: 0.58),
            '64s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

            'A5o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            'K5o':const ProgressInfo(raiseP: 0.42, callP: 0.58),
            'Q5o':const ProgressInfo(raiseP: 0.26, callP: 0.00),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.70),
            '54s':const ProgressInfo(raiseP: 0.41, callP: 0.59),
            '53s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A4o':const ProgressInfo(raiseP: 0.06, callP: 0.94),
            'K4o':const ProgressInfo(raiseP: 0.25, callP: 0.00),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.68),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),


            'A3o':const ProgressInfo(raiseP: 0.32, callP: 0.68),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 1.00),

            'A2o':const ProgressInfo(raiseP: 0.60, callP: 0.40),



          };
        default : {
          return {
            'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


            'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

            'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
            '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          };
        }
      } 
    }
  }
  //스택,내포지션만 선택됨
  else if (tournaSelection.myTournaPosition != TournaPosition.none) {
    switch (tournaSelection.myTournaPosition) {
      case TournaPosition.UTG:
        return {
          'AA' :const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'AKs':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'AQs':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'AJs':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'ATs':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'A9s':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'A8s':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'A7s':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'A6s':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'A5s':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'A4s':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'A3s':const ProgressInfo(callP: 0.0, raiseP: 0.4),
          'AKo':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'KK' :const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'KQs':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'KJs':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'KTs':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'K9s':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'K8s':const ProgressInfo(callP: 0.0, raiseP: 0.4),
          'AQo':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'KQo':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'QQ' :const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'QJs':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'QTs':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'Q9s':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'AJo':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'KJo':const ProgressInfo(callP: 0.0, raiseP: 0.3),
          'QJo':const ProgressInfo(callP: 0.0, raiseP: 0.0),
          'JJ' :const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'JTs':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'J9s':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'ATo':const ProgressInfo(callP: 0.0, raiseP: 0.3),
          'JTo':const ProgressInfo(callP: 0.0, raiseP: 0.0),
          'TT' :const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'T9s':const ProgressInfo(callP: 0.0, raiseP: 1.0),
          'T8s':const ProgressInfo(callP: 0.0, raiseP: 0.7),
          '99' :const ProgressInfo(callP: 0.0, raiseP: 1.0),
          '98s':const ProgressInfo(callP: 0.0, raiseP: 0.5),
          '88' :const ProgressInfo(callP: 0.0, raiseP: 1.0),
          '87s':const ProgressInfo(callP: 0.0, raiseP: 0.3),
          '77' :const ProgressInfo(callP: 0.0, raiseP: 1.0),
          '76s':const ProgressInfo(callP: 0.0, raiseP: 0.2),
          '66' :const ProgressInfo(callP: 0.0, raiseP: 1.0),
          '65s':const ProgressInfo(callP: 0.0, raiseP: 0.2),
          '55' :const ProgressInfo(callP: 0.0, raiseP: 1.0),
          '44' :const ProgressInfo(callP: 0.0, raiseP: 0.6),
          '33' :const ProgressInfo(callP: 0.0, raiseP: 0.5),
          '22' :const ProgressInfo(callP: 0.0, raiseP: 0.5),
        };
      case TournaPosition.UTG1:
        return {
          'AA' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AKs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AQs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'ATs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A5s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A4s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A3s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AKo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KK' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KQs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K7s':const ProgressInfo(callP: 0.0 , raiseP: 0.3 ),
          'K6s':const ProgressInfo(callP: 0.0 , raiseP: 0.2 ),
          'AQo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KQo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QQ' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AJo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KJo':const ProgressInfo(callP: 0.0 , raiseP: 0.7 ),
          'QJo':const ProgressInfo(callP: 0.0 , raiseP: 0.4 ),
          'JJ' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'JTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J8s':const ProgressInfo(callP: 0.0 , raiseP: 0.1 ),
          'ATo':const ProgressInfo(callP: 0.0 , raiseP: 0.9 ),
          'KTo':const ProgressInfo(callP: 0.0 , raiseP: 0.0 ),
          'JTo':const ProgressInfo(callP: 0.0 , raiseP: 0.2 ),
          'TT' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '99' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '98s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '88' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '87s':const ProgressInfo(callP: 0.0 , raiseP: 0.5 ),
          '77' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '76s':const ProgressInfo(callP: 0.0 , raiseP: 0.3 ),
          '66' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '65s':const ProgressInfo(callP: 0.0 , raiseP: 0.3 ),
          '55' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '44' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '33' :const ProgressInfo(callP: 0.0 , raiseP: 0.7 ),
          '22' :const ProgressInfo(callP: 0.0 , raiseP: 0.7 ),
        };
      case TournaPosition.LJ:
        return {
          'AA' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AKs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AQs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'ATs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A5s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A4s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A3s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A2s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AKo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KK' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KQs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K6s':const ProgressInfo(callP: 0.0 , raiseP: 0.5 ),
          'AQo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KQo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QQ' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q8s':const ProgressInfo(callP: 0.0 , raiseP: 0.45 ),
          'AJo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KJo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QJo':const ProgressInfo(callP: 0.0 , raiseP: 0.8 ),
          'JJ' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'JTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J8s':const ProgressInfo(callP: 0.0 , raiseP: 0.7 ),
          'ATo':const ProgressInfo(callP: 0.0 , raiseP: 0.9 ),
          'KTo':const ProgressInfo(callP: 0.0 , raiseP: 0.5 ),
          'QTo':const ProgressInfo(callP: 0.0 , raiseP: 0.3 ),
          'JTo':const ProgressInfo(callP: 0.0 , raiseP: 0.5 ),
          'TT' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '99' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '98s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '97s':const ProgressInfo(callP: 0.0 , raiseP: 0.4 ),
          '88' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '87s':const ProgressInfo(callP: 0.0 , raiseP: 0.6 ),
          '77' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '76s':const ProgressInfo(callP: 0.0 , raiseP: 0.4 ),
          '66' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '65s':const ProgressInfo(callP: 0.0 , raiseP: 0.35 ),
          '55' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '44' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '33' :const ProgressInfo(callP: 0.0 , raiseP: 0.75 ),
          '22' :const ProgressInfo(callP: 0.0 , raiseP: 0.7 ),
        };
      case TournaPosition.HJ:
        return {
          'AA' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AKs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AQs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'ATs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A5s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A4s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A3s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A2s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AKo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KK' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KQs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K5s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K4s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AQo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KQo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QQ' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q7s':const ProgressInfo(callP: 0.0 , raiseP: 0.62),
          'Q6s':const ProgressInfo(callP: 0.0 , raiseP: 0.64),
          'AJo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KJo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QJo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'JJ' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'JTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J7s':const ProgressInfo(callP: 0.0 , raiseP: 0.38),
          'ATo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KTo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QTo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'JTo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'TT' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A9o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '99' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '98s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '97s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A8o':const ProgressInfo(callP: 0.0 , raiseP: 0.2 ),
          '88' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '87s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '86s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '77' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '76s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '66' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '65s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '55' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '54s':const ProgressInfo(callP: 0.0 , raiseP: 0.5 ),
          '44' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '33' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '22' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
        };
      case TournaPosition.CO:
        return {
          'AA' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AKs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AQs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'ATs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A5s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A4s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A3s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A2s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          'AKo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KK' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KQs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K5s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K4s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K3s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K2s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          'AQo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KQo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QQ' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q5s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q4s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q3s':const ProgressInfo(callP: 0.0 , raiseP: 0.15),

          'AJo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KJo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QJo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'JJ' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'JTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J5s':const ProgressInfo(callP: 0.0 , raiseP: 0.45),

          'ATo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KTo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QTo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'JTo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'TT' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          'A9o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K9o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q9o':const ProgressInfo(callP: 0.0 , raiseP: 0.45 ),
          'J9o':const ProgressInfo(callP: 0.0 , raiseP: 0.6 ),
          'T9o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '99' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '98s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '97s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '96s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          'A8o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '98o':const ProgressInfo(callP: 0.0 , raiseP: 0.15 ),
          '88' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '87s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '86s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          '85s':const ProgressInfo(callP: 0.0 , raiseP: 0.5 ),

          'A7o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '77' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '76s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '75s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          '66' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '65s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '64s':const ProgressInfo(callP: 0.0 , raiseP: 0.45),

          'A5o':const ProgressInfo(callP: 0.0 , raiseP: 0.6 ),
          '55' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '54s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          '44' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '33' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '22' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
        };
      case TournaPosition.BTN:
        return {
          'AA' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AKs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AQs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'AJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'ATs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A5s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A4s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A3s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A2s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          'AKo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KK' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KQs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K5s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K4s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K3s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K2s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          'AQo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KQo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QQ' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QJs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q5s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q4s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q3s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q2s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          'AJo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KJo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QJo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'JJ' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'JTs':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J5s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J4s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J3s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J2s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),


          'ATo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'KTo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'QTo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'JTo':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'TT' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T9s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T8s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T7s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T6s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T5s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T4s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T3s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          'A9o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K9o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q9o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J9o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T9o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '99' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '98s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '97s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '96s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '95s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          'A8o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K8o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q8o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'J8o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'T8o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '98o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '88' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '87s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '86s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '86s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '85s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '84s':const ProgressInfo(callP: 0.0 , raiseP: 0.6 ),

          'A7o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K7o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'Q7o':const ProgressInfo(callP: 0.0 , raiseP: 0.62),
          'J7o':const ProgressInfo(callP: 0.0 , raiseP: 0.00),
          'T7o':const ProgressInfo(callP: 0.0 , raiseP: 0.6 ),
          '97o':const ProgressInfo(callP: 0.0 , raiseP: 0.85),
          '87o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '77' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '76s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '75s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '74s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          'A6o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K6o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '76o':const ProgressInfo(callP: 0.0 , raiseP: 0.34),
          '66' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '65s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '65s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '64s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '63s':const ProgressInfo(callP: 0.0 , raiseP: 0.83),

          'A5o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'K5o':const ProgressInfo(callP: 0.0 , raiseP: 0.9 ),
          '55' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '54s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '53s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          'A4o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '44' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '43s':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),

          'A3o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '33' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          'A2o':const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
          '22' :const ProgressInfo(callP: 0.0 , raiseP: 1.0 ),
        };
      case TournaPosition.SB:
        return {
          'AA' :const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),
          'AKs':const ProgressInfo(raiseP: 0.5, callP: 0.5),
          'AQs':const ProgressInfo(raiseP: 0.25, callP: 0.75),
          'AJs':const ProgressInfo(raiseP: 0.6 , callP: 0.4 ),
          'ATs':const ProgressInfo(raiseP: 0.65, callP: 0.35),
          'A9s':const ProgressInfo(raiseP: 0.5, callP: 0.5),
          'A8s':const ProgressInfo(raiseP: 0.45, callP: 0.55),
          'A7s':const ProgressInfo(raiseP: 0.3, callP: 0.7),
          'A6s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          'A5s':const ProgressInfo(raiseP: 0.35, callP: 0.65),
          'A4s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'A3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'A2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

          'AKo':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          'KK' :const ProgressInfo(raiseP: 0.25, callP: 0.75),
          'KQs':const ProgressInfo(raiseP: 0.6, callP: 0.4),
          'KJs':const ProgressInfo(raiseP: 0.6, callP: 0.4),
          'KTs':const ProgressInfo(raiseP: 0.5, callP: 0.5),
          'K9s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          'K8s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          'K7s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'K6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'K5s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
          'K4s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
          'K3s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'K2s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

          'AQo':const ProgressInfo(raiseP: 0.3 , callP: 0.7 ),
          'KQo':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'QQ' :const ProgressInfo(raiseP: 0.25, callP: 0.75),
          'QJs':const ProgressInfo(raiseP: 0.6, callP: 0.4),
          'QTs':const ProgressInfo(raiseP: 0.5 , callP: 0.5 ),
          'Q9s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          'Q8s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'Q4s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
          'Q3s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
          'Q2s':const ProgressInfo(raiseP: 0.1, callP: 0.9),

          'AJo':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'KJo':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          'QJo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'JJ' :const ProgressInfo(raiseP: 0.3, callP: 0.7),
          'JTs':const ProgressInfo(raiseP: 0.5, callP: 0.5),
          'J9s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          'J8s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'J7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'J6s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          'J5s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'J4s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          'J3s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'J2s':const ProgressInfo(raiseP: 0.15, callP: 0.85),

          'ATo':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'KTo':const ProgressInfo(raiseP: 0.0, callP: 1.0),
          'QTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'JTo':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'TT' :const ProgressInfo(raiseP: 0.3, callP: 0.7),
          'T9s':const ProgressInfo(raiseP: 0.3, callP: 0.7),
          'T8s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          'T7s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'T6s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          'T5s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          'T4s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          'T3s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          'T2s':const ProgressInfo(raiseP: 0.1, callP: 0.9),

          'A9o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'K9o':const ProgressInfo(raiseP: 0.20, callP: 0.80),
          'Q9o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'J9o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'T9o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          '99' :const ProgressInfo(raiseP: 0.25, callP: 0.75),
          '98s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          '97s':const ProgressInfo(raiseP: 0.00, callP: 1.00),
          '96s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          '95s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
          '94s':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
          '93s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '92s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

          'A8o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'K8o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'Q8o':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          'J8o':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          'T8o':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          '98o':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          '88' :const ProgressInfo(raiseP: 0.2, callP: 0.8),
          '87s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          '86s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          '85s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          '84s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
          '83s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '82s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

          'A7o':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          'K7o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          'Q7o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          'J7o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'T7o':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          '97o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          '87o':const ProgressInfo(raiseP: 0.14, callP: 0.86),
          '77' :const ProgressInfo(raiseP: 0.15, callP: 0.85),
          '76s':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
          '75s':const ProgressInfo(raiseP: 0.10, callP: 0.90),
          '74s':const ProgressInfo(raiseP: 0.2 , callP: 0.8 ),
          '73s':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          '72s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

          'A6o':const ProgressInfo(raiseP: 0.20, callP: 0.80),
          'K6o':const ProgressInfo(raiseP: 0.20, callP: 0.80),
          'Q6o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          'J6o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'T6o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '96o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '86o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '76o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
          '66' :const ProgressInfo(raiseP: 0.00, callP: 1.00),
          '65s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
          '64s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
          '63s':const ProgressInfo(raiseP: 0.2, callP: 0.8),
          '62s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

          'A5o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          'K5o':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          'Q5o':const ProgressInfo(raiseP: 0.00, callP: 1.00),
          'J5o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'T5o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '95o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '85o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '75o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '65o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '55' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '54s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
          '53s':const ProgressInfo(raiseP: 0.25, callP: 0.75),
          '52s':const ProgressInfo(raiseP: 0.25, callP: 0.75),

          'A4o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          'K4o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'J4o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'T4o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.3),
          '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.75),
          '74o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '64o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '54o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '44' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '43s':const ProgressInfo(raiseP: 0.15, callP: 0.85),
          '42s':const ProgressInfo(raiseP: 0.15, callP: 0.85),

          'A3o':const ProgressInfo(raiseP: 0.1, callP: 0.9),
          'K3o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'J3o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'T3o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '53o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.15),
          '33' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          '32s':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),

          'A2o':const ProgressInfo(raiseP: 0.0, callP: 1.0),
          'K2o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'J2o':const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
          'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.5 ),

          '22' :const ProgressInfo(raiseP: 0.0 , callP: 1.0 ),
        };
      default : {
        return {
          'AA' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'KK' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'QQ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'JJ' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'TT' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '99' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '88' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '77' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '66' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '55' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '44' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '33' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '22' :const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),


          'AKs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'AQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'AJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'ATs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'A9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'A8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'A7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'A6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'A5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'A4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'A3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'A2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          'AKo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'KQs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'KJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'KTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          'AQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'KQo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'QJs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'QTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          'AJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'KJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'QJo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'JTs':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          'ATo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'KTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'QTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'JTo':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T9s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T8s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T7s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T6s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T5s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T4s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T3s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T2s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          'A9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T9o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '98s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '97s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '96s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '95s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '94s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '93s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '92s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          'A8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T8o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '98o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '87s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '86s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '85s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '84s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '83s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '82s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          'A7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T7o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '97o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '87o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '76s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '75s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '74s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '73s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '72s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          'A6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T6o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '96o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '86o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '76o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '65s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '64s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '63s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '62s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          'A5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T5o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '95o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '85o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '75o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '65o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '54s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '53s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '52s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          'A4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T4o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '94o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '84o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '74o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '64o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '54o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '43s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '42s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          'A3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T3o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '93o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '83o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '73o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '63o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '53o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '43o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '32s':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),

          'A2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'K2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'Q2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'J2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          'T2o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '92o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '82o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '72o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '62o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '52o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '42o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
          '32o':const ProgressInfo(raiseP: 0.0 , callP: 0.0 ),
        };
      }
    }
  }
  //4벳팟위한 수딧좀 붙여놓고 얼레디 들어감.
  return {
    'AA' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'KK' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'QQ' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'JJ' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'TT' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '99' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '88' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '77' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '66' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '55' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '44' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '33' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '22' :const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),


    'AKs':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'AQs':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'AJs':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'ATs':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'A9s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'A8s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'A7s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'A6s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'A5s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'A4s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'A3s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'A2s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

    'AKo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'KQs':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'KJs':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'KTs':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K9s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K8s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K7s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K6s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K5s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K4s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K3s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K2s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

    'AQo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'KQo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'QJs':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'QTs':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q9s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q8s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q7s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q6s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q5s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q4s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q3s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q2s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

    'AJo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'KJo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'QJo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'JTs':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J9s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J8s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J7s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J6s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J5s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J4s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J3s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J2s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

    'ATo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'KTo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'QTo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'JTo':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T9s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T8s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T7s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T6s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T5s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T4s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T3s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T2s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

    'A9o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K9o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q9o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J9o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T9o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '98s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '97s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '96s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '95s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '94s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '93s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '92s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

    'A8o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K8o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q8o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J8o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T8o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '98o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '87s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '86s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '85s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '84s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '83s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '82s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

    'A7o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K7o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q7o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J7o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T7o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '97o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '87o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '76s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '75s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '74s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '73s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '72s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

    'A6o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K6o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q6o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J6o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T6o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '96o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '86o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '76o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '65s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '64s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '63s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '62s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

    'A5o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K5o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q5o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J5o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T5o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '95o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '85o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '75o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '65o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '54s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '53s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '52s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

    'A4o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K4o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q4o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J4o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T4o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '94o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '84o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '74o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '64o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '54o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '43s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '42s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

    'A3o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K3o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q3o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J3o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T3o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '93o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '83o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '73o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '63o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '53o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '43o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '32s':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),

    'A2o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'K2o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'Q2o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'J2o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    'T2o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '92o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '82o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '72o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '62o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '52o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '42o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
    '32o':const ProgressInfo(raiseP: 0.0, callP: 0.0, alreadyP: 0.0),
  };
}