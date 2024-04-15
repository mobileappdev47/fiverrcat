import 'package:flutter/material.dart';
import '../constarants/selection.dart';
import '../tourna_chart_stack/100bb.dart';
import '../tourna_chart_stack/80bb.dart';
import '../tourna_chart_stack/60bb.dart';
import '../tourna_chart_stack/50bb.dart';
import '../tourna_chart_stack/40bb.dart';
import '../tourna_chart_stack/35bb.dart';
import '../tourna_chart_stack/30bb.dart';
import '../tourna_chart_stack/25bb.dart';

import 'progress_info_model.dart';

class TournaChartBrain {
  TournaChartBrain({Key? key});

  Map<String, ProgressInfo> paintingProgress(Selection tournaSelection) {

    switch (tournaSelection.tournaStack) {
      case TournaStack.hundred:
        return hundredStack(tournaSelection);
      case TournaStack.eighty:
        return eightyStack(tournaSelection);
      case TournaStack.sixty:
        return sixtyStack(tournaSelection);
      case TournaStack.fifty:
        return fiftyStack(tournaSelection);
      case TournaStack.forty:
        return fortyStack(tournaSelection);
      case TournaStack.thirtyfive:
        return thirtyfiveStack(tournaSelection);
      case TournaStack.thirty:
        return thirtyStack(tournaSelection);
      case TournaStack.twentyfive:
        return twentyfiveStack(tournaSelection);
      default : {
        return hundredStack(tournaSelection);
      }
      // case TournaStack.twenty:
      //   return twentyStack(tournaSelection);
    }


  }




}
