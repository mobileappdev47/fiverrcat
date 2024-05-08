import 'dart:ffi';
import 'dart:math';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pokercat/addexpense/db/functions/category_functions.dart';
import 'package:pokercat/addexpense/db/functions/currency_function.dart';
import 'package:pokercat/addexpense/db/functions/transaction_function.dart';
import 'package:pokercat/addexpense/db/models/account_group/account_group_model_db.dart';
import 'package:pokercat/addexpense/db/models/category/category_model_db.dart';
import 'package:pokercat/addexpense/db/models/transactions/transaction_model_db.dart';
import 'package:pokercat/addexpense/widget/transaction_helper.dart';
import 'package:pokercat/imports.dart';
import 'package:pokercat/packages/expense_repository/lib/expense_repository.dart';
import 'package:pokercat/packages/expense_repository/lib/src/models/expense.dart';
import 'package:pokercat/pages/line_chart_sample2.dart';
import 'package:pokercat/pages/sf_line_chart_screen.dart';
import '../constant.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../global/component/appbar.dart';

Map monthChartDataGraph = {};
List<ChartData> chartData = [];
final List<Color> color = <Color>[];
final List<double> stops = <double>[];
String selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
String dropdownvalue = '1 Day';
String selected = 'All';
String cycleOrAllTime = 'All Time';
String selectedCategory = 'All';
int selectedCategoryIndex = 0;

initialize() {
  chartData = [
    ChartData('jan', double.parse(monthChartDataGraph!['jan']['total'])),
    ChartData('feb', double.parse(monthChartDataGraph!['feb']['total'])),
    ChartData('mar', double.parse(monthChartDataGraph!['mar']['total'])),
    ChartData('apr', double.parse(monthChartDataGraph!['apr']['total'])),
    ChartData('may', double.parse(monthChartDataGraph!['may']['total'])),
    ChartData('jun', double.parse(monthChartDataGraph!['jun']['total'])),
    ChartData('july', double.parse(monthChartDataGraph!['july']['total'])),
    ChartData('Aug', double.parse(monthChartDataGraph!['aug']['total'])),
    ChartData('Sep', double.parse(monthChartDataGraph!['sep']['total'])),
    ChartData('Oct', double.parse(monthChartDataGraph!['oct']['total'])),
    ChartData('Nov', double.parse(monthChartDataGraph!['nov']['total'])),
    ChartData('Dec', double.parse(monthChartDataGraph!['dec']['total'])),
  ];
  color.add(
    AppTheme.contentColorCyan.withOpacity(0.2),
  );
  color.add(
    AppTheme.contentColorBlue.withOpacity(0.5),
  );
  color.add(
    AppTheme.contentColorCyan.withOpacity(0.5),
  );
  stops.add(0.0);
  stops.add(0.5);
  stops.add(1.0);
}

initialize1DayData() {
  color.add(
    AppTheme.chartColor.withOpacity(0.1),
  );
  color.add(
    AppTheme.chartColor.withOpacity(0.3),
  );
  color.add(
    AppTheme.chartColor.withOpacity(0.6),
  );
  stops.add(0.0);
  stops.add(0.5);
  stops.add(1.0);





  if (cycleOrAllTime == 'All Time') {

    allTimeButton();

  } else {
    if (dropdownvalue == '1 Day') {
      dayWiseDay();
    } else if (dropdownvalue == '1 Week') {
      weekWiseChart();
    } else if (dropdownvalue == '1 Month') {
      monthWiseChart();
    } else if (dropdownvalue == '1 Year') {
      yearWiseChart();
    }
  }
}



initialize1DayDataOnlyOneTime() {
  color.add(
    AppTheme.chartColor.withOpacity(0.1),
  );
  color.add(
    AppTheme.chartColor.withOpacity(0.3),
  );
  color.add(
    AppTheme.chartColor.withOpacity(0.6),
  );
  stops.add(0.0);
  stops.add(0.5);
  stops.add(1.0);





  if (cycleOrAllTime == 'All Time') {

    allTimeButton();

  } else {
    if (dropdownvalue == '1 Day') {
      dayWiseDay();
    } else if (dropdownvalue == '1 Week') {
      weekWiseChart();
    } else if (dropdownvalue == '1 Month') {
      monthWiseChart();
    } else if (dropdownvalue == '1 Year') {
      yearWiseChart();
    }
  }
}





allTimeButton() {
  var data = TransactionDB.instance.transactionListNotifier.value;

  List<ChartData> allTimeChart = [];

  List allTimeDates = [];
  List reverseAllTimeDates = [];

  for (int j = 0; j < data.length; j++) {
    DateTime localDate = DateTime.parse(data[j].date);

    if (allTimeDates.contains(DateFormat('dd-MM-yyyy').format(localDate)) ==
        false) {
      allTimeDates.add(DateFormat('dd-MM-yyyy').format(localDate));
      allTimeChart.add(ChartData(data[j].date, 0));
    } else {}
  }
  print(allTimeDates);

  reverseAllTimeDates = List.from(allTimeDates.reversed);

  double total = 0;
  double dateTotal = 0;
  for (int i = 0; i < reverseAllTimeDates.length; i++) {
    String date2 = reverseAllTimeDates[i];

    for (int j = 0; j < data.length; j++) {
      DateTime localDate = DateTime.parse(data[j].date);
      String localDate1 = DateFormat('dd-MM-yyyy').format(localDate);

      if (localDate1 == date2) {
        dateTotal = 0;

        for (int i = 0; i < data.length; i++) {
          if (localDate1 ==
              DateFormat('dd-MM-yyyy').format(DateTime.parse(data[i].date))) {
            if (data[i].categoryType == CategoryType.income) {
              dateTotal = dateTotal + data[i].amount;
            } else if (data[i].categoryType == CategoryType.expense) {
              dateTotal = dateTotal - data[i].amount;
            } else {}
          }
        }
        // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
        total = total + dateTotal;
        break;
      } else {
        print('no');
      }
    }
    allTimeChart[i] = ChartData(reverseAllTimeDates[i], total);
  }

  chartData = allTimeChart;
}

allTimeExpenseButton() {
  var data = TransactionDB.instance.transactionListNotifier.value;

  List<ChartData> allTimeChart = [];

  List allTimeDates = [];
  List reverseAllTimeDates = [];

  for (int j = 0; j < data.length; j++) {
    DateTime localDate = DateTime.parse(data[j].date);

    if (allTimeDates.contains(DateFormat('dd-MM-yyyy').format(localDate)) ==
        false) {
      allTimeDates.add(DateFormat('dd-MM-yyyy').format(localDate));
      allTimeChart.add(ChartData(data[j].date, 0));
    } else {}
  }
  print(allTimeDates);

  reverseAllTimeDates = List.from(allTimeDates.reversed);

  double total = -0;
  double dateTotal = -0;
  for (int i = 0; i < reverseAllTimeDates.length; i++) {
    String date2 = reverseAllTimeDates[i];

    for (int j = 0; j < data.length; j++) {
      if (data[j].categoryType == CategoryType.expense) {
        DateTime localDate = DateTime.parse(data[j].date);
        String localDate1 = DateFormat('dd-MM-yyyy').format(localDate);

        if (localDate1 == date2) {
          dateTotal = -0;

          for (int i = 0; i < data.length; i++) {
            if (localDate1 ==
                DateFormat('dd-MM-yyyy').format(DateTime.parse(data[i].date))) {
              dateTotal = dateTotal - data[i].amount;
            }
          }
          // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
          total = total + dateTotal;
          break;
        } else {
          print('no');
        }
      } else {}
    }
    allTimeChart[i] = ChartData(reverseAllTimeDates[i], total);
  }

  chartData = allTimeChart;
}

allTimeExpenseButtonWithCategory(String type) {
  var data = TransactionDB.instance.transactionListNotifier.value;

  List<ChartData> allTimeChart = [];

  List allTimeDates = [];
  List reverseAllTimeDates = [];

  for (int j = 0; j < data.length; j++) {
    DateTime localDate = DateTime.parse(data[j].date);

    if (allTimeDates.contains(DateFormat('dd-MM-yyyy').format(localDate)) ==
        false) {
      allTimeDates.add(DateFormat('dd-MM-yyyy').format(localDate));
      allTimeChart.add(ChartData(data[j].date, 0));
    } else {}
  }
  print(allTimeDates);

  reverseAllTimeDates = List.from(allTimeDates.reversed);

  double total = -0;
  double dateTotal = -0;
  for (int i = 0; i < reverseAllTimeDates.length; i++) {
    String date2 = reverseAllTimeDates[i];

    for (int j = 0; j < data.length; j++) {
      if (data[j].categoryType == CategoryType.expense &&
          data[j].category.name == type) {
        DateTime localDate = DateTime.parse(data[j].date);
        String localDate1 = DateFormat('dd-MM-yyyy').format(localDate);

        if (localDate1 == date2) {
          dateTotal = -0;

          for (int i = 0; i < data.length; i++) {
            if (localDate1 ==
                DateFormat('dd-MM-yyyy').format(DateTime.parse(data[i].date))) {
              dateTotal = dateTotal - data[i].amount;
            }
          }
          // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
          total = total + dateTotal;
          break;
        } else {
          print('no');
        }
      } else {}
    }
    allTimeChart[i] = ChartData(reverseAllTimeDates[i], total);
  }

  chartData = allTimeChart;
}

allTimeIncomeButton() {
  var data = TransactionDB.instance.transactionListNotifier.value;

  List<ChartData> allTimeChart = [];

  List allTimeDates = [];
  List reverseAllTimeDates = [];

  for (int j = 0; j < data.length; j++) {
    DateTime localDate = DateTime.parse(data[j].date);

    if (allTimeDates.contains(DateFormat('dd-MM-yyyy').format(localDate)) ==
        false) {
      allTimeDates.add(DateFormat('dd-MM-yyyy').format(localDate));
      allTimeChart.add(ChartData(data[j].date, 0));
    } else {}
  }
  print(allTimeDates);

  reverseAllTimeDates = List.from(allTimeDates.reversed);

  double total = 0;
  double dateTotal = 0;
  for (int i = 0; i < reverseAllTimeDates.length; i++) {
    String date2 = reverseAllTimeDates[i];

    for (int j = 0; j < data.length; j++) {
      if (data[j].categoryType == CategoryType.income) {
        DateTime localDate = DateTime.parse(data[j].date);
        String localDate1 = DateFormat('dd-MM-yyyy').format(localDate);

        if (localDate1 == date2) {
          dateTotal = 0;

          for (int i = 0; i < data.length; i++) {
            if (localDate1 ==
                DateFormat('dd-MM-yyyy').format(DateTime.parse(data[i].date))) {
              dateTotal = dateTotal + data[i].amount;
            }
          }
          // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
          total = total + dateTotal;
          break;
        } else {
          print('no');
        }
      } else {}
    }
    allTimeChart[i] = ChartData(reverseAllTimeDates[i], total);
  }

  chartData = allTimeChart;
}

allTimeIncomeButtonWithCategory(String type) {
  var data = TransactionDB.instance.transactionListNotifier.value;

  List<ChartData> allTimeChart = [];

  List allTimeDates = [];
  List reverseAllTimeDates = [];

  for (int j = 0; j < data.length; j++) {
    DateTime localDate = DateTime.parse(data[j].date);

    if (allTimeDates.contains(DateFormat('dd-MM-yyyy').format(localDate)) ==
        false) {
      allTimeDates.add(DateFormat('dd-MM-yyyy').format(localDate));
      allTimeChart.add(ChartData(data[j].date, 0));
    } else {}
  }
  print(allTimeDates);

  reverseAllTimeDates = List.from(allTimeDates.reversed);

  double total = 0;
  double dateTotal = 0;
  for (int i = 0; i < reverseAllTimeDates.length; i++) {
    String date2 = reverseAllTimeDates[i];

    for (int j = 0; j < data.length; j++) {
      DateTime localDate = DateTime.parse(data[j].date);
      String localDate1 = DateFormat('dd-MM-yyyy').format(localDate);

      if (localDate1 == date2) {
        dateTotal = 0;

        for (int i = 0; i < data.length; i++) {
          if (data[i].categoryType == CategoryType.income &&
              data[i].category.name == type) {
            if (localDate1 ==
                DateFormat('dd-MM-yyyy').format(DateTime.parse(data[i].date))) {
              dateTotal = dateTotal + data[i].amount;
            }
          } else {}
        }
        // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
        total = total + dateTotal;
        break;
      } else {
        print('no');
      }
    }
    allTimeChart[i] = ChartData(reverseAllTimeDates[i], total);
  }

  chartData = allTimeChart;
}

allTimeCategoryButton(String type) {
  var data = TransactionDB.instance.transactionListNotifier.value;

  List<ChartData> allTimeChart = [];

  List allTimeDates = [];
  List reverseAllTimeDates = [];

  for (int j = 0; j < data.length; j++) {
    DateTime localDate = DateTime.parse(data[j].date);

    if (allTimeDates.contains(DateFormat('dd-MM-yyyy').format(localDate)) ==
        false) {
      allTimeDates.add(DateFormat('dd-MM-yyyy').format(localDate));
      allTimeChart.add(ChartData(data[j].date, 0));
    } else {}
  }
  print(allTimeDates);

  reverseAllTimeDates = List.from(allTimeDates.reversed);

  double total = 0;
  double dateTotal = 0;
  for (int i = 0; i < reverseAllTimeDates.length; i++) {
    String date2 = reverseAllTimeDates[i];

    for (int j = 0; j < data.length; j++) {
      DateTime localDate = DateTime.parse(data[j].date);
      String localDate1 = DateFormat('dd-MM-yyyy').format(localDate);

      if (localDate1 == date2) {
        dateTotal = 0;

        for (int i = 0; i < data.length; i++) {
          if (data[i].category.name == type) {
            if (localDate1 ==
                DateFormat('dd-MM-yyyy').format(DateTime.parse(data[i].date))) {
              if (data[i].categoryType == CategoryType.income) {
                dateTotal = dateTotal + data[i].amount;
              } else if (data[i].categoryType == CategoryType.expense) {
                dateTotal = dateTotal - data[i].amount;
              } else {}
            }
          }
        }
        // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
        total = total + dateTotal;
        break;
      } else {
        print('no');
      }
    }
    allTimeChart[i] = ChartData(reverseAllTimeDates[i], total);
  }

  chartData = allTimeChart;
}

dayWiseDay() {
  var data = TransactionDB.instance.transactionListNotifier.value;

  // DateTime firstDateOfCurrentMonth =
  //     DateTime.now().subtract(const Duration(days: 90));
  // selectedDate = DateFormat('dd-MM-yyyy').format(firstDateOfCurrentMonth);

  List dailyDates = [];
  DateTime selectedOne = DateFormat('dd-MM-yyyy').parse(selectedDate);
  DateTime today = DateTime.now();
  DateTime currentDate =
  DateTime(selectedOne.year, selectedOne.month, selectedOne.day);

  while (currentDate.isBefore(today) ||
      (currentDate.year == today.year &&
          currentDate.month == today.month &&
          currentDate.day == today.day)) {
    dailyDates.add(DateFormat('dd-MM-yyyy').format(currentDate));

    currentDate = currentDate.add(Duration(days: 1));
  }

  List<ChartData> dailyChart = [];

  for (int i = 0; i < dailyDates.length; i++) {
    dailyChart.add(ChartData(dailyDates[i], 0.0));
  }

  double total = 0;
  double dateTotal = 0;

  for (int i = 0; i < dailyDates.length; i++) {
    String date2 = dailyDates[i];

    for (int j = 0; j < data.length; j++) {
      DateTime localDate = DateTime.parse(data[j].date);
      String localDate1 = DateFormat('dd-MM-yyyy').format(localDate);

      if (localDate1 == date2) {
        dateTotal = 0;

        for (int i = 0; i < data.length; i++) {
          if (localDate1 ==
              DateFormat('dd-MM-yyyy').format(DateTime.parse(data[i].date))) {
            if (data[i].categoryType == CategoryType.income) {
              dateTotal = dateTotal + data[i].amount;
            } else if (data[i].categoryType == CategoryType.expense) {
              dateTotal = dateTotal - data[i].amount;
            } else {}
          }
        }
        // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
        total = total + dateTotal;
        break;
      } else {
        print('no');
      }
    }

    dailyChart[i] = ChartData(dailyDates[i], total);
  }

  chartData = dailyChart;
}

weekWiseChart() {
  var data = TransactionDB.instance.transactionListNotifier.value;

  List weeklyDates = [];
  DateTime selectedOne = DateFormat('dd-MM-yyyy').parse(selectedDate);
  DateTime todayDate = DateTime.now();

  while (selectedOne.isBefore(todayDate)) {
    weeklyDates.add(DateFormat('dd-MM-yyyy').format(selectedOne));
    selectedOne = selectedOne.add(Duration(days: 7));
  }

  // print(weeklyDates);

  List<ChartData> weekChart = [];
  for (int i = 0; i < weeklyDates.length; i++) {
    weekChart.add(ChartData(weeklyDates[i], 300));
  }

  List<ChartData> weeklyChart = [];
  for (int i = 0; i < weeklyDates.length; i++) {
    weeklyChart.add(ChartData(weeklyDates[i], 0));
  }

  // data.sort((a, b) => a.date.compareTo(b.date),);

  List myweekList = [];

  for (int i = 0; i < data.length; i++) {
    bool found = false;
    for (int j = 0; j < weeklyDates.length - 1; j++) {
      DateTime startDate = DateFormat('dd-MM-yyyy').parse(weeklyDates[j]);
      DateTime endDate = DateFormat('dd-MM-yyyy').parse(weeklyDates[j + 1]);
      DateTime date2 = DateTime.parse(data[i].date);

      if (date2.isAfter(startDate) && date2.isBefore(endDate)) {
        print(myweekList);
        print('Yes');

        double amountToAdd = data[i].categoryType == CategoryType.income
            ? data[i].amount
            : -data[i].amount;

        myweekList.add({'index': j + 1, 'amt': amountToAdd});

        // monthlyChart[j] = ChartData(
        //     monthlyDates[j + 1],
        //     data[i].amount);

        found = true;
        break;
      } else {
        print('no');
      }
    }
    if (!found) {
      print(
          'Item from list2 at index $i is not within any date range of list1.');
    }
  }

  print(myweekList);

  Map<int, double> indexAmtMap = {};
  for (var data in myweekList) {
    int index = data['index'];
    double amt = data['amt'];
    indexAmtMap[index] = (indexAmtMap[index] ?? 0) + amt;
  }

  List<Map<String, dynamic>> finalList = [];
  indexAmtMap.forEach((index, totalAmt) {
    finalList.add({'index': index, 'totalamt': totalAmt});
  });

  print(finalList);

  // for (int i = 0;
  //     i < finalList.length;
  //     i++) {
  //   weeklyChart[
  //       finalList[i]
  //           ['index']] = ChartData(
  //       weeklyDates[finalList[i]
  //           ['index']],
  //       finalList[i]['totalamt']);
  // }
  double finalTotal = 0;
  for (int k = 0; k < weeklyChart.length; k++) {
    for (int i = 0; i < finalList.length; i++) {
      if (finalList[i]['index'] == k) {
        // weeklyChart[k] = ChartData(
        //     weeklyDates[k],
        //     finalList[i]
        //         ['totalamt']);
        finalTotal = finalTotal + finalList[i]['totalamt'];
      }
    }
    DateTime dateTime = DateFormat("dd-MM-yyyy").parse(weeklyDates[k]);

    String formattedDate = DateFormat("dd-MM-yyyy").format(dateTime);

    weeklyChart[k] = ChartData(formattedDate, finalTotal);
  }

  chartData = weeklyChart;
}

monthWiseChart() {
  var data = TransactionDB.instance.transactionListNotifier.value;
  print(data);
  List monthlyDates = [];
  DateTime selectedOne = DateFormat('dd-MM-yyyy').parse(selectedDate);
  DateTime todayDate = DateTime.now();

  while (
  selectedOne.isBefore(todayDate) || selectedOne.month == todayDate.month) {
    monthlyDates.add(DateFormat('dd-MM-yyyy').format(selectedOne));
    selectedOne =
        DateTime(selectedOne.year, selectedOne.month + 1, selectedOne.day);
  }

  // print(monthlyDates);

  List<ChartData> monthlyChart = [];
  for (int i = 0; i < monthlyDates.length; i++) {
    monthlyChart.add(ChartData(monthlyDates[i], 0));
  }

  // data.sort((a, b) => a.date.compareTo(b.date),);

  List myMonthList = [];

  for (int i = 0; i < data.length; i++) {
    bool found = false;
    for (int j = 0; j < monthlyDates.length - 1; j++) {
      DateTime startDate = DateFormat('dd-MM-yyyy').parse(monthlyDates[j]);
      DateTime endDate = DateFormat('dd-MM-yyyy').parse(monthlyDates[j + 1]);
      DateTime date2 = DateTime.parse(data[i].date);

      if (date2.isAfter(startDate) && date2.isBefore(endDate)) {
        print(myMonthList);
        print('Yes');
        double amountToAdd = data[i].categoryType == CategoryType.income
            ? data[i].amount
            : -data[i].amount;

        myMonthList.add({'index': j + 1, 'amt': amountToAdd});

        // monthlyChart[j] = ChartData(
        //     monthlyDates[j + 1],
        //     data[i].amount);

        found = true;
        break;
      } else {
        print('no');
      }
    }
    if (!found) {
      print(
          'Item from list2 at index $i is not within any date range of list1.');
    }
  }

  print(myMonthList);

  Map<int, double> indexAmtMap = {};
  for (var data in myMonthList) {
    int index = data['index'];
    double amt = data['amt'];
    indexAmtMap[index] = (indexAmtMap[index] ?? 0) + amt;
  }

  List<Map<String, dynamic>> finalList = [];
  indexAmtMap.forEach((index, totalAmt) {
    finalList.add({'index': index, 'totalamt': totalAmt});
  });

  print(finalList);

  // for (int i = 0; i < finalList.length; i++) {
  //   monthlyChart[finalList[i]['index']] =
  //       ChartData(
  //           monthlyDates[finalList[i]['index']],
  //           finalList[i]['totalamt']);
  // }
  double finalTotal = 0;
  for (int k = 0; k < monthlyChart.length; k++) {
    for (int i = 0; i < finalList.length; i++) {
      if (finalList[i]['index'] == k) {
        // weeklyChart[k] = ChartData(
        //     weeklyDates[k],
        //     finalList[i]
        //         ['totalamt']);
        finalTotal = finalTotal + finalList[i]['totalamt'];
      }
    }
    DateTime dateTime = DateFormat("dd-MM-yyyy").parse(monthlyDates[k]);

    String formattedDate = DateFormat("dd-MM-yyyy").format(dateTime);

    monthlyChart[k] = ChartData(formattedDate, finalTotal);
  }

  chartData = monthlyChart;
}

yearWiseChart() {
  var data = TransactionDB.instance.transactionListNotifier.value;

  List yearlyDates = [];
  DateTime selectedOne = DateFormat('dd-MM-yyyy').parse(selectedDate);
  DateTime today = DateTime.now();
  DateTime currentDate =
  DateTime(selectedOne.year, selectedOne.month, selectedOne.day);

  while (currentDate.isBefore(today) ||
      (currentDate.year == today.year &&
          currentDate.month == today.month &&
          currentDate.day == today.day)) {
    yearlyDates.add(DateFormat('dd-MM-yyyy').format(currentDate));
    currentDate =
        DateTime(currentDate.year + 1, selectedOne.month, selectedOne.day);
  }
  // print(yearlyDates);
  List<ChartData> yearChart = [];
  for (int i = 0; i < yearlyDates.length; i++) {
    yearChart.add(ChartData(yearlyDates[i], 300));
  }

  List<ChartData> yearlyChart = [];
  for (int i = 0; i < yearlyDates.length; i++) {
    yearlyChart.add(ChartData(yearlyDates[i], 0));
  }

  // data.sort((a, b) => a.date.compareTo(b.date),);

  List myYearList = [];

  for (int i = 0; i < data.length; i++) {
    bool found = false;
    for (int j = 0; j < yearlyDates.length - 1; j++) {
      DateTime startDate = DateFormat('dd-MM-yyyy').parse(yearlyDates[j]);
      DateTime endDate = DateFormat('dd-MM-yyyy').parse(yearlyDates[j + 1]);
      DateTime date2 = DateTime.parse(data[i].date);

      if (date2.isAfter(startDate) && date2.isBefore(endDate)) {
        print(myYearList);
        print('Yes');
        double amountToAdd = data[i].categoryType == CategoryType.income
            ? data[i].amount
            : -data[i].amount;

        myYearList.add({'index': j + 1, 'amt': amountToAdd});

        // monthlyChart[j] = ChartData(
        //     monthlyDates[j + 1],
        //     data[i].amount);

        found = true;
        break;
      } else {
        print('no');
      }
    }
    if (!found) {
      print(
          'Item from list2 at index $i is not within any date range of list1.');
    }
  }

  print(myYearList);

  Map<int, double> indexAmtMap = {};
  for (var data in myYearList) {
    int index = data['index'];
    double amt = data['amt'];
    indexAmtMap[index] = (indexAmtMap[index] ?? 0) + amt;
  }

  List<Map<String, dynamic>> finalList = [];
  indexAmtMap.forEach((index, totalAmt) {
    finalList.add({'index': index, 'totalamt': totalAmt});
  });

  print(finalList);

  // for (int i = 0; i < finalList.length; i++) {
  //   yearlyChart[finalList[i]['index']] =
  //       ChartData(
  //           yearlyDates[finalList[i]['index']],
  //           finalList[i]['totalamt']);
  // }
  double finalTotal = 0;
  for (int k = 0; k < yearlyChart.length; k++) {
    for (int i = 0; i < finalList.length; i++) {
      if (finalList[i]['index'] == k) {
        // weeklyChart[k] = ChartData(
        //     weeklyDates[k],
        //     finalList[i]
        //         ['totalamt']);
        finalTotal = finalTotal + finalList[i]['totalamt'];
      }
    }
    DateTime dateTime = DateFormat("dd-MM-yyyy").parse(yearlyDates[k]);

    String formattedDate = DateFormat("dd-MM-yyyy").format(dateTime);

    yearlyChart[k] = ChartData(formattedDate, finalTotal);
  }

  chartData = yearlyChart;
}

heInit() {
  int a = -10;
  int b = -20;
  int total = a + b;
  print(total);
  chartData = [
    ChartData('01-01-2024', -12),
    ChartData('01-02-2024', -12),
    ChartData('01-03-2024', -16),
    ChartData('01-04-2024', -16),
    ChartData('01-05-2024', -16),
    ChartData('01-06-2024', -16),
    ChartData('01-07-2024', -16),
    ChartData('01-08-2024', -16),
    ChartData('01-09-2024', -16),
    ChartData('01-10-2024', -16),
    ChartData('01-11-2024', -16),
    ChartData('01-12-2024', -16),
    ChartData('01-01-2025', -16),
    ChartData('01-02-2025', -16),
  ];
}

List<CategoryModel> categoryList = [];
List categoryNameList = [];
List<TransactionModel> filterList =
    TransactionDB.instance.transactionListNotifier.value;

GlobalKey<SfCartesianChartState> chartKey = GlobalKey<SfCartesianChartState>();

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {


  var items = [
    '1 Day',
    '1 Week',
    '1 Month',
    '1 Year',
  ];


  @override
  void initState() {

    // initialize();
    // initialize1DayData();

    if(selectedCategoryIndex==0&& selectedCategory=='All'&& selected=='All'&& cycleOrAllTime=='All Time' ){
      initialize1DayDataOnlyOneTime();
    }

    getCategoryList();

    super.initState();
  }

  clearToolTip() {
    SfCartesianChart chart = chartKey.currentState!.widget;
    chart.trackballBehavior!.hide();
    setState(() {});
  }

  getCategoryList() {
    categoryNameList.clear();
    categoryList = CategoryDB().incomeCategoryNotifier.value;

    categoryNameList.add('All');
    for (int i = 0; i < categoryList.length; i++) {
      categoryNameList.add(categoryList[i].name);
    }
  }

  bool hideGridLine = false;

  double calculateInterval() {

    int numberOfDataPoints = chartData.length;

    // Assuming xAxisValues contains the dates displayed on the X-axis
    // Calculate the number of labels displayed on the X-axis
    int numberOfLabels = 10;

    // Calculate the interval based on the number of data points and labels
    int interval = (numberOfDataPoints / numberOfLabels).round();

    return double.parse(interval.toString());
  }


  @override
  Widget build(BuildContext context) {
    int labelCounter = 0;

    print("CHART LENGTH --${chartData.length}  ${calculateInterval()}");
    // print(TransactionDB.instance.transactionMonthListNotifier.value);

    final LinearGradient gradientColors =
    LinearGradient(colors: color, stops: stops);

    return Scaffold(
        backgroundColor: AppTheme.pcScafoldColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // LineChartSample2(),
              // SfChartScreen(
              //   monthChartData: monthChartDataGraph!,
              // ),

              /*         chartData.length > 20
                  ?
              SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        height: 300,
                        width: 1000,
                          child: SfCartesianChart(
                            // enableAxisAnimation: true,
                            primaryYAxis: NumericAxis(),
                            primaryXAxis: CategoryAxis(
                              maximumLabels: chartData.length,
                              labelRotation: 270,

                              labelIntersectAction: AxisLabelIntersectAction.rotate45,
                              labelStyle: TextStyle(fontSize: 12),
                              labelPlacement: LabelPlacement.onTicks,

                              // axisLabelFormatter: (axisLabelRenderArgs) {
                              //   if(dropdownvalue=='1 Year'){
                              //     DateTime dateTime = DateFormat('dd MMM yy').parse(axisLabelRenderArgs.text);
                              //
                              //     String formattedDate = DateFormat('MMM dd').format(dateTime);
                              //
                              //     return ChartAxisLabel(formattedDate,TextStyle(color: Colors.pink) );
                              //   }
                              //   else {
                              //     return ChartAxisLabel(axisLabelRenderArgs.text, TextStyle(color: Colors.yellow));
                              //   }
                              // },
                            ),
                            series: <CartesianSeries>[
                              AreaSeries<ChartData, String>(
                                  borderColor: AppTheme.contentColorCyan,
                                  borderWidth: 4,
                                  dataSource: chartData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  gradient: gradientColors),
                            ],
                          ),
                      ),
                    ):*/

              Container(
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.1),
                ),
                padding: const EdgeInsets.only(top: 10, right: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SfCartesianChart(
                  key: chartKey,
                  trackballBehavior: TrackballBehavior(
                    enable: true,

                    markerSettings: TrackballMarkerSettings(
                        height: 10,
                        width: 10,
                        // markerVisibility: TrackballVisibilityMode.visible,
                        borderColor: AppTheme.chartColor,
                        borderWidth: 4,
                        color: AppTheme.chartColor),
                    activationMode: ActivationMode.singleTap,
                    shouldAlwaysShow: true,
                    lineColor: Colors.transparent,

                    builder: (context, trackballDetails) {
                      String date = DateFormat('MMM dd yyyy').format(
                          DateFormat('dd-MM-yyyy')
                              .parse(trackballDetails.point!.x.toString()));

                      // String amount =

                      return Container(
                        alignment: Alignment.center,
                        padding:
                        EdgeInsets.only(left: (4), right: (4), top: (2)),
                        decoration: BoxDecoration(
                            color: AppTheme.chartColor.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8)),
                        width: 100,
                        height: 40,
                        // height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              date,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "${currencySymboleUpdate.value} ${trackballDetails.point!.y.toString()}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },


                  ),
                  primaryYAxis: NumericAxis(

                    majorGridLines: MajorGridLines(

                      width: 2,
                      color: Colors.grey,

                      dashArray: [2, 6],

                    ),
                    labelStyle: TextStyle(color: Colors.grey.withOpacity(0.3)),
                    axisLabelFormatter: (axisLabelRenderArgs) {
                      double doubleData =
                      double.parse(axisLabelRenderArgs.text);
                      if (doubleData.abs() >= 1000000) {
                        return ChartAxisLabel(
                            '${(doubleData / 1000000).toStringAsFixed(1)}M',
                            TextStyle());
                      } else if (doubleData.abs() >= 1000) {
                        return ChartAxisLabel(
                            '${(doubleData / 1000).toStringAsFixed(1)}k',
                            TextStyle());
                      } else {
                        return ChartAxisLabel(
                            axisLabelRenderArgs.text, TextStyle());
                      }
                    },
                  ),
                  primaryXAxis: CategoryAxis(
                    maximumLabels: chartData.length,
                    // labelRotation: 270,
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    labelPlacement: LabelPlacement.onTicks,

                    interval: chartData.length > 10?calculateInterval(): 1,
                    labelIntersectAction: AxisLabelIntersectAction.hide,

                    majorGridLines: MajorGridLines(
                        width: 2, color: Colors.grey, dashArray: [1, 5]
                    ),

                    axisLabelFormatter: (axisLabelRenderArgs) {
                      if (cycleOrAllTime == 'All Time') {
                        DateTime dateTime = DateFormat('dd-MM-yyyy')
                            .parse(axisLabelRenderArgs.text);
                        String formattedDate =
                        DateFormat('MMM dd').format(dateTime);

                        String one = formattedDate.split(' ').first;
                        String two = formattedDate.split(' ').last;

                        return ChartAxisLabel('$one\n$two',
                            TextStyle(color: Colors.grey.withOpacity(0.3)));
                      } else {
                        if (dropdownvalue == '1 Year') {
                          DateTime dateTime = DateFormat('dd-MM-yyyy')
                              .parse(axisLabelRenderArgs.text);
                          String formattedDate =
                          DateFormat('yyyy').format(dateTime);
                          return ChartAxisLabel(formattedDate,
                              TextStyle(color: Colors.grey.withOpacity(0.3),fontSize: 10));
                        } else if (dropdownvalue == '1 Day' ||
                            dropdownvalue == '1 Week') {
                          DateTime dateTime = DateFormat('dd-MM-yyyy')
                              .parse(axisLabelRenderArgs.text);
                          String formattedDate =
                          DateFormat('MMM dd').format(dateTime);

                          String one = formattedDate.split(' ').first;
                          String two = formattedDate.split(' ').last;

                          return ChartAxisLabel('$one\n$two',
                              TextStyle(color: Colors.grey.withOpacity(0.3)));
                        } else if (dropdownvalue == '1 Month') {
                          DateTime dateTime = DateFormat('dd-MM-yyyy')
                              .parse(axisLabelRenderArgs.text);
                          String formattedDate =
                          DateFormat('MMM').format(dateTime);
                          return ChartAxisLabel(formattedDate,
                              TextStyle(color: Colors.grey.withOpacity(0.3)));
                        } else {
                          return ChartAxisLabel('4',
                              TextStyle(color: Colors.grey.withOpacity(0.3)));
                        }
                      }
                    },
                  ),
                  series: <CartesianSeries>[
                    AreaSeries<ChartData, String>(
                        borderColor: AppTheme.chartColor,
                        borderWidth: 3,
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        gradient: gradientColors),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              // Center(child: Text('developing..',
              // style: TextStyle(color: AppTheme.allInColor,fontSize: 20.0),))
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              clearToolTip();
                              selected = 'All';

                              // var data = TransactionDB
                              //     .instance.transactionListNotifier.value;

                              var data = filterList;

                              /// filter

                              if (cycleOrAllTime == 'All Time') {
                                if (selectedCategory == 'All') {
                                  allTimeButton();
                                } else {
                                  allTimeCategoryButton(selectedCategory);
                                }
                              } else {
                                if (dropdownvalue == '1 Day') {
                                  List dailyDates = [];
                                  DateTime selectedOne =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(selectedDate);
                                  DateTime today = DateTime.now();
                                  DateTime currentDate = DateTime(
                                      selectedOne.year,
                                      selectedOne.month,
                                      selectedOne.day);

                                  while (currentDate.isBefore(today) ||
                                      (currentDate.year == today.year &&
                                          currentDate.month == today.month &&
                                          currentDate.day == today.day)) {
                                    dailyDates.add(DateFormat('dd-MM-yyyy')
                                        .format(currentDate));

                                    currentDate =
                                        currentDate.add(Duration(days: 1));
                                  }

                                  List<ChartData> dailyChart = [];

                                  for (int i = 0; i < dailyDates.length; i++) {
                                    dailyChart
                                        .add(ChartData(dailyDates[i], 0.0));
                                  }
                                  double total = 0;
                                  double dateTotal = 0;
                                  for (int i = 0; i < dailyDates.length; i++) {
                                    String date2 = dailyDates[i];

                                    for (int j = 0; j < data.length; j++) {
                                      DateTime localDate =
                                      DateTime.parse(data[j].date);
                                      String localDate1 =
                                      DateFormat('dd-MM-yyyy')
                                          .format(localDate);

                                      if (localDate1 == date2) {
                                        dateTotal = 0;

                                        for (int i = 0; i < data.length; i++) {
                                          if (localDate1 ==
                                              DateFormat('dd-MM-yyyy').format(
                                                  DateTime.parse(
                                                      data[i].date))) {
                                            if (data[i].categoryType ==
                                                CategoryType.income) {
                                              dateTotal =
                                                  dateTotal + data[i].amount;
                                            } else if (data[i].categoryType ==
                                                CategoryType.expense) {
                                              dateTotal =
                                                  dateTotal - data[i].amount;
                                            } else {}
                                          }
                                        }

                                        // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
                                        total = total + dateTotal;
                                        break;
                                      } else {
                                        print('no');
                                      }
                                    }

                                    dailyChart[i] =
                                        ChartData(dailyDates[i], total);
                                  }

                                  chartData = dailyChart;
                                  setState(() {});
                                } else if (dropdownvalue == '1 Week') {
                                  /*       List weeklyDates = [];
                                DateTime selectedOne = DateFormat('dd-MM-yyyy')
                                    .parse(selectedDate);
                                DateTime todayDate = DateTime.now();

                                while (selectedOne.isBefore(todayDate)) {
                                  weeklyDates.add(DateFormat('dd-MM-yyyy')
                                      .format(selectedOne));
                                  selectedOne =
                                      selectedOne.add(Duration(days: 7));
                                }

                                // print(weeklyDates);

                                List<ChartData> weekChart = [];
                                for (int i = 0; i < weeklyDates.length; i++) {
                                  weekChart.add(ChartData(weeklyDates[i], 300));
                                }

                                List<ChartData> weeklyChart = [];
                                for (int i = 0; i < weeklyDates.length; i++) {
                                  weeklyChart.add(ChartData(weeklyDates[i], 0));
                                }

                                // data.sort((a, b) => a.date.compareTo(b.date),);

                                List myweekList = [];

                                for (int i = 0; i < data.length; i++) {
                                  bool found = false;
                                  for (int j = 0;
                                      j < weeklyDates.length - 1;
                                      j++) {
                                    DateTime startDate =
                                        DateFormat('dd-MM-yyyy')
                                            .parse(weeklyDates[j]);
                                    DateTime endDate = DateFormat('dd-MM-yyyy')
                                        .parse(weeklyDates[j + 1]);
                                    DateTime date2 =
                                        DateTime.parse(data[i].date);

                                    if (date2.isAfter(startDate) &&
                                        date2.isBefore(endDate)) {
                                      print(myweekList);
                                      print('Yes');

                                      myweekList.add({
                                        'index': j + 1,
                                        'amt': data[i].amount
                                      });

                                      // monthlyChart[j] = ChartData(
                                      //     monthlyDates[j + 1],
                                      //     data[i].amount);

                                      found = true;
                                      break;
                                    } else {
                                      print('no');
                                    }
                                  }
                                  if (!found) {
                                    print(
                                        'Item from list2 at index $i is not within any date range of list1.');
                                  }
                                }

                                print(myweekList);

                                Map<int, double> indexAmtMap = {};
                                for (var data in myweekList) {
                                  int index = data['index'];
                                  double amt = data['amt'];
                                  indexAmtMap[index] =
                                      (indexAmtMap[index] ?? 0) + amt;
                                }

                                List<Map<String, dynamic>> finalList = [];
                                indexAmtMap.forEach((index, totalAmt) {
                                  finalList.add(
                                      {'index': index, 'totalamt': totalAmt});
                                });

                                print(finalList);

                                for (int i = 0; i < finalList.length; i++) {
                                  weeklyChart[finalList[i]['index']] =
                                      ChartData(
                                          weeklyDates[finalList[i]['index']],
                                          finalList[i]['totalamt']);
                                }

                                chartData = weeklyChart;
                                setState(() {});*/

                                  List weeklyDates = [];
                                  DateTime selectedOne =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(selectedDate);
                                  DateTime todayDate = DateTime.now();

                                  while (selectedOne.isBefore(todayDate)) {
                                    weeklyDates.add(DateFormat('dd-MM-yyyy')
                                        .format(selectedOne));
                                    selectedOne =
                                        selectedOne.add(Duration(days: 7));
                                  }

                                  // print(weeklyDates);

                                  List<ChartData> weekChart = [];
                                  for (int i = 0; i < weeklyDates.length; i++) {
                                    weekChart
                                        .add(ChartData(weeklyDates[i], 300));
                                  }

                                  List<ChartData> weeklyChart = [];
                                  for (int i = 0; i < weeklyDates.length; i++) {
                                    weeklyChart
                                        .add(ChartData(weeklyDates[i], 0));
                                  }

                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                  List myweekList = [];

                                  for (int i = 0; i < data.length; i++) {
                                    bool found = false;
                                    for (int j = 0;
                                    j < weeklyDates.length - 1;
                                    j++) {
                                      DateTime startDate =
                                      DateFormat('dd-MM-yyyy')
                                          .parse(weeklyDates[j]);
                                      DateTime endDate =
                                      DateFormat('dd-MM-yyyy')
                                          .parse(weeklyDates[j + 1]);
                                      DateTime date2 =
                                      DateTime.parse(data[i].date);

                                      if (date2.isAfter(startDate) &&
                                          date2.isBefore(endDate)) {
                                        print(myweekList);
                                        print('Yes');
                                        double amountToAdd =
                                        data[i].categoryType ==
                                            CategoryType.income
                                            ? data[i].amount
                                            : -data[i].amount;
                                        myweekList.add({
                                          'index': j + 1,
                                          'amt': amountToAdd
                                        });

                                        // monthlyChart[j] = ChartData(
                                        //     monthlyDates[j + 1],
                                        //     data[i].amount);

                                        found = true;
                                        break;
                                      } else {
                                        print('no');
                                      }
                                    }
                                    if (!found) {
                                      print(
                                          'Item from list2 at index $i is not within any date range of list1.');
                                    }
                                  }

                                  print(myweekList);

                                  Map<int, double> indexAmtMap = {};
                                  for (var data in myweekList) {
                                    int index = data['index'];
                                    double amt = data['amt'];
                                    indexAmtMap[index] =
                                        (indexAmtMap[index] ?? 0) + amt;
                                  }

                                  List<Map<String, dynamic>> finalList = [];
                                  indexAmtMap.forEach((index, totalAmt) {
                                    finalList.add(
                                        {'index': index, 'totalamt': totalAmt});
                                  });

                                  print(finalList);

                                  double finalTotal = 0;
                                  for (int k = 0; k < weeklyChart.length; k++) {
                                    for (int i = 0; i < finalList.length; i++) {
                                      if (finalList[i]['index'] == k) {
                                        // weeklyChart[k] = ChartData(
                                        //     weeklyDates[k],
                                        //     finalList[i]
                                        //         ['totalamt']);

                                        finalTotal = finalTotal +
                                            finalList[i]['totalamt'];
                                      }
                                    }
                                    DateTime dateTime = DateFormat("dd-MM-yyyy")
                                        .parse(weeklyDates[k]);

                                    String formattedDate =
                                    DateFormat("dd-MM-yyyy")
                                        .format(dateTime);

                                    weeklyChart[k] =
                                        ChartData(formattedDate, finalTotal);
                                  }

                                  chartData = weeklyChart;
                                  setState(() {});
                                } else if (dropdownvalue == '1 Month') {
                                  print(data);
                                  List monthlyDates = [];
                                  DateTime selectedOne =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(selectedDate);
                                  DateTime todayDate = DateTime.now();

                                  while (selectedOne.isBefore(todayDate) ||
                                      selectedOne.month == todayDate.month) {
                                    monthlyDates.add(DateFormat('dd-MM-yyyy')
                                        .format(selectedOne));
                                    selectedOne = DateTime(selectedOne.year,
                                        selectedOne.month + 1, selectedOne.day);
                                  }

                                  // print(monthlyDates);

                                  List<ChartData> monthlyChart = [];
                                  for (int i = 0;
                                  i < monthlyDates.length;
                                  i++) {
                                    monthlyChart
                                        .add(ChartData(monthlyDates[i], 0));
                                  }

                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                  List myMonthList = [];

                                  for (int i = 0; i < data.length; i++) {
                                    bool found = false;
                                    for (int j = 0;
                                    j < monthlyDates.length - 1;
                                    j++) {
                                      DateTime startDate =
                                      DateFormat('dd-MM-yyyy')
                                          .parse(monthlyDates[j]);
                                      DateTime endDate =
                                      DateFormat('dd-MM-yyyy')
                                          .parse(monthlyDates[j + 1]);
                                      DateTime date2 =
                                      DateTime.parse(data[i].date);

                                      if (date2.isAfter(startDate) &&
                                          date2.isBefore(endDate)) {
                                        print(myMonthList);
                                        print('Yes');
                                        double amountToAdd =
                                        data[i].categoryType ==
                                            CategoryType.income
                                            ? data[i].amount
                                            : -data[i].amount;

                                        myMonthList.add({
                                          'index': j + 1,
                                          'amt': amountToAdd
                                        });

                                        // monthlyChart[j] = ChartData(
                                        //     monthlyDates[j + 1],
                                        //     data[i].amount);

                                        found = true;
                                        break;
                                      } else {
                                        print('no');
                                      }
                                    }
                                    if (!found) {
                                      print(
                                          'Item from list2 at index $i is not within any date range of list1.');
                                    }
                                  }

                                  print(myMonthList);

                                  Map<int, double> indexAmtMap = {};
                                  for (var data in myMonthList) {
                                    int index = data['index'];
                                    double amt = data['amt'];
                                    indexAmtMap[index] =
                                        (indexAmtMap[index] ?? 0) + amt;
                                  }

                                  List<Map<String, dynamic>> finalList = [];
                                  indexAmtMap.forEach((index, totalAmt) {
                                    finalList.add(
                                        {'index': index, 'totalamt': totalAmt});
                                  });

                                  print(finalList);

                                  // for (int i = 0; i < finalList.length; i++) {
                                  //   monthlyChart[finalList[i]['index']] =
                                  //       ChartData(
                                  //           monthlyDates[finalList[i]['index']],
                                  //           finalList[i]['totalamt']);
                                  // }
                                  double finalTotal = 0;
                                  for (int k = 0;
                                  k < monthlyChart.length;
                                  k++) {
                                    for (int i = 0; i < finalList.length; i++) {
                                      if (finalList[i]['index'] == k) {
                                        // weeklyChart[k] = ChartData(
                                        //     weeklyDates[k],
                                        //     finalList[i]
                                        //         ['totalamt']);
                                        finalTotal = finalTotal +
                                            finalList[i]['totalamt'];
                                      }
                                    }
                                    DateTime dateTime = DateFormat("dd-MM-yyyy")
                                        .parse(monthlyDates[k]);

                                    String formattedDate =
                                    DateFormat("dd-MM-yyyy")
                                        .format(dateTime);

                                    monthlyChart[k] =
                                        ChartData(formattedDate, finalTotal);
                                  }

                                  chartData = monthlyChart;

                                  setState(() {});
                                } else if (dropdownvalue == '1 Year') {
                                  List yearlyDates = [];
                                  DateTime selectedOne =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(selectedDate);
                                  DateTime today = DateTime.now();
                                  DateTime currentDate = DateTime(
                                      selectedOne.year,
                                      selectedOne.month,
                                      selectedOne.day);

                                  while (currentDate.isBefore(today) ||
                                      (currentDate.year == today.year &&
                                          currentDate.month == today.month &&
                                          currentDate.day == today.day)) {
                                    yearlyDates.add(DateFormat('dd-MM-yyyy')
                                        .format(currentDate));
                                    currentDate = DateTime(currentDate.year + 1,
                                        selectedOne.month, selectedOne.day);
                                  }
                                  // print(yearlyDates);
                                  List<ChartData> yearChart = [];
                                  for (int i = 0; i < yearlyDates.length; i++) {
                                    yearChart
                                        .add(ChartData(yearlyDates[i], 300));
                                  }

                                  List<ChartData> yearlyChart = [];
                                  for (int i = 0; i < yearlyDates.length; i++) {
                                    yearlyChart
                                        .add(ChartData(yearlyDates[i], 0));
                                  }

                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                  List myYearList = [];

                                  for (int i = 0; i < data.length; i++) {
                                    bool found = false;
                                    for (int j = 0;
                                    j < yearlyDates.length - 1;
                                    j++) {
                                      DateTime startDate =
                                      DateFormat('dd-MM-yyyy')
                                          .parse(yearlyDates[j]);
                                      DateTime endDate =
                                      DateFormat('dd-MM-yyyy')
                                          .parse(yearlyDates[j + 1]);
                                      DateTime date2 =
                                      DateTime.parse(data[i].date);

                                      if (date2.isAfter(startDate) &&
                                          date2.isBefore(endDate)) {
                                        print(myYearList);
                                        print('Yes');
                                        double amountToAdd =
                                        data[i].categoryType ==
                                            CategoryType.income
                                            ? data[i].amount
                                            : -data[i].amount;

                                        myYearList.add({
                                          'index': j + 1,
                                          'amt': amountToAdd
                                        });

                                        // monthlyChart[j] = ChartData(
                                        //     monthlyDates[j + 1],
                                        //     data[i].amount);

                                        found = true;
                                        break;
                                      } else {
                                        print('no');
                                      }
                                    }
                                    if (!found) {
                                      print(
                                          'Item from list2 at index $i is not within any date range of list1.');
                                    }
                                  }

                                  print(myYearList);

                                  Map<int, double> indexAmtMap = {};
                                  for (var data in myYearList) {
                                    int index = data['index'];
                                    double amt = data['amt'];
                                    indexAmtMap[index] =
                                        (indexAmtMap[index] ?? 0) + amt;
                                  }

                                  List<Map<String, dynamic>> finalList = [];
                                  indexAmtMap.forEach((index, totalAmt) {
                                    finalList.add(
                                        {'index': index, 'totalamt': totalAmt});
                                  });

                                  print(finalList);

                                  // for (int i = 0; i < finalList.length; i++) {
                                  //   yearlyChart[finalList[i]['index']] =
                                  //       ChartData(
                                  //           yearlyDates[finalList[i]['index']],
                                  //           finalList[i]['totalamt']);
                                  // }
                                  double finalTotal = 0;
                                  for (int k = 0; k < yearlyChart.length; k++) {
                                    for (int i = 0; i < finalList.length; i++) {
                                      if (finalList[i]['index'] == k) {
                                        // weeklyChart[k] = ChartData(
                                        //     weeklyDates[k],
                                        //     finalList[i]
                                        //         ['totalamt']);
                                        finalTotal = finalTotal +
                                            finalList[i]['totalamt'];
                                      }
                                    }
                                    DateTime dateTime = DateFormat("dd-MM-yyyy")
                                        .parse(yearlyDates[k]);

                                    String formattedDate =
                                    DateFormat("dd-MM-yyyy")
                                        .format(dateTime);

                                    yearlyChart[k] =
                                        ChartData(formattedDate, finalTotal);
                                  }

                                  chartData = yearlyChart;

                                  setState(() {});
                                }
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: selected == 'All'
                                  ? Colors.white.withOpacity(0.1)
                                  : Colors.transparent,
                            ),
                            child: Text(
                              'All',
                              style: TextStyle(
                                  color: selected == 'All'
                                      ? Colors.white
                                      : Colors.black38,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            clearToolTip();

                            selected = 'Expense';

                            var data = TransactionDB
                                .instance.transactionListNotifier.value;
                            data = filterList;

                            /// filter

                            if (cycleOrAllTime == 'All Time') {
                              if (selectedCategory == 'All') {
                                allTimeExpenseButton();
                              } else {
                                allTimeExpenseButtonWithCategory(
                                    selectedCategory);
                              }

                              setState(() {});
                            } else {
                              if (dropdownvalue == '1 Day') {
                                List dailyDates = [];
                                DateTime selectedOne = DateFormat('dd-MM-yyyy')
                                    .parse(selectedDate);
                                DateTime today = DateTime.now();
                                DateTime currentDate = DateTime(
                                    selectedOne.year,
                                    selectedOne.month,
                                    selectedOne.day);

                                while (currentDate.isBefore(today) ||
                                    (currentDate.year == today.year &&
                                        currentDate.month == today.month &&
                                        currentDate.day == today.day)) {
                                  dailyDates.add(DateFormat('dd-MM-yyyy')
                                      .format(currentDate));

                                  currentDate =
                                      currentDate.add(Duration(days: 1));
                                }

                                List<ChartData> dailyChart = [];

                                for (int i = 0; i < dailyDates.length; i++) {
                                  dailyChart.add(ChartData(dailyDates[i], 0.0));
                                }
                                double total = -0;
                                double dateTotal = -0;
                                for (int i = 0; i < dailyDates.length; i++) {
                                  String date2 = dailyDates[i];

                                  for (int j = 0; j < data.length; j++) {
                                    DateTime localDate =
                                    DateTime.parse(data[j].date);
                                    String localDate1 = DateFormat('dd-MM-yyyy')
                                        .format(localDate);

                                    if (localDate1 == date2) {
                                      dateTotal = -0;

                                      for (int i = 0; i < data.length; i++) {
                                        if (data[i].categoryType ==
                                            CategoryType.expense) {
                                          if (localDate1 ==
                                              DateFormat('dd-MM-yyyy').format(
                                                  DateTime.parse(
                                                      data[i].date))) {
                                            dateTotal =
                                                dateTotal - data[i].amount;
                                          } else {}
                                        } else {}
                                      }

                                      // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
                                      total = total + dateTotal;
                                      break;
                                    } else {
                                      print('no');
                                    }
                                  }

                                  dailyChart[i] =
                                      ChartData(dailyDates[i], total);
                                }

                                chartData = dailyChart;

                                setState(() {});

                                /*            List dailyDates = [];
                              DateTime selectedOne =
                                  DateFormat('dd-MM-yyyy').parse(selectedDate);
                              DateTime today = DateTime.now();
                              DateTime currentDate = DateTime(selectedOne.year,
                                  selectedOne.month, selectedOne.day);

                              while (currentDate.isBefore(today) ||
                                  (currentDate.year == today.year &&
                                      currentDate.month == today.month &&
                                      currentDate.day == today.day)) {
                                dailyDates.add(DateFormat('dd-MM-yyyy')
                                    .format(currentDate));
                                currentDate =
                                    currentDate.add(Duration(days: 1));
                              }

                              List<ChartData> dailyChart = [];
                              for (int i = 0; i < dailyDates.length; i++) {
                                dailyChart.add(ChartData(dailyDates[i], 0.0));
                              }

                              for (int i = 0; i < dailyDates.length; i++) {
                                String date2 = dailyDates[i];
                                for (int j = 0; j < data.length; j++) {
                                  DateTime localDate =
                                      DateTime.parse(data[j].date);
                                  String localDate1 = DateFormat('dd-MM-yyyy')
                                      .format(localDate);

                                  if (localDate1 == date2) {
                                    double dateTotal = 0;

                                    for (int i = 0; i < data.length; i++) {
                                      if (localDate1 ==
                                          DateFormat('dd-MM-yyyy').format(
                                              DateTime.parse(data[i].date))) {
                                        if (data[i].categoryType ==
                                            CategoryType.expense) {
                                          dateTotal =
                                              dateTotal + data[i].amount;
                                        }
                                      }
                                    }

                                    dailyChart[i] =
                                        ChartData(dailyDates[i], dateTotal);
                                    break;
                                  } else {
                                    print('no');
                                  }
                                }
                              }



                              chartData = dailyChart;
                              setState(() {});*/
                              } else if (dropdownvalue == '1 Week') {
                                List weeklyDates = [];
                                DateTime selectedOne = DateFormat('dd-MM-yyyy')
                                    .parse(selectedDate);
                                DateTime todayDate = DateTime.now();

                                while (selectedOne.isBefore(todayDate)) {
                                  weeklyDates.add(DateFormat('dd-MM-yyyy')
                                      .format(selectedOne));
                                  selectedOne =
                                      selectedOne.add(Duration(days: 7));
                                }

                                // print(weeklyDates);

                                List<ChartData> weekChart = [];
                                for (int i = 0; i < weeklyDates.length; i++) {
                                  weekChart.add(ChartData(weeklyDates[i], 300));
                                }

                                List<ChartData> weeklyChart = [];
                                for (int i = 0; i < weeklyDates.length; i++) {
                                  weeklyChart.add(ChartData(weeklyDates[i], 0));
                                }

                                // data.sort((a, b) => a.date.compareTo(b.date),);

                                List myweekList = [];

                                for (int i = 0; i < data.length; i++) {
                                  if (data[i].categoryType ==
                                      CategoryType.expense) {
                                    bool found = false;
                                    for (int j = 0;
                                    j < weeklyDates.length - 1;
                                    j++) {
                                      DateTime startDate =
                                      DateFormat('dd-MM-yyyy')
                                          .parse(weeklyDates[j]);
                                      DateTime endDate =
                                      DateFormat('dd-MM-yyyy')
                                          .parse(weeklyDates[j + 1]);
                                      DateTime date2 =
                                      DateTime.parse(data[i].date);

                                      if (date2.isAfter(startDate) &&
                                          date2.isBefore(endDate)) {
                                        print(myweekList);
                                        print('Yes');

                                        myweekList.add({
                                          'index': j + 1,
                                          'amt': data[i].amount
                                        });

                                        // monthlyChart[j] = ChartData(
                                        //     monthlyDates[j + 1],
                                        //     data[i].amount);

                                        found = true;
                                        break;
                                      } else {
                                        print('no');
                                      }
                                    }
                                    if (!found) {
                                      print(
                                          'Item from list2 at index $i is not within any date range of list1.');
                                    }
                                  }
                                }

                                print(myweekList);

                                Map<int, double> indexAmtMap = {};
                                for (var data in myweekList) {
                                  int index = data['index'];
                                  double amt = data['amt'];
                                  indexAmtMap[index] =
                                      (indexAmtMap[index] ?? 0) + amt;
                                }

                                List<Map<String, dynamic>> finalList = [];
                                indexAmtMap.forEach((index, totalAmt) {
                                  finalList.add(
                                      {'index': index, 'totalamt': totalAmt});
                                });

                                print(finalList);

                                // for (int i = 0;
                                //     i < finalList.length;
                                //     i++) {
                                //   weeklyChart[
                                //       finalList[i]
                                //           ['index']] = ChartData(
                                //       weeklyDates[finalList[i]
                                //           ['index']],
                                //       finalList[i]['totalamt']);
                                // }
                                double finalTotal = -0;
                                for (int k = 0; k < weeklyChart.length; k++) {
                                  for (int i = 0; i < finalList.length; i++) {
                                    if (finalList[i]['index'] == k) {
                                      // weeklyChart[k] = ChartData(
                                      //     weeklyDates[k],
                                      //     finalList[i]
                                      //         ['totalamt']);
                                      finalTotal =
                                          finalTotal - finalList[i]['totalamt'];
                                    }
                                  }
                                  DateTime dateTime = DateFormat("dd-MM-yyyy")
                                      .parse(weeklyDates[k]);

                                  String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(dateTime);

                                  weeklyChart[k] =
                                      ChartData(formattedDate, finalTotal);
                                }

                                chartData = weeklyChart;
                                setState(() {});
                              } else if (dropdownvalue == '1 Month') {
                                print(data);
                                List monthlyDates = [];
                                DateTime selectedOne = DateFormat('dd-MM-yyyy')
                                    .parse(selectedDate);
                                DateTime todayDate = DateTime.now();

                                while (selectedOne.isBefore(todayDate) ||
                                    selectedOne.month == todayDate.month) {
                                  monthlyDates.add(DateFormat('dd-MM-yyyy')
                                      .format(selectedOne));
                                  selectedOne = DateTime(selectedOne.year,
                                      selectedOne.month + 1, selectedOne.day);
                                }

                                // print(monthlyDates);

                                List<ChartData> monthlyChart = [];
                                for (int i = 0; i < monthlyDates.length; i++) {
                                  monthlyChart
                                      .add(ChartData(monthlyDates[i], 0));
                                }

                                // data.sort((a, b) => a.date.compareTo(b.date),);

                                List myMonthList = [];

                                for (int i = 0; i < data.length; i++) {
                                  if (data[i].categoryType ==
                                      CategoryType.expense) {
                                    bool found = false;
                                    for (int j = 0;
                                    j < monthlyDates.length - 1;
                                    j++) {
                                      DateTime startDate =
                                      DateFormat('dd-MM-yyyy')
                                          .parse(monthlyDates[j]);
                                      DateTime endDate =
                                      DateFormat('dd-MM-yyyy')
                                          .parse(monthlyDates[j + 1]);
                                      DateTime date2 =
                                      DateTime.parse(data[i].date);

                                      if (date2.isAfter(startDate) &&
                                          date2.isBefore(endDate)) {
                                        print(myMonthList);
                                        print('Yes');

                                        myMonthList.add({
                                          'index': j + 1,
                                          'amt': data[i].amount
                                        });

                                        // monthlyChart[j] = ChartData(
                                        //     monthlyDates[j + 1],
                                        //     data[i].amount);

                                        found = true;
                                        break;
                                      } else {
                                        print('no');
                                      }
                                    }
                                    if (!found) {
                                      print(
                                          'Item from list2 at index $i is not within any date range of list1.');
                                    }
                                  }
                                }

                                print(myMonthList);

                                Map<int, double> indexAmtMap = {};
                                for (var data in myMonthList) {
                                  int index = data['index'];
                                  double amt = data['amt'];
                                  indexAmtMap[index] =
                                      (indexAmtMap[index] ?? 0) + amt;
                                }

                                List<Map<String, dynamic>> finalList = [];
                                indexAmtMap.forEach((index, totalAmt) {
                                  finalList.add(
                                      {'index': index, 'totalamt': totalAmt});
                                });

                                print(finalList);

                                // for (int i = 0; i < finalList.length; i++) {
                                //   monthlyChart[finalList[i]['index']] =
                                //       ChartData(
                                //           monthlyDates[finalList[i]['index']],
                                //           finalList[i]['totalamt']);
                                // }
                                double finalTotal = -0;
                                for (int k = 0; k < monthlyChart.length; k++) {
                                  for (int i = 0; i < finalList.length; i++) {
                                    if (finalList[i]['index'] == k) {
                                      // weeklyChart[k] = ChartData(
                                      //     weeklyDates[k],
                                      //     finalList[i]
                                      //         ['totalamt']);
                                      finalTotal =
                                          finalTotal - finalList[i]['totalamt'];
                                    }
                                  }
                                  DateTime dateTime = DateFormat("dd-MM-yyyy")
                                      .parse(monthlyDates[k]);

                                  String formattedDate =
                                  DateFormat("dd-MM-yyyy").format(dateTime);

                                  monthlyChart[k] =
                                      ChartData(formattedDate, finalTotal);
                                }

                                chartData = monthlyChart;
                                setState(() {});
                              } else if (dropdownvalue == '1 Year') {
                                List yearlyDates = [];
                                DateTime selectedOne = DateFormat('dd-MM-yyyy')
                                    .parse(selectedDate);
                                DateTime today = DateTime.now();
                                DateTime currentDate = DateTime(
                                    selectedOne.year,
                                    selectedOne.month,
                                    selectedOne.day);

                                while (currentDate.isBefore(today) ||
                                    (currentDate.year == today.year &&
                                        currentDate.month == today.month &&
                                        currentDate.day == today.day)) {
                                  yearlyDates.add(DateFormat('dd-MM-yyyy')
                                      .format(currentDate));
                                  currentDate = DateTime(currentDate.year + 1,
                                      selectedOne.month, selectedOne.day);
                                }
                                // print(yearlyDates);
                                List<ChartData> yearChart = [];
                                for (int i = 0; i < yearlyDates.length; i++) {
                                  yearChart.add(ChartData(yearlyDates[i], 300));
                                }

                                List<ChartData> yearlyChart = [];
                                for (int i = 0; i < yearlyDates.length; i++) {
                                  yearlyChart.add(ChartData(yearlyDates[i], 0));
                                }

                                // data.sort((a, b) => a.date.compareTo(b.date),);

                                List myYearList = [];

                                for (int i = 0; i < data.length; i++) {
                                  if (data[i].categoryType ==
                                      CategoryType.expense) {
                                    bool found = false;
                                    for (int j = 0;
                                    j < yearlyDates.length - 1;
                                    j++) {
                                      DateTime startDate =
                                      DateFormat('dd-MM-yyyy')
                                          .parse(yearlyDates[j]);
                                      DateTime endDate =
                                      DateFormat('dd-MM-yyyy')
                                          .parse(yearlyDates[j + 1]);
                                      DateTime date2 =
                                      DateTime.parse(data[i].date);

                                      if (date2.isAfter(startDate) &&
                                          date2.isBefore(endDate)) {
                                        print(myYearList);
                                        print('Yes');

                                        myYearList.add({
                                          'index': j + 1,
                                          'amt': data[i].amount
                                        });

                                        // monthlyChart[j] = ChartData(
                                        //     monthlyDates[j + 1],
                                        //     data[i].amount);

                                        found = true;
                                        break;
                                      } else {
                                        print('no');
                                      }
                                    }
                                    if (!found) {
                                      print(
                                          'Item from list2 at index $i is not within any date range of list1.');
                                    }
                                  }
                                }

                                print(myYearList);

                                Map<int, double> indexAmtMap = {};
                                for (var data in myYearList) {
                                  int index = data['index'];
                                  double amt = data['amt'];
                                  indexAmtMap[index] =
                                      (indexAmtMap[index] ?? 0) + amt;
                                }

                                List<Map<String, dynamic>> finalList = [];
                                indexAmtMap.forEach((index, totalAmt) {
                                  finalList.add(
                                      {'index': index, 'totalamt': totalAmt});
                                });

                                print(finalList);

                                // for (int i = 0; i < finalList.length; i++) {
                                //   yearlyChart[finalList[i]['index']] =
                                //       ChartData(
                                //           yearlyDates[finalList[i]['index']],
                                //           finalList[i]['totalamt']);
                                // }

                                double finalTotal = -0;
                                for (int k = 0; k < yearlyChart.length; k++) {
                                  for (int i = 0; i < finalList.length; i++) {
                                    if (finalList[i]['index'] == k) {
                                      // weeklyChart[k] = ChartData(
                                      //     weeklyDates[k],
                                      //     finalList[i]
                                      //         ['totalamt']);
                                      finalTotal =
                                          finalTotal - finalList[i]['totalamt'];
                                    }
                                  }
                                  DateTime dateTime = DateFormat("dd-MM-yyyy")
                                      .parse(yearlyDates[k]);

                                  String formattedDate =
                                  DateFormat("dd-MM-yyyy").format(dateTime);

                                  yearlyChart[k] =
                                      ChartData(formattedDate, finalTotal);
                                }

                                chartData = yearlyChart;

                                setState(() {});
                              }
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: selected == "Expense"
                                  ? Colors.white.withOpacity(0.1)
                                  : Colors.transparent,
                            ),
                            child: Text(
                              'Expense',
                              style: TextStyle(
                                  color: selected == "Expense"
                                      ? Colors.white
                                      : Colors.black38,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            clearToolTip();
                            setState(() {
                              selected = 'Income';
                              var data = TransactionDB
                                  .instance.transactionListNotifier.value;
                              data = filterList;

                              /// filter
                              if (cycleOrAllTime == 'All Time') {
                                if (selectedCategory == 'All') {
                                  allTimeIncomeButton();
                                } else {
                                  allTimeIncomeButtonWithCategory(
                                      selectedCategory);
                                }

                                setState(() {});
                              } else {
                                if (dropdownvalue == '1 Day') {
                                  List dailyDates = [];
                                  DateTime selectedOne =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(selectedDate);
                                  DateTime today = DateTime.now();

                                  DateTime currentDate = DateTime(
                                      selectedOne.year,
                                      selectedOne.month,
                                      selectedOne.day);

                                  while (currentDate.isBefore(today) ||
                                      (currentDate.year == today.year &&
                                          currentDate.month == today.month &&
                                          currentDate.day == today.day)) {
                                    dailyDates.add(DateFormat('dd-MM-yyyy')
                                        .format(currentDate));

                                    currentDate =
                                        currentDate.add(Duration(days: 1));
                                  }

                                  List<ChartData> dailyChart = [];

                                  for (int i = 0; i < dailyDates.length; i++) {
                                    dailyChart
                                        .add(ChartData(dailyDates[i], 0.0));
                                  }
                                  double total = 0;
                                  double dateTotal = 0;
                                  for (int i = 0; i < dailyDates.length; i++) {
                                    String date2 = dailyDates[i];

                                    for (int j = 0; j < data.length; j++) {
                                      DateTime localDate =
                                      DateTime.parse(data[j].date);
                                      String localDate1 =
                                      DateFormat('dd-MM-yyyy')
                                          .format(localDate);

                                      if (localDate1 == date2) {
                                        dateTotal = 0;

                                        for (int i = 0; i < data.length; i++) {
                                          if (data[i].categoryType ==
                                              CategoryType.income) {
                                            if (localDate1 ==
                                                DateFormat('dd-MM-yyyy').format(
                                                    DateTime.parse(
                                                        data[i].date))) {
                                              dateTotal =
                                                  dateTotal + data[i].amount;
                                            } else {}
                                          } else {}
                                        }

                                        // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
                                        total = total + dateTotal;
                                        break;
                                      } else {
                                        print('no');
                                      }
                                    }

                                    dailyChart[i] =
                                        ChartData(dailyDates[i], total);
                                  }

                                  chartData = dailyChart;

                                  setState(() {});
                                } else if (dropdownvalue == '1 Week') {
                                  /*                         List weeklyDates = [];
                                DateTime selectedOne = DateFormat('dd-MM-yyyy')
                                    .parse(selectedDate);
                                DateTime todayDate = DateTime.now();

                                while (selectedOne.isBefore(todayDate)) {
                                  weeklyDates.add(DateFormat('dd-MM-yyyy')
                                      .format(selectedOne));
                                  selectedOne =
                                      selectedOne.add(Duration(days: 7));
                                }

                                // print(weeklyDates);

                                List<ChartData> weekChart = [];
                                for (int i = 0; i < weeklyDates.length; i++) {
                                  weekChart.add(ChartData(weeklyDates[i], 300));
                                }

                                List<ChartData> weeklyChart = [];
                                for (int i = 0; i < weeklyDates.length; i++) {
                                  weeklyChart.add(ChartData(weeklyDates[i], 0));
                                }

                                // data.sort((a, b) => a.date.compareTo(b.date),);

                                List myweekList = [];

                                for (int i = 0; i < data.length; i++) {
                                  if (data[i].categoryType ==
                                      CategoryType.income) {
                                    bool found = false;
                                    for (int j = 0;
                                        j < weeklyDates.length - 1;
                                        j++) {
                                      DateTime startDate =
                                          DateFormat('dd-MM-yyyy')
                                              .parse(weeklyDates[j]);
                                      DateTime endDate =
                                          DateFormat('dd-MM-yyyy')
                                              .parse(weeklyDates[j + 1]);
                                      DateTime date2 =
                                          DateTime.parse(data[i].date);

                                      if (date2.isAfter(startDate) &&
                                          date2.isBefore(endDate)) {
                                        print(myweekList);
                                        print('Yes');

                                        myweekList.add({
                                          'index': j + 1,
                                          'amt': data[i].amount
                                        });

                                        // monthlyChart[j] = ChartData(
                                        //     monthlyDates[j + 1],
                                        //     data[i].amount);

                                        found = true;
                                        break;
                                      } else {
                                        print('no');
                                      }
                                    }
                                    if (!found) {
                                      print(
                                          'Item from list2 at index $i is not within any date range of list1.');
                                    }
                                  }
                                }

                                print(myweekList);

                                Map<int, double> indexAmtMap = {};
                                for (var data in myweekList) {
                                  int index = data['index'];
                                  double amt = data['amt'];

                                  indexAmtMap[index] =
                                      (indexAmtMap[index] ?? 0) + amt;
                                }

                                List<Map<String, dynamic>> finalList = [];
                                indexAmtMap.forEach((index, totalAmt) {
                                  finalList.add(
                                      {'index': index, 'totalamt': totalAmt});
                                });

                                print(finalList);

                                for (int i = 0; i < finalList.length; i++) {
                                  weeklyChart[finalList[i]['index']] =
                                      ChartData(
                                          weeklyDates[finalList[i]['index']],
                                          finalList[i]['totalamt']);
                                }

                                chartData = weeklyChart;
                                setState(() {});*/
                                  List weeklyDates = [];
                                  DateTime selectedOne =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(selectedDate);
                                  DateTime todayDate = DateTime.now();

                                  while (selectedOne.isBefore(todayDate)) {
                                    weeklyDates.add(DateFormat('dd-MM-yyyy')
                                        .format(selectedOne));
                                    selectedOne =
                                        selectedOne.add(Duration(days: 7));
                                  }

                                  // print(weeklyDates);

                                  List<ChartData> weekChart = [];
                                  for (int i = 0; i < weeklyDates.length; i++) {
                                    weekChart
                                        .add(ChartData(weeklyDates[i], 300));
                                  }

                                  List<ChartData> weeklyChart = [];
                                  for (int i = 0; i < weeklyDates.length; i++) {
                                    weeklyChart
                                        .add(ChartData(weeklyDates[i], 0));
                                  }

                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                  List myweekList = [];

                                  for (int i = 0; i < data.length; i++) {
                                    if (data[i].categoryType ==
                                        CategoryType.income) {
                                      bool found = false;
                                      for (int j = 0;
                                      j < weeklyDates.length - 1;
                                      j++) {
                                        DateTime startDate =
                                        DateFormat('dd-MM-yyyy')
                                            .parse(weeklyDates[j]);
                                        DateTime endDate =
                                        DateFormat('dd-MM-yyyy')
                                            .parse(weeklyDates[j + 1]);
                                        DateTime date2 =
                                        DateTime.parse(data[i].date);

                                        if (date2.isAfter(startDate) &&
                                            date2.isBefore(endDate)) {
                                          print(myweekList);
                                          print('Yes');

                                          myweekList.add({
                                            'index': j + 1,
                                            'amt': data[i].amount
                                          });

                                          // monthlyChart[j] = ChartData(
                                          //     monthlyDates[j + 1],
                                          //     data[i].amount);

                                          found = true;
                                          break;
                                        } else {
                                          print('no');
                                        }
                                      }
                                      if (!found) {
                                        print(
                                            'Item from list2 at index $i is not within any date range of list1.');
                                      }
                                    }
                                  }

                                  print(myweekList);

                                  Map<int, double> indexAmtMap = {};
                                  for (var data in myweekList) {
                                    int index = data['index'];
                                    double amt = data['amt'];
                                    indexAmtMap[index] =
                                        (indexAmtMap[index] ?? 0) + amt;
                                  }

                                  List<Map<String, dynamic>> finalList = [];
                                  indexAmtMap.forEach((index, totalAmt) {
                                    finalList.add(
                                        {'index': index, 'totalamt': totalAmt});
                                  });

                                  print(finalList);

                                  // for (int i = 0;
                                  //     i < finalList.length;
                                  //     i++) {
                                  //   weeklyChart[
                                  //       finalList[i]
                                  //           ['index']] = ChartData(
                                  //       weeklyDates[finalList[i]
                                  //           ['index']],
                                  //       finalList[i]['totalamt']);
                                  // }
                                  double finalTotal = 0;
                                  for (int k = 0; k < weeklyChart.length; k++) {
                                    for (int i = 0; i < finalList.length; i++) {
                                      if (finalList[i]['index'] == k) {
                                        // weeklyChart[k] = ChartData(
                                        //     weeklyDates[k],
                                        //     finalList[i]
                                        //         ['totalamt']);
                                        finalTotal = finalTotal +
                                            finalList[i]['totalamt'];
                                      }
                                    }
                                    DateTime dateTime = DateFormat("dd-MM-yyyy")
                                        .parse(weeklyDates[k]);

                                    String formattedDate =
                                    DateFormat("dd-MM-yyyy")
                                        .format(dateTime);

                                    weeklyChart[k] =
                                        ChartData(formattedDate, finalTotal);
                                  }

                                  chartData = weeklyChart;
                                  setState(() {});
                                } else if (dropdownvalue == '1 Month') {
                                  print(data);
                                  List monthlyDates = [];
                                  DateTime selectedOne =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(selectedDate);
                                  DateTime todayDate = DateTime.now();

                                  while (selectedOne.isBefore(todayDate) ||
                                      selectedOne.month == todayDate.month) {
                                    monthlyDates.add(DateFormat('dd-MM-yyyy')
                                        .format(selectedOne));
                                    selectedOne = DateTime(selectedOne.year,
                                        selectedOne.month + 1, selectedOne.day);
                                  }

                                  // print(monthlyDates);

                                  List<ChartData> monthlyChart = [];
                                  for (int i = 0;
                                  i < monthlyDates.length;
                                  i++) {
                                    monthlyChart
                                        .add(ChartData(monthlyDates[i], 0));
                                  }

                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                  List myMonthList = [];

                                  for (int i = 0; i < data.length; i++) {
                                    if (data[i].categoryType ==
                                        CategoryType.income) {
                                      bool found = false;
                                      for (int j = 0;
                                      j < monthlyDates.length - 1;
                                      j++) {
                                        DateTime startDate =
                                        DateFormat('dd-MM-yyyy')
                                            .parse(monthlyDates[j]);
                                        DateTime endDate =
                                        DateFormat('dd-MM-yyyy')
                                            .parse(monthlyDates[j + 1]);
                                        DateTime date2 =
                                        DateTime.parse(data[i].date);

                                        if (date2.isAfter(startDate) &&
                                            date2.isBefore(endDate)) {
                                          print(myMonthList);
                                          print('Yes');

                                          myMonthList.add({
                                            'index': j + 1,
                                            'amt': data[i].amount
                                          });

                                          // monthlyChart[j] = ChartData(
                                          //     monthlyDates[j + 1],
                                          //     data[i].amount);

                                          found = true;
                                          break;
                                        } else {
                                          print('no');
                                        }
                                      }
                                      if (!found) {
                                        print(
                                            'Item from list2 at index $i is not within any date range of list1.');
                                      }
                                    }
                                  }

                                  print(myMonthList);

                                  Map<int, double> indexAmtMap = {};
                                  for (var data in myMonthList) {
                                    int index = data['index'];
                                    double amt = data['amt'];
                                    indexAmtMap[index] =
                                        (indexAmtMap[index] ?? 0) + amt;
                                  }

                                  List<Map<String, dynamic>> finalList = [];
                                  indexAmtMap.forEach((index, totalAmt) {
                                    finalList.add(
                                        {'index': index, 'totalamt': totalAmt});
                                  });

                                  print(finalList);

                                  // for (int i = 0; i < finalList.length; i++) {
                                  //   monthlyChart[finalList[i]['index']] =
                                  //       ChartData(
                                  //           monthlyDates[finalList[i]['index']],
                                  //           finalList[i]['totalamt']);
                                  // }
                                  double finalTotal = 0;
                                  for (int k = 0;
                                  k < monthlyChart.length;
                                  k++) {
                                    for (int i = 0; i < finalList.length; i++) {
                                      if (finalList[i]['index'] == k) {
                                        // weeklyChart[k] = ChartData(
                                        //     weeklyDates[k],
                                        //     finalList[i]
                                        //         ['totalamt']);
                                        finalTotal = finalTotal +
                                            finalList[i]['totalamt'];
                                      }
                                    }
                                    DateTime dateTime = DateFormat("dd-MM-yyyy")
                                        .parse(monthlyDates[k]);

                                    String formattedDate =
                                    DateFormat("dd-MM-yyyy")
                                        .format(dateTime);

                                    monthlyChart[k] =
                                        ChartData(formattedDate, finalTotal);
                                  }

                                  chartData = monthlyChart;
                                  setState(() {});
                                } else if (dropdownvalue == '1 Year') {
                                  List yearlyDates = [];
                                  DateTime selectedOne =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(selectedDate);
                                  DateTime today = DateTime.now();
                                  DateTime currentDate = DateTime(
                                      selectedOne.year,
                                      selectedOne.month,
                                      selectedOne.day);

                                  while (currentDate.isBefore(today) ||
                                      (currentDate.year == today.year &&
                                          currentDate.month == today.month &&
                                          currentDate.day == today.day)) {
                                    yearlyDates.add(DateFormat('dd-MM-yyyy')
                                        .format(currentDate));
                                    currentDate = DateTime(currentDate.year + 1,
                                        selectedOne.month, selectedOne.day);
                                  }
                                  // print(yearlyDates);
                                  List<ChartData> yearChart = [];
                                  for (int i = 0; i < yearlyDates.length; i++) {
                                    yearChart
                                        .add(ChartData(yearlyDates[i], 300));
                                  }

                                  List<ChartData> yearlyChart = [];
                                  for (int i = 0; i < yearlyDates.length; i++) {
                                    yearlyChart
                                        .add(ChartData(yearlyDates[i], 0));
                                  }

                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                  List myYearList = [];

                                  for (int i = 0; i < data.length; i++) {
                                    if (data[i].categoryType ==
                                        CategoryType.income) {
                                      bool found = false;
                                      for (int j = 0;
                                      j < yearlyDates.length - 1;
                                      j++) {
                                        DateTime startDate =
                                        DateFormat('dd-MM-yyyy')
                                            .parse(yearlyDates[j]);
                                        DateTime endDate =
                                        DateFormat('dd-MM-yyyy')
                                            .parse(yearlyDates[j + 1]);
                                        DateTime date2 =
                                        DateTime.parse(data[i].date);

                                        if (date2.isAfter(startDate) &&
                                            date2.isBefore(endDate)) {
                                          print(myYearList);
                                          print('Yes');

                                          myYearList.add({
                                            'index': j + 1,
                                            'amt': data[i].amount
                                          });

                                          // monthlyChart[j] = ChartData(
                                          //     monthlyDates[j + 1],
                                          //     data[i].amount);

                                          found = true;
                                          break;
                                        } else {
                                          print('no');
                                        }
                                      }
                                      if (!found) {
                                        print(
                                            'Item from list2 at index $i is not within any date range of list1.');
                                      }
                                    }
                                  }

                                  print(myYearList);

                                  Map<int, double> indexAmtMap = {};
                                  for (var data in myYearList) {
                                    int index = data['index'];
                                    double amt = data['amt'];
                                    indexAmtMap[index] =
                                        (indexAmtMap[index] ?? 0) + amt;
                                  }

                                  List<Map<String, dynamic>> finalList = [];
                                  indexAmtMap.forEach((index, totalAmt) {
                                    finalList.add(
                                        {'index': index, 'totalamt': totalAmt});
                                  });

                                  print(finalList);

                                  // for (int i = 0; i < finalList.length; i++) {
                                  //   yearlyChart[finalList[i]['index']] =
                                  //       ChartData(
                                  //           yearlyDates[finalList[i]['index']],
                                  //           finalList[i]['totalamt']);
                                  // }

                                  double finalTotal = 0;
                                  for (int k = 0; k < yearlyChart.length; k++) {
                                    for (int i = 0; i < finalList.length; i++) {
                                      if (finalList[i]['index'] == k) {
                                        // weeklyChart[k] = ChartData(
                                        //     weeklyDates[k],
                                        //     finalList[i]
                                        //         ['totalamt']);
                                        finalTotal = finalTotal +
                                            finalList[i]['totalamt'];
                                      }
                                    }
                                    DateTime dateTime = DateFormat("dd-MM-yyyy")
                                        .parse(yearlyDates[k]);

                                    String formattedDate =
                                    DateFormat("dd-MM-yyyy")
                                        .format(dateTime);

                                    yearlyChart[k] =
                                        ChartData(formattedDate, finalTotal);
                                  }

                                  chartData = yearlyChart;

                                  setState(() {});
                                }
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: selected == 'Income'
                                  ? Colors.white.withOpacity(0.1)
                                  : Colors.transparent,
                            ),
                            child: Text(
                              'Income',
                              style: TextStyle(
                                  color: selected == 'Income'
                                      ? Colors.white
                                      : Colors.black38,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              var data = TransactionDB
                                  .instance.transactionListNotifier.value;

                              print(data);

                              return StatefulBuilder(
                                  builder: (context, update) {
                                    return Container(
                                      height: 420.0,
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                        padding: EdgeInsets.all(20.0),
                                        decoration: BoxDecoration(
                                          color: AppTheme.pcPopUpColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Select Period',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 20),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 1,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selected = 'All';
                                                  cycleOrAllTime = 'All Time';
                                                  // allTimeButton(filterList);

                                                  if (selectedCategory == 'All') {
                                                    allTimeButton();
                                                  } else {
                                                    allTimeCategoryButton(
                                                        selectedCategory);
                                                  }
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                  cycleOrAllTime == 'All Time'
                                                      ? Colors.white
                                                      .withOpacity(0.2)
                                                      : Colors.transparent,
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 0.5),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                    7,
                                                  ),
                                                ),
                                                alignment: Alignment.center,
                                                height: 50,
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(
                                                      Icons.grid_view,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'All Time',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                cycleOrAllTime = 'Cycle';
                                                update.call(
                                                      () {},
                                                );
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: cycleOrAllTime == 'Cycle'
                                                      ? Colors.white
                                                      .withOpacity(0.2)
                                                      : Colors.transparent,
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 0.5),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                    7,
                                                  ),
                                                ),
                                                alignment: Alignment.center,
                                                height: 200,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.autorenew_rounded,
                                                          color: Colors.white,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Cycle',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              fontSize: 18),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          'Every',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                              fontSize: 16),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        DropdownButton(
                                                          // Initial Value
                                                          value: dropdownvalue,
                                                          dropdownColor:
                                                          Colors.black,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              fontSize: 18),
                                                          // Down Arrow Icon
                                                          icon: const Icon(Icons
                                                              .keyboard_arrow_down),

                                                          // Array list of items
                                                          items: items
                                                              .map((String items) {
                                                            return DropdownMenuItem(
                                                              value: items,
                                                              child: Text(items),
                                                            );
                                                          }).toList(),
                                                          // After selecting the desired option,it will
                                                          // change button value to selected value
                                                          onChanged:
                                                              (String? newValue) {
                                                            setState(() {
                                                              cycleOrAllTime =
                                                              'Cycle';
                                                              print(cycleOrAllTime);
                                                              dropdownvalue =
                                                              newValue!;
                                                            });
                                                            update.call(
                                                                  () {},
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          'beginning',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                              fontSize: 16),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () async {
                                                            cycleOrAllTime =
                                                            'Cycle';
                                                            update.call(
                                                                  () {},
                                                            );
                                                            final DateTime? date =
                                                            await showDatePicker(
                                                              context: context,
                                                              builder:
                                                                  (context, child) {
                                                                return Theme(
                                                                  data: ThemeData.dark().copyWith(
                                                                      colorScheme: const ColorScheme
                                                                          .dark(
                                                                          onPrimary:
                                                                          AppTheme
                                                                              .pcAppBarColor,
                                                                          onSurface:
                                                                          AppTheme
                                                                              .pcTextSecondayColor,
                                                                          primary:
                                                                          AppTheme
                                                                              .pcTextTertiaryColor),
                                                                      dialogBackgroundColor:
                                                                      AppTheme
                                                                          .pcAppBarColor),
                                                                  child: child!,
                                                                );
                                                              },
                                                              initialDate:
                                                              DateTime.now(),
                                                              firstDate:
                                                              DateTime(1950),
                                                              lastDate:
                                                              DateTime.now(),
                                                            );
                                                            if (date != null) {
                                                              selectedDate =
                                                                  DateFormat(
                                                                      'dd-MM-yyyy')
                                                                      .format(date);
                                                              setState(() {});
                                                              update.call(
                                                                    () {},
                                                              );
                                                            }
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                selectedDate,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontSize: 18),
                                                              ),
                                                              Container(
                                                                height: 1,
                                                                color: Colors.white,
                                                                width: 100,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        cycleOrAllTime = 'Cycle';

                                                        // var data = TransactionDB.instance.transactionMonthListNotifier.value;

                                                        selected = 'All';
                                                        data = filterList;

                                                        /// filter

                                                        print(data);

                                                        if (dropdownvalue ==
                                                            '1 Week') {
                                                          List weeklyDates = [];
                                                          DateTime selectedOne =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              selectedDate);
                                                          DateTime todayDate =
                                                          DateTime.now();

                                                          while (
                                                          selectedOne.isBefore(
                                                              todayDate)) {
                                                            weeklyDates.add(DateFormat(
                                                                'dd-MM-yyyy')
                                                                .format(
                                                                selectedOne));
                                                            selectedOne =
                                                                selectedOne.add(
                                                                    Duration(
                                                                        days: 7));
                                                          }

                                                          // print(weeklyDates);

                                                          List<ChartData>
                                                          weekChart = [];
                                                          for (int i = 0;
                                                          i <
                                                              weeklyDates
                                                                  .length;
                                                          i++) {
                                                            weekChart.add(ChartData(
                                                                weeklyDates[i],
                                                                300));
                                                          }

                                                          List<ChartData>
                                                          weeklyChart = [];
                                                          for (int i = 0;
                                                          i <
                                                              weeklyDates
                                                                  .length;
                                                          i++) {
                                                            weeklyChart.add(
                                                                ChartData(
                                                                    weeklyDates[i],
                                                                    0));
                                                          }

                                                          // data.sort((a, b) => a.date.compareTo(b.date),);

                                                          List myweekList = [];

                                                          for (int i = 0;
                                                          i < data.length;
                                                          i++) {
                                                            bool found = false;
                                                            for (int j = 0;
                                                            j <
                                                                weeklyDates
                                                                    .length -
                                                                    1;
                                                            j++) {
                                                              DateTime startDate =
                                                              DateFormat(
                                                                  'dd-MM-yyyy')
                                                                  .parse(
                                                                  weeklyDates[
                                                                  j]);
                                                              DateTime endDate =
                                                              DateFormat(
                                                                  'dd-MM-yyyy')
                                                                  .parse(
                                                                  weeklyDates[
                                                                  j + 1]);
                                                              DateTime date2 =
                                                              DateTime.parse(
                                                                  data[i].date);

                                                              if (date2.isAfter(
                                                                  startDate) &&
                                                                  date2.isBefore(
                                                                      endDate)) {
                                                                print(myweekList);
                                                                print('Yes');
                                                                double amountToAdd =
                                                                data[i].categoryType ==
                                                                    CategoryType
                                                                        .income
                                                                    ? data[i]
                                                                    .amount
                                                                    : -data[i]
                                                                    .amount;

                                                                myweekList.add({
                                                                  'index': j + 1,
                                                                  'amt': amountToAdd
                                                                });

                                                                // monthlyChart[j] = ChartData(
                                                                //     monthlyDates[j + 1],
                                                                //     data[i].amount);

                                                                found = true;
                                                                break;
                                                              } else {
                                                                print('no');
                                                              }
                                                            }
                                                            if (!found) {
                                                              print(
                                                                  'Item from list2 at index $i is not within any date range of list1.');
                                                            }
                                                          }

                                                          print(myweekList);

                                                          Map<int, double>
                                                          indexAmtMap = {};
                                                          for (var data
                                                          in myweekList) {
                                                            int index =
                                                            data['index'];
                                                            double amt =
                                                            data['amt'];
                                                            indexAmtMap[index] =
                                                                (indexAmtMap[
                                                                index] ??
                                                                    0) +
                                                                    amt;
                                                          }

                                                          List<Map<String, dynamic>>
                                                          finalList = [];
                                                          indexAmtMap.forEach(
                                                                  (index, totalAmt) {
                                                                finalList.add({
                                                                  'index': index,
                                                                  'totalamt': totalAmt
                                                                });
                                                              });

                                                          print(finalList);

                                                          // for (int i = 0;
                                                          //     i < finalList.length;
                                                          //     i++) {
                                                          //   weeklyChart[
                                                          //       finalList[i]
                                                          //           ['index']] = ChartData(
                                                          //       weeklyDates[finalList[i]
                                                          //           ['index']],
                                                          //       finalList[i]['totalamt']);
                                                          // }
                                                          double finalTotal = 0;
                                                          for (int k = 0;
                                                          k <
                                                              weeklyChart
                                                                  .length;
                                                          k++) {
                                                            for (int i = 0;
                                                            i <
                                                                finalList
                                                                    .length;
                                                            i++) {
                                                              if (finalList[i]
                                                              ['index'] ==
                                                                  k) {
                                                                // weeklyChart[k] = ChartData(
                                                                //     weeklyDates[k],
                                                                //     finalList[i]
                                                                //         ['totalamt']);
                                                                finalTotal =
                                                                    finalTotal +
                                                                        finalList[i]
                                                                        [
                                                                        'totalamt'];
                                                              }
                                                            }
                                                            DateTime dateTime =
                                                            DateFormat(
                                                                "dd-MM-yyyy")
                                                                .parse(
                                                                weeklyDates[
                                                                k]);

                                                            String formattedDate =
                                                            DateFormat(
                                                                "dd-MM-yyyy")
                                                                .format(
                                                                dateTime);

                                                            weeklyChart[k] =
                                                                ChartData(
                                                                    formattedDate,
                                                                    finalTotal);
                                                          }

                                                          chartData = weeklyChart;
                                                          setState(() {});
                                                        } else if (dropdownvalue ==
                                                            '1 Month') {
                                                          print(data);
                                                          List monthlyDates = [];
                                                          DateTime selectedOne =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              selectedDate);
                                                          DateTime todayDate =
                                                          DateTime.now();

                                                          while (selectedOne
                                                              .isBefore(
                                                              todayDate) ||
                                                              selectedOne.month ==
                                                                  todayDate.month) {
                                                            monthlyDates.add(
                                                                DateFormat(
                                                                    'dd-MM-yyyy')
                                                                    .format(
                                                                    selectedOne));
                                                            selectedOne = DateTime(
                                                                selectedOne.year,
                                                                selectedOne.month +
                                                                    1,
                                                                selectedOne.day);
                                                          }

                                                          // print(monthlyDates);

                                                          List<ChartData>
                                                          monthlyChart = [];
                                                          for (int i = 0;
                                                          i <
                                                              monthlyDates
                                                                  .length;
                                                          i++) {
                                                            monthlyChart.add(
                                                                ChartData(
                                                                    monthlyDates[i],
                                                                    0));
                                                          }

                                                          // data.sort((a, b) => a.date.compareTo(b.date),);

                                                          List myMonthList = [];

                                                          for (int i = 0;
                                                          i < data.length;
                                                          i++) {
                                                            bool found = false;
                                                            for (int j = 0;
                                                            j <
                                                                monthlyDates
                                                                    .length -
                                                                    1;
                                                            j++) {
                                                              DateTime startDate =
                                                              DateFormat(
                                                                  'dd-MM-yyyy')
                                                                  .parse(
                                                                  monthlyDates[
                                                                  j]);
                                                              DateTime endDate = DateFormat(
                                                                  'dd-MM-yyyy')
                                                                  .parse(
                                                                  monthlyDates[
                                                                  j + 1]);
                                                              DateTime date2 =
                                                              DateTime.parse(
                                                                  data[i].date);

                                                              if (date2.isAfter(
                                                                  startDate) &&
                                                                  date2.isBefore(
                                                                      endDate)) {
                                                                print(myMonthList);
                                                                print('Yes');
                                                                double amountToAdd =
                                                                data[i].categoryType ==
                                                                    CategoryType
                                                                        .income
                                                                    ? data[i]
                                                                    .amount
                                                                    : -data[i]
                                                                    .amount;

                                                                myMonthList.add({
                                                                  'index': j + 1,
                                                                  'amt': amountToAdd
                                                                });

                                                                // monthlyChart[j] = ChartData(
                                                                //     monthlyDates[j + 1],
                                                                //     data[i].amount);

                                                                found = true;
                                                                break;
                                                              } else {
                                                                print('no');
                                                              }
                                                            }
                                                            if (!found) {
                                                              print(
                                                                  'Item from list2 at index $i is not within any date range of list1.');
                                                            }
                                                          }

                                                          print(myMonthList);

                                                          Map<int, double>
                                                          indexAmtMap = {};
                                                          for (var data
                                                          in myMonthList) {
                                                            int index =
                                                            data['index'];
                                                            double amt =
                                                            data['amt'];
                                                            indexAmtMap[index] =
                                                                (indexAmtMap[
                                                                index] ??
                                                                    0) +
                                                                    amt;
                                                          }

                                                          List<Map<String, dynamic>>
                                                          finalList = [];
                                                          indexAmtMap.forEach(
                                                                  (index, totalAmt) {
                                                                finalList.add({
                                                                  'index': index,
                                                                  'totalamt': totalAmt
                                                                });
                                                              });

                                                          print(finalList);

                                                          // for (int i = 0;
                                                          //     i < finalList.length;
                                                          //     i++) {
                                                          //   monthlyChart[
                                                          //       finalList[i]
                                                          //           ['index']] = ChartData(
                                                          //       monthlyDates[finalList[i]
                                                          //           ['index']],
                                                          //       finalList[i]['totalamt']);
                                                          // }
                                                          double finalTotal = 0;
                                                          for (int k = 0;
                                                          k <
                                                              monthlyChart
                                                                  .length;
                                                          k++) {
                                                            for (int i = 0;
                                                            i <
                                                                finalList
                                                                    .length;
                                                            i++) {
                                                              if (finalList[i]
                                                              ['index'] ==
                                                                  k) {
                                                                // weeklyChart[k] = ChartData(
                                                                //     weeklyDates[k],
                                                                //     finalList[i]
                                                                //         ['totalamt']);
                                                                finalTotal =
                                                                    finalTotal +
                                                                        finalList[i]
                                                                        [
                                                                        'totalamt'];
                                                              }
                                                            }
                                                            DateTime dateTime =
                                                            DateFormat(
                                                                "dd-MM-yyyy")
                                                                .parse(
                                                                monthlyDates[
                                                                k]);

                                                            String formattedDate =
                                                            DateFormat(
                                                                "dd-MM-yyyy")
                                                                .format(
                                                                dateTime);

                                                            monthlyChart[k] =
                                                                ChartData(
                                                                    formattedDate,
                                                                    finalTotal);
                                                          }

                                                          chartData = monthlyChart;
                                                          setState(() {});
                                                        } else if (dropdownvalue ==
                                                            '1 Year') {
                                                          List yearlyDates = [];
                                                          DateTime selectedOne =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              selectedDate);
                                                          DateTime today =
                                                          DateTime.now();
                                                          DateTime currentDate =
                                                          DateTime(
                                                              selectedOne.year,
                                                              selectedOne.month,
                                                              selectedOne.day);

                                                          while (currentDate
                                                              .isBefore(
                                                              today) ||
                                                              (currentDate.year ==
                                                                  today.year &&
                                                                  currentDate
                                                                      .month ==
                                                                      today.month &&
                                                                  currentDate.day ==
                                                                      today.day)) {
                                                            yearlyDates.add(DateFormat(
                                                                'dd-MM-yyyy')
                                                                .format(
                                                                currentDate));
                                                            currentDate = DateTime(
                                                                currentDate.year +
                                                                    1,
                                                                selectedOne.month,
                                                                selectedOne.day);
                                                          }
                                                          // print(yearlyDates);
                                                          List<ChartData>
                                                          yearChart = [];
                                                          for (int i = 0;
                                                          i <
                                                              yearlyDates
                                                                  .length;
                                                          i++) {
                                                            yearChart.add(ChartData(
                                                                yearlyDates[i],
                                                                300));
                                                          }

                                                          List<ChartData>
                                                          yearlyChart = [];
                                                          for (int i = 0;
                                                          i <
                                                              yearlyDates
                                                                  .length;
                                                          i++) {
                                                            yearlyChart.add(
                                                                ChartData(
                                                                    yearlyDates[i],
                                                                    0));
                                                          }

                                                          // data.sort((a, b) => a.date.compareTo(b.date),);

                                                          List myYearList = [];

                                                          for (int i = 0;
                                                          i < data.length;
                                                          i++) {
                                                            bool found = false;
                                                            for (int j = 0;
                                                            j <
                                                                yearlyDates
                                                                    .length -
                                                                    1;
                                                            j++) {
                                                              DateTime startDate =
                                                              DateFormat(
                                                                  'dd-MM-yyyy')
                                                                  .parse(
                                                                  yearlyDates[
                                                                  j]);
                                                              DateTime endDate =
                                                              DateFormat(
                                                                  'dd-MM-yyyy')
                                                                  .parse(
                                                                  yearlyDates[
                                                                  j + 1]);
                                                              DateTime date2 =
                                                              DateTime.parse(
                                                                  data[i].date);

                                                              if (date2.isAfter(
                                                                  startDate) &&
                                                                  date2.isBefore(
                                                                      endDate)) {
                                                                print(myYearList);
                                                                print('Yes');
                                                                double amountToAdd =
                                                                data[i].categoryType ==
                                                                    CategoryType
                                                                        .income
                                                                    ? data[i]
                                                                    .amount
                                                                    : -data[i]
                                                                    .amount;

                                                                myYearList.add({
                                                                  'index': j + 1,
                                                                  'amt': amountToAdd
                                                                });

                                                                // monthlyChart[j] = ChartData(
                                                                //     monthlyDates[j + 1],
                                                                //     data[i].amount);

                                                                found = true;
                                                                break;
                                                              } else {
                                                                print('no');
                                                              }
                                                            }
                                                            if (!found) {
                                                              print(
                                                                  'Item from list2 at index $i is not within any date range of list1.');
                                                            }
                                                          }

                                                          print(myYearList);

                                                          Map<int, double>
                                                          indexAmtMap = {};
                                                          for (var data
                                                          in myYearList) {
                                                            int index =
                                                            data['index'];
                                                            double amt =
                                                            data['amt'];
                                                            indexAmtMap[index] =
                                                                (indexAmtMap[
                                                                index] ??
                                                                    0) +
                                                                    amt;
                                                          }

                                                          List<Map<String, dynamic>>
                                                          finalList = [];
                                                          indexAmtMap.forEach(
                                                                  (index, totalAmt) {
                                                                finalList.add({
                                                                  'index': index,
                                                                  'totalamt': totalAmt
                                                                });
                                                              });

                                                          print(finalList);

                                                          // for (int i = 0;
                                                          //     i < finalList.length;
                                                          //     i++) {
                                                          //   yearlyChart[
                                                          //       finalList[i]
                                                          //           ['index']] = ChartData(
                                                          //       yearlyDates[finalList[i]
                                                          //           ['index']],
                                                          //       finalList[i]['totalamt']);
                                                          // }

                                                          double finalTotal = 0;
                                                          for (int k = 0;
                                                          k <
                                                              yearlyChart
                                                                  .length;
                                                          k++) {
                                                            for (int i = 0;
                                                            i <
                                                                finalList
                                                                    .length;
                                                            i++) {
                                                              if (finalList[i]
                                                              ['index'] ==
                                                                  k) {
                                                                // weeklyChart[k] = ChartData(
                                                                //     weeklyDates[k],
                                                                //     finalList[i]
                                                                //         ['totalamt']);
                                                                finalTotal =
                                                                    finalTotal +
                                                                        finalList[i]
                                                                        [
                                                                        'totalamt'];
                                                              }
                                                            }
                                                            DateTime dateTime =
                                                            DateFormat(
                                                                "dd-MM-yyyy")
                                                                .parse(
                                                                yearlyDates[
                                                                k]);

                                                            String formattedDate =
                                                            DateFormat(
                                                                "dd-MM-yyyy")
                                                                .format(
                                                                dateTime);

                                                            yearlyChart[k] =
                                                                ChartData(
                                                                    formattedDate,
                                                                    finalTotal);
                                                          }

                                                          chartData = yearlyChart;

                                                          setState(() {});
                                                        } else if (dropdownvalue ==
                                                            '1 Day') {
                                                          List dailyDates = [];
                                                          DateTime selectedOne =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              selectedDate);
                                                          DateTime today =
                                                          DateTime.now();
                                                          DateTime currentDate =
                                                          DateTime(
                                                              selectedOne.year,
                                                              selectedOne.month,
                                                              selectedOne.day);

                                                          while (currentDate
                                                              .isBefore(
                                                              today) ||
                                                              (currentDate.year ==
                                                                  today.year &&
                                                                  currentDate
                                                                      .month ==
                                                                      today.month &&
                                                                  currentDate.day ==
                                                                      today.day)) {
                                                            dailyDates.add(DateFormat(
                                                                'dd-MM-yyyy')
                                                                .format(
                                                                currentDate));

                                                            currentDate =
                                                                currentDate.add(
                                                                    Duration(
                                                                        days: 1));
                                                          }

                                                          List<ChartData>
                                                          dailyChart = [];

                                                          for (int i = 0;
                                                          i < dailyDates.length;
                                                          i++) {
                                                            dailyChart.add(
                                                                ChartData(
                                                                    dailyDates[i],
                                                                    0.0));
                                                          }
                                                          double total = 0;
                                                          double dateTotal = 0;
                                                          for (int i = 0;
                                                          i < dailyDates.length;
                                                          i++) {
                                                            String date2 =
                                                            dailyDates[i];

                                                            for (int j = 0;
                                                            j < data.length;
                                                            j++) {
                                                              DateTime localDate =
                                                              DateTime.parse(
                                                                  data[j].date);
                                                              String localDate1 =
                                                              DateFormat(
                                                                  'dd-MM-yyyy')
                                                                  .format(
                                                                  localDate);

                                                              if (localDate1 ==
                                                                  date2) {
                                                                dateTotal = 0;

                                                                for (int i = 0;
                                                                i < data.length;
                                                                i++) {
                                                                  if (localDate1 ==
                                                                      DateFormat(
                                                                          'dd-MM-yyyy')
                                                                          .format(DateTime.parse(
                                                                          data[i]
                                                                              .date))) {
                                                                    if (data[i]
                                                                        .categoryType ==
                                                                        CategoryType
                                                                            .income) {
                                                                      dateTotal =
                                                                          dateTotal +
                                                                              data[i]
                                                                                  .amount;
                                                                    } else if (data[
                                                                    i]
                                                                        .categoryType ==
                                                                        CategoryType
                                                                            .expense) {
                                                                      dateTotal =
                                                                          dateTotal -
                                                                              data[i]
                                                                                  .amount;
                                                                    } else {}
                                                                  }
                                                                }

                                                                // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
                                                                total = total +
                                                                    dateTotal;
                                                                break;
                                                              } else {
                                                                print('no');
                                                              }
                                                            }

                                                            dailyChart[i] =
                                                                ChartData(
                                                                    dailyDates[i],
                                                                    total);
                                                          }

                                                          chartData = dailyChart;
                                                          setState(() {});
                                                        }

                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                          color: Colors.white
                                                              .withOpacity(0.2),
                                                          border: Border.all(
                                                              color: Colors.white,
                                                              width: 0.5),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                            7,
                                                          ),
                                                        ),
                                                        alignment: Alignment.center,
                                                        height: 30,
                                                        child: Text(
                                                          'Done',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          );
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.replay_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              cycleOrAllTime == 'Cycle'
                                  ? Text(
                                dropdownvalue,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              )
                                  : Text(
                                'All Time',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            var transactionData = TransactionDB
                                .instance.transactionListNotifier.value;
                            print(transactionData);

                            return StatefulBuilder(
                              builder: (context, update) {
                                return Container(
                                  height: 180.0,
                                  width: MediaQuery.of(context).size.width,
                                  child: Container(
                                    padding: EdgeInsets.all(20.0),
                                    decoration: const BoxDecoration(
                                      color: AppTheme.pcPopUpColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        const Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Filter',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 1,
                                          color: Colors.white,
                                        ),

                                        // const SizedBox(
                                        //   height: 10,
                                        // ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.center,
                                        //   children: [
                                        //     GestureDetector(
                                        //       onTap: () {
                                        //         selectedCategory = 'All Time';
                                        //         filterList = TransactionDB.instance
                                        //             .transactionListNotifier.value;
                                        //         setState(() {});
                                        //         Navigator.pop(context);
                                        //       },
                                        //       child: Container(
                                        //         width: 120,
                                        //         decoration: BoxDecoration(
                                        //           color:
                                        //               Colors.white.withOpacity(0.2),
                                        //           border: Border.all(
                                        //               color: Colors.white,
                                        //               width: 0.5),
                                        //           borderRadius:
                                        //               BorderRadius.circular(
                                        //             7,
                                        //           ),
                                        //         ),
                                        //         alignment: Alignment.center,
                                        //         height: 40,
                                        //         child: Text(
                                        //           'All Time',
                                        //           style: TextStyle(
                                        //               color: Colors.white,
                                        //               fontWeight: FontWeight.w500,
                                        //               fontSize: 16),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),

                                        SizedBox(
                                          height: 10,
                                        ),

                                        /*           Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              List<TransactionModel>
                                                  cashTransaction = [];
                                              for (int i = 0;
                                                  i < transactionData.length;
                                                  i++) {
                                                if (transactionData[i]
                                                        .category
                                                        .name ==
                                                    'Cash') {
                                                  cashTransaction
                                                      .add(transactionData[i]);
                                                } else {}
                                              }
                                              filterList = cashTransaction;

                                              var data = filterList;
                                              selectedCategory = 'Cash';

                                              selected = 'All';

                                              if (cycleOrAllTime == 'All Time') {
                                                allTimeCategoryButton(
                                                    'Cash', filterList);
                                              }
                                              else {
                                                if (dropdownvalue == '1 Day') {
                                                  List dailyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime today = DateTime.now();
                                                  DateTime currentDate = DateTime(
                                                      selectedOne.year,
                                                      selectedOne.month,
                                                      selectedOne.day);

                                                  while (currentDate
                                                          .isBefore(today) ||
                                                      (currentDate.year ==
                                                              today.year &&
                                                          currentDate.month ==
                                                              today.month &&
                                                          currentDate.day ==
                                                              today.day)) {
                                                    dailyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(currentDate));

                                                    currentDate = currentDate
                                                        .add(Duration(days: 1));
                                                  }

                                                  List<ChartData> dailyChart = [];

                                                  for (int i = 0;
                                                      i < dailyDates.length;
                                                      i++) {
                                                    dailyChart.add(ChartData(
                                                        dailyDates[i], 0.0));
                                                  }
                                                  double total = 0;
                                                  double dateTotal = 0;
                                                  for (int i = 0;
                                                      i < dailyDates.length;
                                                      i++) {
                                                    String date2 = dailyDates[i];

                                                    for (int j = 0;
                                                        j < data.length;
                                                        j++) {
                                                      DateTime localDate =
                                                          DateTime.parse(
                                                              data[j].date);
                                                      String localDate1 =
                                                          DateFormat('dd-MM-yyyy')
                                                              .format(localDate);

                                                      if (localDate1 == date2) {
                                                        dateTotal = 0;

                                                        for (int i = 0;
                                                            i < data.length;
                                                            i++) {
                                                          if (localDate1 ==
                                                              DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(DateTime
                                                                      .parse(data[
                                                                              i]
                                                                          .date))) {
                                                            if(data[i].categoryType== CategoryType.income){
                                                              dateTotal = dateTotal + data[i].amount;
                                                            }

                                                            else if(data[i].categoryType== CategoryType.expense){
                                                              dateTotal = dateTotal - data[i].amount;

                                                            }
                                                            else {}
                                                          }
                                                        }

                                                        // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
                                                        total = total + dateTotal;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }

                                                    dailyChart[i] = ChartData(
                                                        dailyDates[i], total);
                                                  }

                                                  chartData = dailyChart;
                                                  setState(() {});
                                                } else if (dropdownvalue ==
                                                    '1 Week') {
                                                  List weeklyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime todayDate =
                                                      DateTime.now();

                                                  while (selectedOne
                                                      .isBefore(todayDate)) {
                                                    weeklyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(selectedOne));
                                                    selectedOne = selectedOne
                                                        .add(Duration(days: 7));
                                                  }

                                                  // print(weeklyDates);

                                                  List<ChartData> weekChart = [];
                                                  for (int i = 0;
                                                      i < weeklyDates.length;
                                                      i++) {
                                                    weekChart.add(ChartData(
                                                        weeklyDates[i], 300));
                                                  }

                                                  List<ChartData> weeklyChart =
                                                      [];
                                                  for (int i = 0;
                                                      i < weeklyDates.length;
                                                      i++) {
                                                    weeklyChart.add(ChartData(
                                                        weeklyDates[i], 0));
                                                  }

                                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                                  List myweekList = [];

                                                  for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                    bool found = false;
                                                    for (int j = 0;
                                                        j <
                                                            weeklyDates.length -
                                                                1;
                                                        j++) {
                                                      DateTime startDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(
                                                                  weeklyDates[j]);
                                                      DateTime endDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(weeklyDates[
                                                                  j + 1]);
                                                      DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                      if (date2.isAfter(
                                                              startDate) &&
                                                          date2.isBefore(
                                                              endDate)) {
                                                        print(myweekList);
                                                        print('Yes');
                                                        double amountToAdd = data[i].categoryType == CategoryType.income ? data[i].amount : -data[i].amount;

                                                        myweekList.add({
                                                          'index': j + 1,
                                                          'amt': amountToAdd
                                                        });

                                                        // monthlyChart[j] = ChartData(
                                                        //     monthlyDates[j + 1],
                                                        //     data[i].amount);

                                                        found = true;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }
                                                    if (!found) {
                                                      print(
                                                          'Item from list2 at index $i is not within any date range of list1.');
                                                    }
                                                  }

                                                  print(myweekList);

                                                  Map<int, double> indexAmtMap =
                                                      {};
                                                  for (var data in myweekList) {
                                                    int index = data['index'];
                                                    double amt = data['amt'];
                                                    indexAmtMap[index] =
                                                        (indexAmtMap[index] ??
                                                                0) +
                                                            amt;
                                                  }

                                                  List<Map<String, dynamic>>
                                                      finalList = [];
                                                  indexAmtMap
                                                      .forEach((index, totalAmt) {
                                                    finalList.add({
                                                      'index': index,
                                                      'totalamt': totalAmt
                                                    });
                                                  });

                                                  print(finalList);

                                                  double finalTotal = 0;
                                                  for (int k = 0;
                                                      k < weeklyChart.length;
                                                      k++) {
                                                    for (int i = 0;
                                                        i < finalList.length;
                                                        i++) {
                                                      if (finalList[i]['index'] ==
                                                          k) {
                                                        finalTotal = finalTotal +
                                                            finalList[i]
                                                                ['totalamt'];
                                                      }
                                                    }
                                                    DateTime dateTime =
                                                        DateFormat("dd-MM-yyyy")
                                                            .parse(
                                                                weeklyDates[k]);

                                                    String formattedDate =
                                                        DateFormat("dd-MM-yyyy")
                                                            .format(dateTime);

                                                    weeklyChart[k] = ChartData(
                                                        formattedDate,
                                                        finalTotal);
                                                  }

                                                  chartData = weeklyChart;
                                                  setState(() {});
                                                } else if (dropdownvalue ==
                                                    '1 Month') {
                                                  print(data);
                                                  List monthlyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime todayDate =
                                                      DateTime.now();

                                                  while (selectedOne
                                                          .isBefore(todayDate) ||
                                                      selectedOne.month ==
                                                          todayDate.month) {
                                                    monthlyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(selectedOne));
                                                    selectedOne = DateTime(
                                                        selectedOne.year,
                                                        selectedOne.month + 1,
                                                        selectedOne.day);
                                                  }

                                                  // print(monthlyDates);

                                                  List<ChartData> monthlyChart =
                                                      [];
                                                  for (int i = 0;
                                                      i < monthlyDates.length;
                                                      i++) {
                                                    monthlyChart.add(ChartData(
                                                        monthlyDates[i], 0));
                                                  }

                                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                                  List myMonthList = [];

                                                  for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                    bool found = false;
                                                    for (int j = 0;
                                                        j <
                                                            monthlyDates.length -
                                                                1;
                                                        j++) {
                                                      DateTime startDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(monthlyDates[
                                                                  j]);
                                                      DateTime endDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(monthlyDates[
                                                                  j + 1]);
                                                      DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                      if (date2.isAfter(
                                                              startDate) &&
                                                          date2.isBefore(
                                                              endDate)) {
                                                        print(myMonthList);
                                                        print('Yes');
                                                        double amountToAdd = data[i].categoryType == CategoryType.income ? data[i].amount : -data[i].amount;

                                                        myMonthList.add({
                                                          'index': j + 1,
                                                          'amt': amountToAdd
                                                        });

                                                        // monthlyChart[j] = ChartData(
                                                        //     monthlyDates[j + 1],
                                                        //     data[i].amount);

                                                        found = true;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }
                                                    if (!found) {
                                                      print(
                                                          'Item from list2 at index $i is not within any date range of list1.');
                                                    }
                                                  }

                                                  print(myMonthList);

                                                  Map<int, double> indexAmtMap =
                                                      {};
                                                  for (var data in myMonthList) {
                                                    int index = data['index'];
                                                    double amt = data['amt'];
                                                    indexAmtMap[index] =
                                                        (indexAmtMap[index] ??
                                                                0) +
                                                            amt;
                                                  }

                                                  List<Map<String, dynamic>>
                                                      finalList = [];
                                                  indexAmtMap
                                                      .forEach((index, totalAmt) {
                                                    finalList.add({
                                                      'index': index,
                                                      'totalamt': totalAmt
                                                    });
                                                  });

                                                  print(finalList);

                                                  double finalTotal = 0;
                                                  for (int k = 0;
                                                      k < monthlyChart.length;
                                                      k++) {
                                                    for (int i = 0;
                                                        i < finalList.length;
                                                        i++) {
                                                      if (finalList[i]['index'] ==
                                                          k) {
                                                        finalTotal = finalTotal +
                                                            finalList[i]
                                                                ['totalamt'];
                                                      }
                                                    }
                                                    DateTime dateTime =
                                                        DateFormat("dd-MM-yyyy")
                                                            .parse(
                                                                monthlyDates[k]);

                                                    String formattedDate =
                                                        DateFormat("dd-MM-yyyy")
                                                            .format(dateTime);

                                                    monthlyChart[k] = ChartData(
                                                        formattedDate,
                                                        finalTotal);
                                                  }

                                                  chartData = monthlyChart;

                                                  setState(() {});
                                                } else if (dropdownvalue ==
                                                    '1 Year') {
                                                  List yearlyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime today = DateTime.now();
                                                  DateTime currentDate = DateTime(
                                                      selectedOne.year,
                                                      selectedOne.month,
                                                      selectedOne.day);

                                                  while (currentDate
                                                          .isBefore(today) ||
                                                      (currentDate.year ==
                                                              today.year &&
                                                          currentDate.month ==
                                                              today.month &&
                                                          currentDate.day ==
                                                              today.day)) {
                                                    yearlyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(currentDate));
                                                    currentDate = DateTime(
                                                        currentDate.year + 1,
                                                        selectedOne.month,
                                                        selectedOne.day);
                                                  }
                                                  // print(yearlyDates);
                                                  List<ChartData> yearChart = [];
                                                  for (int i = 0;
                                                      i < yearlyDates.length;
                                                      i++) {
                                                    yearChart.add(ChartData(
                                                        yearlyDates[i], 300));
                                                  }

                                                  List<ChartData> yearlyChart =
                                                      [];
                                                  for (int i = 0;
                                                      i < yearlyDates.length;
                                                      i++) {
                                                    yearlyChart.add(ChartData(
                                                        yearlyDates[i], 0));
                                                  }

                                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                                  List myYearList = [];

                                                  for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                    bool found = false;
                                                    for (int j = 0;
                                                        j <
                                                            yearlyDates.length -
                                                                1;
                                                        j++) {
                                                      DateTime startDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(
                                                                  yearlyDates[j]);
                                                      DateTime endDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(yearlyDates[
                                                                  j + 1]);
                                                      DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                      if (date2.isAfter(
                                                              startDate) &&
                                                          date2.isBefore(
                                                              endDate)) {
                                                        print(myYearList);
                                                        print('Yes');
                                                        double amountToAdd = data[i].categoryType == CategoryType.income ? data[i].amount : -data[i].amount;

                                                        myYearList.add({
                                                          'index': j + 1,
                                                          'amt': amountToAdd
                                                        });

                                                        // monthlyChart[j] = ChartData(
                                                        //     monthlyDates[j + 1],
                                                        //     data[i].amount);

                                                        found = true;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }
                                                    if (!found) {
                                                      print(
                                                          'Item from list2 at index $i is not within any date range of list1.');
                                                    }
                                                  }

                                                  print(myYearList);

                                                  Map<int, double> indexAmtMap =
                                                      {};
                                                  for (var data in myYearList) {
                                                    int index = data['index'];
                                                    double amt = data['amt'];
                                                    indexAmtMap[index] =
                                                        (indexAmtMap[index] ??
                                                                0) +
                                                            amt;
                                                  }

                                                  List<Map<String, dynamic>>
                                                      finalList = [];
                                                  indexAmtMap
                                                      .forEach((index, totalAmt) {
                                                    finalList.add({
                                                      'index': index,
                                                      'totalamt': totalAmt
                                                    });
                                                  });

                                                  print(finalList);

                                                  // for (int i = 0; i < finalList.length; i++) {
                                                  //   yearlyChart[finalList[i]['index']] =
                                                  //       ChartData(
                                                  //           yearlyDates[finalList[i]['index']],
                                                  //           finalList[i]['totalamt']);
                                                  // }
                                                  double finalTotal = 0;
                                                  for (int k = 0;
                                                      k < yearlyChart.length;
                                                      k++) {
                                                    for (int i = 0;
                                                        i < finalList.length;
                                                        i++) {
                                                      if (finalList[i]['index'] ==
                                                          k) {
                                                        // weeklyChart[k] = ChartData(
                                                        //     weeklyDates[k],
                                                        //     finalList[i]
                                                        //         ['totalamt']);
                                                        finalTotal = finalTotal +
                                                            finalList[i]
                                                                ['totalamt'];
                                                      }
                                                    }
                                                    DateTime dateTime =
                                                        DateFormat("dd-MM-yyyy")
                                                            .parse(
                                                                yearlyDates[k]);

                                                    String formattedDate =
                                                        DateFormat("dd-MM-yyyy")
                                                            .format(dateTime);

                                                    yearlyChart[k] = ChartData(
                                                        formattedDate,
                                                        finalTotal);
                                                  }

                                                  chartData = yearlyChart;

                                                  setState(() {});
                                                }
                                              }

                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: 120,
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.white.withOpacity(0.2),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 0.5),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  7,
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              height: 40,
                                              child: Text(
                                                'Cash',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              List<TransactionModel>
                                                  onlineTransaction = [];
                                              for (int i = 0;
                                                  i < transactionData.length;
                                                  i++) {
                                                if (transactionData[i]
                                                        .category
                                                        .name ==
                                                    'Online') {
                                                  onlineTransaction
                                                      .add(transactionData[i]);
                                                } else {}
                                              }
                                              filterList = onlineTransaction;

                                              var data = filterList;
                                              selectedCategory = 'Online';

                                              selected = 'All';

                                              if (cycleOrAllTime == 'All Time') {
                                                allTimeCategoryButton(
                                                    'Online', filterList);
                                              } else {
                                                if (dropdownvalue == '1 Day') {
                                                  List dailyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime today = DateTime.now();
                                                  DateTime currentDate = DateTime(
                                                      selectedOne.year,
                                                      selectedOne.month,
                                                      selectedOne.day);

                                                  while (currentDate
                                                          .isBefore(today) ||
                                                      (currentDate.year ==
                                                              today.year &&
                                                          currentDate.month ==
                                                              today.month &&
                                                          currentDate.day ==
                                                              today.day)) {
                                                    dailyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(currentDate));

                                                    currentDate = currentDate
                                                        .add(Duration(days: 1));
                                                  }

                                                  List<ChartData> dailyChart = [];

                                                  for (int i = 0;
                                                      i < dailyDates.length;
                                                      i++) {
                                                    dailyChart.add(ChartData(
                                                        dailyDates[i], 0.0));
                                                  }
                                                  double total = 0;
                                                  double dateTotal = 0;
                                                  for (int i = 0;
                                                      i < dailyDates.length;
                                                      i++) {
                                                    String date2 = dailyDates[i];

                                                    for (int j = 0;
                                                        j < data.length;
                                                        j++) {
                                                      DateTime localDate =
                                                          DateTime.parse(
                                                              data[j].date);
                                                      String localDate1 =
                                                          DateFormat('dd-MM-yyyy')
                                                              .format(localDate);

                                                      if (localDate1 == date2) {
                                                        dateTotal = 0;

                                                        for (int i = 0;
                                                            i < data.length;
                                                            i++) {
                                                          if (localDate1 ==
                                                              DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(DateTime
                                                                      .parse(data[
                                                                              i]
                                                                          .date))) {
                                                            if(data[i].categoryType== CategoryType.income){
                                                              dateTotal = dateTotal + data[i].amount;
                                                            }

                                                            else if(data[i].categoryType== CategoryType.expense){
                                                              dateTotal = dateTotal - data[i].amount;

                                                            }
                                                            else {}
                                                          }
                                                        }

                                                        // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
                                                        total = total + dateTotal;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }

                                                    dailyChart[i] = ChartData(
                                                        dailyDates[i], total);
                                                  }

                                                  chartData = dailyChart;
                                                  setState(() {});
                                                } else if (dropdownvalue ==
                                                    '1 Week') {
                                                  List weeklyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime todayDate =
                                                      DateTime.now();

                                                  while (selectedOne
                                                      .isBefore(todayDate)) {
                                                    weeklyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(selectedOne));
                                                    selectedOne = selectedOne
                                                        .add(Duration(days: 7));
                                                  }

                                                  // print(weeklyDates);

                                                  List<ChartData> weekChart = [];
                                                  for (int i = 0;
                                                      i < weeklyDates.length;
                                                      i++) {
                                                    weekChart.add(ChartData(
                                                        weeklyDates[i], 300));
                                                  }

                                                  List<ChartData> weeklyChart =
                                                      [];
                                                  for (int i = 0;
                                                      i < weeklyDates.length;
                                                      i++) {
                                                    weeklyChart.add(ChartData(
                                                        weeklyDates[i], 0));
                                                  }

                                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                                  List myweekList = [];

                                                  for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                    bool found = false;
                                                    for (int j = 0;
                                                        j <
                                                            weeklyDates.length -
                                                                1;
                                                        j++) {
                                                      DateTime startDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(
                                                                  weeklyDates[j]);
                                                      DateTime endDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(weeklyDates[
                                                                  j + 1]);
                                                      DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                      if (date2.isAfter(
                                                              startDate) &&
                                                          date2.isBefore(
                                                              endDate)) {
                                                        print(myweekList);
                                                        print('Yes');
                                                        double amountToAdd = data[i].categoryType == CategoryType.income ? data[i].amount : -data[i].amount;

                                                        myweekList.add({
                                                          'index': j + 1,
                                                          'amt': amountToAdd
                                                        });

                                                        // monthlyChart[j] = ChartData(
                                                        //     monthlyDates[j + 1],
                                                        //     data[i].amount);

                                                        found = true;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }
                                                    if (!found) {
                                                      print(
                                                          'Item from list2 at index $i is not within any date range of list1.');
                                                    }
                                                  }

                                                  print(myweekList);

                                                  Map<int, double> indexAmtMap =
                                                      {};
                                                  for (var data in myweekList) {
                                                    int index = data['index'];
                                                    double amt = data['amt'];
                                                    indexAmtMap[index] =
                                                        (indexAmtMap[index] ??
                                                                0) +
                                                            amt;
                                                  }

                                                  List<Map<String, dynamic>>
                                                      finalList = [];
                                                  indexAmtMap
                                                      .forEach((index, totalAmt) {
                                                    finalList.add({
                                                      'index': index,
                                                      'totalamt': totalAmt
                                                    });
                                                  });

                                                  print(finalList);

                                                  double finalTotal = 0;
                                                  for (int k = 0;
                                                      k < weeklyChart.length;
                                                      k++) {
                                                    for (int i = 0;
                                                        i < finalList.length;
                                                        i++) {
                                                      if (finalList[i]['index'] ==
                                                          k) {
                                                        finalTotal = finalTotal +
                                                            finalList[i]
                                                                ['totalamt'];
                                                      }
                                                    }
                                                    DateTime dateTime =
                                                        DateFormat("dd-MM-yyyy")
                                                            .parse(
                                                                weeklyDates[k]);

                                                    String formattedDate =
                                                        DateFormat("dd-MM-yyyy")
                                                            .format(dateTime);

                                                    weeklyChart[k] = ChartData(
                                                        formattedDate,
                                                        finalTotal);
                                                  }

                                                  chartData = weeklyChart;
                                                  setState(() {});
                                                } else if (dropdownvalue ==
                                                    '1 Month') {
                                                  print(data);
                                                  List monthlyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime todayDate =
                                                      DateTime.now();

                                                  while (selectedOne
                                                          .isBefore(todayDate) ||
                                                      selectedOne.month ==
                                                          todayDate.month) {
                                                    monthlyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(selectedOne));
                                                    selectedOne = DateTime(
                                                        selectedOne.year,
                                                        selectedOne.month + 1,
                                                        selectedOne.day);
                                                  }

                                                  // print(monthlyDates);

                                                  List<ChartData> monthlyChart =
                                                      [];
                                                  for (int i = 0;
                                                      i < monthlyDates.length;
                                                      i++) {
                                                    monthlyChart.add(ChartData(
                                                        monthlyDates[i], 0));
                                                  }

                                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                                  List myMonthList = [];

                                                  for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                    bool found = false;
                                                    for (int j = 0;
                                                        j <
                                                            monthlyDates.length -
                                                                1;
                                                        j++) {
                                                      DateTime startDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(monthlyDates[
                                                                  j]);
                                                      DateTime endDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(monthlyDates[
                                                                  j + 1]);
                                                      DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                      if (date2.isAfter(
                                                              startDate) &&
                                                          date2.isBefore(
                                                              endDate)) {
                                                        print(myMonthList);
                                                        print('Yes');
                                                        double amountToAdd = data[i].categoryType == CategoryType.income ? data[i].amount : -data[i].amount;

                                                        myMonthList.add({
                                                          'index': j + 1,
                                                          'amt': amountToAdd
                                                        });

                                                        // monthlyChart[j] = ChartData(
                                                        //     monthlyDates[j + 1],
                                                        //     data[i].amount);

                                                        found = true;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }
                                                    if (!found) {
                                                      print(
                                                          'Item from list2 at index $i is not within any date range of list1.');
                                                    }
                                                  }

                                                  print(myMonthList);

                                                  Map<int, double> indexAmtMap =
                                                      {};
                                                  for (var data in myMonthList) {
                                                    int index = data['index'];
                                                    double amt = data['amt'];
                                                    indexAmtMap[index] =
                                                        (indexAmtMap[index] ??
                                                                0) +
                                                            amt;
                                                  }

                                                  List<Map<String, dynamic>>
                                                      finalList = [];
                                                  indexAmtMap
                                                      .forEach((index, totalAmt) {
                                                    finalList.add({
                                                      'index': index,
                                                      'totalamt': totalAmt
                                                    });
                                                  });

                                                  print(finalList);

                                                  double finalTotal = 0;
                                                  for (int k = 0;
                                                      k < monthlyChart.length;
                                                      k++) {
                                                    for (int i = 0;
                                                        i < finalList.length;
                                                        i++) {
                                                      if (finalList[i]['index'] ==
                                                          k) {
                                                        finalTotal = finalTotal +
                                                            finalList[i]
                                                                ['totalamt'];
                                                      }
                                                    }
                                                    DateTime dateTime =
                                                        DateFormat("dd-MM-yyyy")
                                                            .parse(
                                                                monthlyDates[k]);

                                                    String formattedDate =
                                                        DateFormat("dd-MM-yyyy")
                                                            .format(dateTime);

                                                    monthlyChart[k] = ChartData(
                                                        formattedDate,
                                                        finalTotal);
                                                  }

                                                  chartData = monthlyChart;

                                                  setState(() {});
                                                } else if (dropdownvalue ==
                                                    '1 Year') {
                                                  List yearlyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime today = DateTime.now();
                                                  DateTime currentDate = DateTime(
                                                      selectedOne.year,
                                                      selectedOne.month,
                                                      selectedOne.day);

                                                  while (currentDate
                                                          .isBefore(today) ||
                                                      (currentDate.year ==
                                                              today.year &&
                                                          currentDate.month ==
                                                              today.month &&
                                                          currentDate.day ==
                                                              today.day)) {
                                                    yearlyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(currentDate));
                                                    currentDate = DateTime(
                                                        currentDate.year + 1,
                                                        selectedOne.month,
                                                        selectedOne.day);
                                                  }
                                                  // print(yearlyDates);
                                                  List<ChartData> yearChart = [];
                                                  for (int i = 0;
                                                      i < yearlyDates.length;
                                                      i++) {
                                                    yearChart.add(ChartData(
                                                        yearlyDates[i], 300));
                                                  }

                                                  List<ChartData> yearlyChart =
                                                      [];
                                                  for (int i = 0;
                                                      i < yearlyDates.length;
                                                      i++) {
                                                    yearlyChart.add(ChartData(
                                                        yearlyDates[i], 0));
                                                  }

                                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                                  List myYearList = [];

                                                  for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                    bool found = false;
                                                    for (int j = 0;
                                                        j <
                                                            yearlyDates.length -
                                                                1;
                                                        j++) {
                                                      DateTime startDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(
                                                                  yearlyDates[j]);
                                                      DateTime endDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(yearlyDates[
                                                                  j + 1]);
                                                      DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                      if (date2.isAfter(
                                                              startDate) &&
                                                          date2.isBefore(
                                                              endDate)) {
                                                        print(myYearList);
                                                        print('Yes');
                                                        double amountToAdd = data[i].categoryType == CategoryType.income ? data[i].amount : -data[i].amount;

                                                        myYearList.add({
                                                          'index': j + 1,
                                                          'amt': amountToAdd
                                                        });

                                                        // monthlyChart[j] = ChartData(
                                                        //     monthlyDates[j + 1],
                                                        //     data[i].amount);

                                                        found = true;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }
                                                    if (!found) {
                                                      print(
                                                          'Item from list2 at index $i is not within any date range of list1.');
                                                    }
                                                  }

                                                  print(myYearList);

                                                  Map<int, double> indexAmtMap =
                                                      {};
                                                  for (var data in myYearList) {
                                                    int index = data['index'];
                                                    double amt = data['amt'];
                                                    indexAmtMap[index] =
                                                        (indexAmtMap[index] ??
                                                                0) +
                                                            amt;
                                                  }

                                                  List<Map<String, dynamic>>
                                                      finalList = [];
                                                  indexAmtMap
                                                      .forEach((index, totalAmt) {
                                                    finalList.add({
                                                      'index': index,
                                                      'totalamt': totalAmt
                                                    });
                                                  });

                                                  print(finalList);

                                                  // for (int i = 0; i < finalList.length; i++) {
                                                  //   yearlyChart[finalList[i]['index']] =
                                                  //       ChartData(
                                                  //           yearlyDates[finalList[i]['index']],
                                                  //           finalList[i]['totalamt']);
                                                  // }
                                                  double finalTotal = 0;
                                                  for (int k = 0;
                                                      k < yearlyChart.length;
                                                      k++) {
                                                    for (int i = 0;
                                                        i < finalList.length;
                                                        i++) {
                                                      if (finalList[i]['index'] ==
                                                          k) {
                                                        // weeklyChart[k] = ChartData(
                                                        //     weeklyDates[k],
                                                        //     finalList[i]
                                                        //         ['totalamt']);
                                                        finalTotal = finalTotal +
                                                            finalList[i]
                                                                ['totalamt'];
                                                      }
                                                    }
                                                    DateTime dateTime =
                                                        DateFormat("dd-MM-yyyy")
                                                            .parse(
                                                                yearlyDates[k]);

                                                    String formattedDate =
                                                        DateFormat("dd-MM-yyyy")
                                                            .format(dateTime);

                                                    yearlyChart[k] = ChartData(
                                                        formattedDate,
                                                        finalTotal);
                                                  }

                                                  chartData = yearlyChart;

                                                  setState(() {});
                                                }
                                              }

                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: 120,
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.white.withOpacity(0.2),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 0.5),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  7,
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              height: 40,
                                              child: Text(
                                                'Online',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              List<TransactionModel>
                                                  otherTransaction = [];
                                              for (int i = 0;
                                                  i < transactionData.length;
                                                  i++) {
                                                if (transactionData[i]
                                                        .category
                                                        .name ==
                                                    'Other') {
                                                  otherTransaction
                                                      .add(transactionData[i]);
                                                } else {}
                                              }
                                              filterList = otherTransaction;

                                              var data = filterList;
                                              selectedCategory = 'Other';

                                              selected = 'All';

                                              if (cycleOrAllTime == 'All Time') {
                                                allTimeCategoryButton(
                                                    'Other', filterList);
                                              } else {
                                                if (dropdownvalue == '1 Day') {
                                                  List dailyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime today = DateTime.now();
                                                  DateTime currentDate = DateTime(
                                                      selectedOne.year,
                                                      selectedOne.month,
                                                      selectedOne.day);

                                                  while (currentDate
                                                          .isBefore(today) ||
                                                      (currentDate.year ==
                                                              today.year &&
                                                          currentDate.month ==
                                                              today.month &&
                                                          currentDate.day ==
                                                              today.day)) {
                                                    dailyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(currentDate));

                                                    currentDate = currentDate
                                                        .add(Duration(days: 1));
                                                  }

                                                  List<ChartData> dailyChart = [];

                                                  for (int i = 0;
                                                      i < dailyDates.length;
                                                      i++) {
                                                    dailyChart.add(ChartData(
                                                        dailyDates[i], 0.0));
                                                  }
                                                  double total = 0;
                                                  double dateTotal = 0;
                                                  for (int i = 0;
                                                      i < dailyDates.length;
                                                      i++) {
                                                    String date2 = dailyDates[i];

                                                    for (int j = 0;
                                                        j < data.length;
                                                        j++) {
                                                      DateTime localDate =
                                                          DateTime.parse(
                                                              data[j].date);
                                                      String localDate1 =
                                                          DateFormat('dd-MM-yyyy')
                                                              .format(localDate);

                                                      if (localDate1 == date2) {
                                                        dateTotal = 0;

                                                        for (int i = 0;
                                                            i < data.length;
                                                            i++) {
                                                          if (localDate1 ==
                                                              DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(DateTime
                                                                      .parse(data[
                                                                              i]
                                                                          .date))) {
                                                            if(data[i].categoryType== CategoryType.income){
                                                              dateTotal = dateTotal + data[i].amount;
                                                            }

                                                            else if(data[i].categoryType== CategoryType.expense){
                                                              dateTotal = dateTotal - data[i].amount;

                                                            }
                                                            else {}
                                                          }
                                                        }

                                                        // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
                                                        total = total + dateTotal;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }

                                                    dailyChart[i] = ChartData(
                                                        dailyDates[i], total);
                                                  }

                                                  chartData = dailyChart;
                                                  setState(() {});
                                                } else if (dropdownvalue ==
                                                    '1 Week') {
                                                  List weeklyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime todayDate =
                                                      DateTime.now();

                                                  while (selectedOne
                                                      .isBefore(todayDate)) {
                                                    weeklyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(selectedOne));
                                                    selectedOne = selectedOne
                                                        .add(Duration(days: 7));
                                                  }

                                                  // print(weeklyDates);

                                                  List<ChartData> weekChart = [];
                                                  for (int i = 0;
                                                      i < weeklyDates.length;
                                                      i++) {
                                                    weekChart.add(ChartData(
                                                        weeklyDates[i], 300));
                                                  }

                                                  List<ChartData> weeklyChart =
                                                      [];
                                                  for (int i = 0;
                                                      i < weeklyDates.length;
                                                      i++) {
                                                    weeklyChart.add(ChartData(
                                                        weeklyDates[i], 0));
                                                  }

                                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                                  List myweekList = [];

                                                  for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                    bool found = false;
                                                    for (int j = 0;
                                                        j <
                                                            weeklyDates.length -
                                                                1;
                                                        j++) {
                                                      DateTime startDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(
                                                                  weeklyDates[j]);
                                                      DateTime endDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(weeklyDates[
                                                                  j + 1]);
                                                      DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                      if (date2.isAfter(
                                                              startDate) &&
                                                          date2.isBefore(
                                                              endDate)) {
                                                        print(myweekList);
                                                        print('Yes');
                                                        double amountToAdd = data[i].categoryType == CategoryType.income ? data[i].amount : -data[i].amount;

                                                        myweekList.add({
                                                          'index': j + 1,
                                                          'amt': amountToAdd
                                                        });

                                                        // monthlyChart[j] = ChartData(
                                                        //     monthlyDates[j + 1],
                                                        //     data[i].amount);

                                                        found = true;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }
                                                    if (!found) {
                                                      print(
                                                          'Item from list2 at index $i is not within any date range of list1.');
                                                    }
                                                  }

                                                  print(myweekList);

                                                  Map<int, double> indexAmtMap =
                                                      {};
                                                  for (var data in myweekList) {
                                                    int index = data['index'];
                                                    double amt = data['amt'];
                                                    indexAmtMap[index] =
                                                        (indexAmtMap[index] ??
                                                                0) +
                                                            amt;
                                                  }

                                                  List<Map<String, dynamic>>
                                                      finalList = [];
                                                  indexAmtMap
                                                      .forEach((index, totalAmt) {
                                                    finalList.add({
                                                      'index': index,
                                                      'totalamt': totalAmt
                                                    });
                                                  });

                                                  print(finalList);

                                                  double finalTotal = 0;
                                                  for (int k = 0;
                                                      k < weeklyChart.length;
                                                      k++) {
                                                    for (int i = 0;
                                                        i < finalList.length;
                                                        i++) {
                                                      if (finalList[i]['index'] ==
                                                          k) {
                                                        finalTotal = finalTotal +
                                                            finalList[i]
                                                                ['totalamt'];
                                                      }
                                                    }
                                                    DateTime dateTime =
                                                        DateFormat("dd-MM-yyyy")
                                                            .parse(
                                                                weeklyDates[k]);

                                                    String formattedDate =
                                                        DateFormat("dd-MM-yyyy")
                                                            .format(dateTime);

                                                    weeklyChart[k] = ChartData(
                                                        formattedDate,
                                                        finalTotal);
                                                  }

                                                  chartData = weeklyChart;
                                                  setState(() {});
                                                } else if (dropdownvalue ==
                                                    '1 Month') {
                                                  print(data);
                                                  List monthlyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime todayDate =
                                                      DateTime.now();

                                                  while (selectedOne
                                                          .isBefore(todayDate) ||
                                                      selectedOne.month ==
                                                          todayDate.month) {
                                                    monthlyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(selectedOne));
                                                    selectedOne = DateTime(
                                                        selectedOne.year,
                                                        selectedOne.month + 1,
                                                        selectedOne.day);
                                                  }

                                                  // print(monthlyDates);

                                                  List<ChartData> monthlyChart =
                                                      [];
                                                  for (int i = 0;
                                                      i < monthlyDates.length;
                                                      i++) {
                                                    monthlyChart.add(ChartData(
                                                        monthlyDates[i], 0));
                                                  }

                                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                                  List myMonthList = [];

                                                  for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                    bool found = false;
                                                    for (int j = 0;
                                                        j <
                                                            monthlyDates.length -
                                                                1;
                                                        j++) {
                                                      DateTime startDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(monthlyDates[
                                                                  j]);
                                                      DateTime endDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(monthlyDates[
                                                                  j + 1]);
                                                      DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                      if (date2.isAfter(
                                                              startDate) &&
                                                          date2.isBefore(
                                                              endDate)) {
                                                        print(myMonthList);
                                                        print('Yes');
                                                        double amountToAdd = data[i].categoryType == CategoryType.income ? data[i].amount : -data[i].amount;

                                                        myMonthList.add({
                                                          'index': j + 1,
                                                          'amt': amountToAdd
                                                        });

                                                        // monthlyChart[j] = ChartData(
                                                        //     monthlyDates[j + 1],
                                                        //     data[i].amount);

                                                        found = true;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }
                                                    if (!found) {
                                                      print(
                                                          'Item from list2 at index $i is not within any date range of list1.');
                                                    }
                                                  }

                                                  print(myMonthList);

                                                  Map<int, double> indexAmtMap =
                                                      {};
                                                  for (var data in myMonthList) {
                                                    int index = data['index'];
                                                    double amt = data['amt'];
                                                    indexAmtMap[index] =
                                                        (indexAmtMap[index] ??
                                                                0) +
                                                            amt;
                                                  }

                                                  List<Map<String, dynamic>>
                                                      finalList = [];
                                                  indexAmtMap
                                                      .forEach((index, totalAmt) {
                                                    finalList.add({
                                                      'index': index,
                                                      'totalamt': totalAmt
                                                    });
                                                  });

                                                  print(finalList);

                                                  double finalTotal = 0;
                                                  for (int k = 0;
                                                      k < monthlyChart.length;
                                                      k++) {
                                                    for (int i = 0;
                                                        i < finalList.length;
                                                        i++) {
                                                      if (finalList[i]['index'] ==
                                                          k) {
                                                        finalTotal = finalTotal +
                                                            finalList[i]
                                                                ['totalamt'];
                                                      }
                                                    }
                                                    DateTime dateTime =
                                                        DateFormat("dd-MM-yyyy")
                                                            .parse(
                                                                monthlyDates[k]);

                                                    String formattedDate =
                                                        DateFormat("dd-MM-yyyy")
                                                            .format(dateTime);

                                                    monthlyChart[k] = ChartData(
                                                        formattedDate,
                                                        finalTotal);
                                                  }

                                                  chartData = monthlyChart;

                                                  setState(() {});
                                                } else if (dropdownvalue ==
                                                    '1 Year') {
                                                  List yearlyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime today = DateTime.now();
                                                  DateTime currentDate = DateTime(
                                                      selectedOne.year,
                                                      selectedOne.month,
                                                      selectedOne.day);

                                                  while (currentDate
                                                          .isBefore(today) ||
                                                      (currentDate.year ==
                                                              today.year &&
                                                          currentDate.month ==
                                                              today.month &&
                                                          currentDate.day ==
                                                              today.day)) {
                                                    yearlyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(currentDate));
                                                    currentDate = DateTime(
                                                        currentDate.year + 1,
                                                        selectedOne.month,
                                                        selectedOne.day);
                                                  }
                                                  // print(yearlyDates);
                                                  List<ChartData> yearChart = [];
                                                  for (int i = 0;
                                                      i < yearlyDates.length;
                                                      i++) {
                                                    yearChart.add(ChartData(
                                                        yearlyDates[i], 300));
                                                  }

                                                  List<ChartData> yearlyChart =
                                                      [];
                                                  for (int i = 0;
                                                      i < yearlyDates.length;
                                                      i++) {
                                                    yearlyChart.add(ChartData(
                                                        yearlyDates[i], 0));
                                                  }

                                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                                  List myYearList = [];

                                                  for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                    bool found = false;
                                                    for (int j = 0;
                                                        j <
                                                            yearlyDates.length -
                                                                1;
                                                        j++) {
                                                      DateTime startDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(
                                                                  yearlyDates[j]);
                                                      DateTime endDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(yearlyDates[
                                                                  j + 1]);
                                                      DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                      if (date2.isAfter(
                                                              startDate) &&
                                                          date2.isBefore(
                                                              endDate)) {
                                                        print(myYearList);
                                                        print('Yes');
                                                        double amountToAdd = data[i].categoryType == CategoryType.income ? data[i].amount : -data[i].amount;

                                                        myYearList.add({
                                                          'index': j + 1,
                                                          'amt':amountToAdd
                                                        });

                                                        // monthlyChart[j] = ChartData(
                                                        //     monthlyDates[j + 1],
                                                        //     data[i].amount);

                                                        found = true;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }
                                                    if (!found) {
                                                      print(
                                                          'Item from list2 at index $i is not within any date range of list1.');
                                                    }
                                                  }

                                                  print(myYearList);

                                                  Map<int, double> indexAmtMap =
                                                      {};
                                                  for (var data in myYearList) {
                                                    int index = data['index'];
                                                    double amt = data['amt'];
                                                    indexAmtMap[index] =
                                                        (indexAmtMap[index] ??
                                                                0) +
                                                            amt;
                                                  }

                                                  List<Map<String, dynamic>>
                                                      finalList = [];
                                                  indexAmtMap
                                                      .forEach((index, totalAmt) {
                                                    finalList.add({
                                                      'index': index,
                                                      'totalamt': totalAmt
                                                    });
                                                  });

                                                  print(finalList);

                                                  // for (int i = 0; i < finalList.length; i++) {
                                                  //   yearlyChart[finalList[i]['index']] =
                                                  //       ChartData(
                                                  //           yearlyDates[finalList[i]['index']],
                                                  //           finalList[i]['totalamt']);
                                                  // }
                                                  double finalTotal = 0;
                                                  for (int k = 0;
                                                      k < yearlyChart.length;
                                                      k++) {
                                                    for (int i = 0;
                                                        i < finalList.length;
                                                        i++) {
                                                      if (finalList[i]['index'] ==
                                                          k) {
                                                        // weeklyChart[k] = ChartData(
                                                        //     weeklyDates[k],
                                                        //     finalList[i]
                                                        //         ['totalamt']);
                                                        finalTotal = finalTotal +
                                                            finalList[i]
                                                                ['totalamt'];
                                                      }
                                                    }
                                                    DateTime dateTime =
                                                        DateFormat("dd-MM-yyyy")
                                                            .parse(
                                                                yearlyDates[k]);

                                                    String formattedDate =
                                                        DateFormat("dd-MM-yyyy")
                                                            .format(dateTime);

                                                    yearlyChart[k] = ChartData(
                                                        formattedDate,
                                                        finalTotal);
                                                  }

                                                  chartData = yearlyChart;

                                                  setState(() {});
                                                }
                                              }

                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: 120,
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.white.withOpacity(0.2),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 0.5),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  7,
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              height: 40,
                                              child: Text(
                                                'Other',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              List<TransactionModel>
                                                  tournamentTransaction = [];
                                              for (int i = 0;
                                                  i < transactionData.length;
                                                  i++) {
                                                if (transactionData[i]
                                                        .category
                                                        .name ==
                                                    'Tournament') {
                                                  tournamentTransaction
                                                      .add(transactionData[i]);
                                                } else {}
                                              }
                                              filterList = tournamentTransaction;

                                              var data = filterList;
                                              selectedCategory = 'Tournament';

                                              selected = 'All';

                                              if (cycleOrAllTime == 'All Time') {
                                                allTimeCategoryButton(
                                                    'Tournament', filterList);
                                              } else {
                                                if (dropdownvalue == '1 Day') {
                                                  List dailyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime today = DateTime.now();
                                                  DateTime currentDate = DateTime(
                                                      selectedOne.year,
                                                      selectedOne.month,
                                                      selectedOne.day);

                                                  while (currentDate
                                                          .isBefore(today) ||
                                                      (currentDate.year ==
                                                              today.year &&
                                                          currentDate.month ==
                                                              today.month &&
                                                          currentDate.day ==
                                                              today.day)) {
                                                    dailyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(currentDate));

                                                    currentDate = currentDate
                                                        .add(Duration(days: 1));
                                                  }

                                                  List<ChartData> dailyChart = [];

                                                  for (int i = 0;
                                                      i < dailyDates.length;
                                                      i++) {
                                                    dailyChart.add(ChartData(
                                                        dailyDates[i], 0.0));
                                                  }
                                                  double total = 0;
                                                  double dateTotal = 0;
                                                  for (int i = 0;
                                                      i < dailyDates.length;
                                                      i++) {
                                                    String date2 = dailyDates[i];

                                                    for (int j = 0;
                                                        j < data.length;
                                                        j++) {
                                                      DateTime localDate =
                                                          DateTime.parse(
                                                              data[j].date);
                                                      String localDate1 =
                                                          DateFormat('dd-MM-yyyy')
                                                              .format(localDate);

                                                      if (localDate1 == date2) {
                                                        dateTotal = 0;

                                                        for (int i = 0;
                                                            i < data.length;
                                                            i++) {
                                                          if (localDate1 ==
                                                              DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(DateTime
                                                                      .parse(data[
                                                                              i]
                                                                          .date))) {
                                                            if(data[i].categoryType== CategoryType.income){
                                                              dateTotal = dateTotal + data[i].amount;
                                                            }

                                                            else if(data[i].categoryType== CategoryType.expense){
                                                              dateTotal = dateTotal - data[i].amount;

                                                            }
                                                            else {}
                                                          }
                                                        }

                                                        // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
                                                        total = total + dateTotal;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }

                                                    dailyChart[i] = ChartData(
                                                        dailyDates[i], total);
                                                  }

                                                  chartData = dailyChart;
                                                  setState(() {});
                                                } else if (dropdownvalue ==
                                                    '1 Week') {
                                                  List weeklyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime todayDate =
                                                      DateTime.now();

                                                  while (selectedOne
                                                      .isBefore(todayDate)) {
                                                    weeklyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(selectedOne));
                                                    selectedOne = selectedOne
                                                        .add(Duration(days: 7));
                                                  }

                                                  // print(weeklyDates);

                                                  List<ChartData> weekChart = [];
                                                  for (int i = 0;
                                                      i < weeklyDates.length;
                                                      i++) {
                                                    weekChart.add(ChartData(
                                                        weeklyDates[i], 300));
                                                  }

                                                  List<ChartData> weeklyChart =
                                                      [];
                                                  for (int i = 0;
                                                      i < weeklyDates.length;
                                                      i++) {
                                                    weeklyChart.add(ChartData(
                                                        weeklyDates[i], 0));
                                                  }

                                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                                  List myweekList = [];

                                                  for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                    bool found = false;
                                                    for (int j = 0;
                                                        j <
                                                            weeklyDates.length -
                                                                1;
                                                        j++) {
                                                      DateTime startDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(
                                                                  weeklyDates[j]);
                                                      DateTime endDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(weeklyDates[
                                                                  j + 1]);
                                                      DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                      if (date2.isAfter(
                                                              startDate) &&
                                                          date2.isBefore(
                                                              endDate)) {
                                                        print(myweekList);
                                                        print('Yes');
                                                        double amountToAdd = data[i].categoryType == CategoryType.income ? data[i].amount : -data[i].amount;

                                                        myweekList.add({
                                                          'index': j + 1,
                                                          'amt': amountToAdd
                                                        });

                                                        // monthlyChart[j] = ChartData(
                                                        //     monthlyDates[j + 1],
                                                        //     data[i].amount);

                                                        found = true;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }
                                                    if (!found) {
                                                      print(
                                                          'Item from list2 at index $i is not within any date range of list1.');
                                                    }
                                                  }

                                                  print(myweekList);

                                                  Map<int, double> indexAmtMap =
                                                      {};
                                                  for (var data in myweekList) {
                                                    int index = data['index'];
                                                    double amt = data['amt'];
                                                    indexAmtMap[index] =
                                                        (indexAmtMap[index] ??
                                                                0) +
                                                            amt;
                                                  }

                                                  List<Map<String, dynamic>>
                                                      finalList = [];
                                                  indexAmtMap
                                                      .forEach((index, totalAmt) {
                                                    finalList.add({
                                                      'index': index,
                                                      'totalamt': totalAmt
                                                    });
                                                  });

                                                  print(finalList);

                                                  double finalTotal = 0;
                                                  for (int k = 0;
                                                      k < weeklyChart.length;
                                                      k++) {
                                                    for (int i = 0;
                                                        i < finalList.length;
                                                        i++) {
                                                      if (finalList[i]['index'] ==
                                                          k) {
                                                        finalTotal = finalTotal +
                                                            finalList[i]
                                                                ['totalamt'];
                                                      }
                                                    }
                                                    DateTime dateTime =
                                                        DateFormat("dd-MM-yyyy")
                                                            .parse(
                                                                weeklyDates[k]);

                                                    String formattedDate =
                                                        DateFormat("dd-MM-yyyy")
                                                            .format(dateTime);

                                                    weeklyChart[k] = ChartData(
                                                        formattedDate,
                                                        finalTotal);
                                                  }

                                                  chartData = weeklyChart;
                                                  setState(() {});
                                                } else if (dropdownvalue ==
                                                    '1 Month') {
                                                  print(data);
                                                  List monthlyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime todayDate =
                                                      DateTime.now();

                                                  while (selectedOne
                                                          .isBefore(todayDate) ||
                                                      selectedOne.month ==
                                                          todayDate.month) {
                                                    monthlyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(selectedOne));
                                                    selectedOne = DateTime(
                                                        selectedOne.year,
                                                        selectedOne.month + 1,
                                                        selectedOne.day);
                                                  }

                                                  // print(monthlyDates);

                                                  List<ChartData> monthlyChart =
                                                      [];
                                                  for (int i = 0;
                                                      i < monthlyDates.length;
                                                      i++) {
                                                    monthlyChart.add(ChartData(
                                                        monthlyDates[i], 0));
                                                  }

                                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                                  List myMonthList = [];

                                                  for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                    bool found = false;
                                                    for (int j = 0;
                                                        j <
                                                            monthlyDates.length -
                                                                1;
                                                        j++) {
                                                      DateTime startDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(monthlyDates[
                                                                  j]);
                                                      DateTime endDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(monthlyDates[
                                                                  j + 1]);
                                                      DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                      if (date2.isAfter(
                                                              startDate) &&
                                                          date2.isBefore(
                                                              endDate)) {
                                                        print(myMonthList);
                                                        print('Yes');
                                                        double amountToAdd = data[i].categoryType == CategoryType.income ? data[i].amount : -data[i].amount;

                                                        myMonthList.add({
                                                          'index': j + 1,
                                                          'amt': amountToAdd
                                                        });

                                                        // monthlyChart[j] = ChartData(
                                                        //     monthlyDates[j + 1],
                                                        //     data[i].amount);

                                                        found = true;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }
                                                    if (!found) {
                                                      print(
                                                          'Item from list2 at index $i is not within any date range of list1.');
                                                    }
                                                  }

                                                  print(myMonthList);

                                                  Map<int, double> indexAmtMap =
                                                      {};
                                                  for (var data in myMonthList) {
                                                    int index = data['index'];
                                                    double amt = data['amt'];
                                                    indexAmtMap[index] =
                                                        (indexAmtMap[index] ??
                                                                0) +
                                                            amt;
                                                  }

                                                  List<Map<String, dynamic>>
                                                      finalList = [];
                                                  indexAmtMap
                                                      .forEach((index, totalAmt) {
                                                    finalList.add({
                                                      'index': index,
                                                      'totalamt': totalAmt
                                                    });
                                                  });

                                                  print(finalList);

                                                  double finalTotal = 0;
                                                  for (int k = 0;
                                                      k < monthlyChart.length;
                                                      k++) {
                                                    for (int i = 0;
                                                        i < finalList.length;
                                                        i++) {
                                                      if (finalList[i]['index'] ==
                                                          k) {
                                                        finalTotal = finalTotal +
                                                            finalList[i]
                                                                ['totalamt'];
                                                      }
                                                    }
                                                    DateTime dateTime =
                                                        DateFormat("dd-MM-yyyy")
                                                            .parse(
                                                                monthlyDates[k]);

                                                    String formattedDate =
                                                        DateFormat("dd-MM-yyyy")
                                                            .format(dateTime);

                                                    monthlyChart[k] = ChartData(
                                                        formattedDate,
                                                        finalTotal);
                                                  }

                                                  chartData = monthlyChart;

                                                  setState(() {});
                                                } else if (dropdownvalue ==
                                                    '1 Year') {
                                                  List yearlyDates = [];
                                                  DateTime selectedOne =
                                                      DateFormat('dd-MM-yyyy')
                                                          .parse(selectedDate);
                                                  DateTime today = DateTime.now();
                                                  DateTime currentDate = DateTime(
                                                      selectedOne.year,
                                                      selectedOne.month,
                                                      selectedOne.day);

                                                  while (currentDate
                                                          .isBefore(today) ||
                                                      (currentDate.year ==
                                                              today.year &&
                                                          currentDate.month ==
                                                              today.month &&
                                                          currentDate.day ==
                                                              today.day)) {
                                                    yearlyDates.add(
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(currentDate));
                                                    currentDate = DateTime(
                                                        currentDate.year + 1,
                                                        selectedOne.month,
                                                        selectedOne.day);
                                                  }
                                                  // print(yearlyDates);
                                                  List<ChartData> yearChart = [];
                                                  for (int i = 0;
                                                      i < yearlyDates.length;
                                                      i++) {
                                                    yearChart.add(ChartData(
                                                        yearlyDates[i], 300));
                                                  }

                                                  List<ChartData> yearlyChart =
                                                      [];
                                                  for (int i = 0;
                                                      i < yearlyDates.length;
                                                      i++) {
                                                    yearlyChart.add(ChartData(
                                                        yearlyDates[i], 0));
                                                  }

                                                  // data.sort((a, b) => a.date.compareTo(b.date),);

                                                  List myYearList = [];

                                                  for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                    bool found = false;
                                                    for (int j = 0;
                                                        j <
                                                            yearlyDates.length -
                                                                1;
                                                        j++) {
                                                      DateTime startDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(
                                                                  yearlyDates[j]);
                                                      DateTime endDate =
                                                          DateFormat('dd-MM-yyyy')
                                                              .parse(yearlyDates[
                                                                  j + 1]);
                                                      DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                      if (date2.isAfter(
                                                              startDate) &&
                                                          date2.isBefore(
                                                              endDate)) {
                                                        print(myYearList);
                                                        print('Yes');
                                                        double amountToAdd = data[i].categoryType == CategoryType.income ? data[i].amount : -data[i].amount;


                                                        myYearList.add({
                                                          'index': j + 1,
                                                          'amt': amountToAdd
                                                        });

                                                        // monthlyChart[j] = ChartData(
                                                        //     monthlyDates[j + 1],
                                                        //     data[i].amount);

                                                        found = true;
                                                        break;
                                                      } else {
                                                        print('no');
                                                      }
                                                    }
                                                    if (!found) {
                                                      print(
                                                          'Item from list2 at index $i is not within any date range of list1.');
                                                    }
                                                  }

                                                  print(myYearList);

                                                  Map<int, double> indexAmtMap =
                                                      {};
                                                  for (var data in myYearList) {
                                                    int index = data['index'];
                                                    double amt = data['amt'];
                                                    indexAmtMap[index] =
                                                        (indexAmtMap[index] ??
                                                                0) +
                                                            amt;
                                                  }

                                                  List<Map<String, dynamic>>
                                                      finalList = [];
                                                  indexAmtMap
                                                      .forEach((index, totalAmt) {
                                                    finalList.add({
                                                      'index': index,
                                                      'totalamt': totalAmt
                                                    });
                                                  });

                                                  print(finalList);

                                                  // for (int i = 0; i < finalList.length; i++) {
                                                  //   yearlyChart[finalList[i]['index']] =
                                                  //       ChartData(
                                                  //           yearlyDates[finalList[i]['index']],
                                                  //           finalList[i]['totalamt']);
                                                  // }
                                                  double finalTotal = 0;
                                                  for (int k = 0;
                                                      k < yearlyChart.length;
                                                      k++) {
                                                    for (int i = 0;
                                                        i < finalList.length;
                                                        i++) {
                                                      if (finalList[i]['index'] ==
                                                          k) {
                                                        // weeklyChart[k] = ChartData(
                                                        //     weeklyDates[k],
                                                        //     finalList[i]
                                                        //         ['totalamt']);
                                                        finalTotal = finalTotal +
                                                            finalList[i]
                                                                ['totalamt'];
                                                      }
                                                    }
                                                    DateTime dateTime =
                                                        DateFormat("dd-MM-yyyy")
                                                            .parse(
                                                                yearlyDates[k]);

                                                    String formattedDate =
                                                        DateFormat("dd-MM-yyyy")
                                                            .format(dateTime);

                                                    yearlyChart[k] = ChartData(
                                                        formattedDate,
                                                        finalTotal);
                                                  }

                                                  chartData = yearlyChart;

                                                  setState(() {});
                                                }
                                              }

                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: 120,
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.white.withOpacity(0.2),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 0.5),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  7,
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              height: 40,
                                              child: Text(
                                                'Tournament',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),*/

                                        SizedBox(
                                          height: 35,
                                          child: ListView.separated(
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                              width: 10,
                                            ),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: categoryNameList.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  selectedCategoryIndex = index;
                                                  // selectedCategory =
                                                  //     categoryNameList[index];
                                                  setState(() {});
                                                  update.call(
                                                        () {},
                                                  );
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  decoration: BoxDecoration(
                                                    color:
                                                    selectedCategoryIndex ==
                                                        index
                                                        ? Colors.grey
                                                        .withOpacity(
                                                        0.2)
                                                        : Colors
                                                        .transparent,
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 0.5),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                      7,
                                                    ),
                                                  ),
                                                  alignment: Alignment.center,
                                                  height: 40,
                                                  child:
                                                  selectedCategoryIndex ==
                                                      index
                                                      ? Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Icon(
                                                        Icons.check,
                                                        color: AppTheme
                                                            .white,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        categoryNameList[
                                                        index],
                                                        style: TextStyle(
                                                            color: Colors
                                                                .white,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                            fontSize:
                                                            16),
                                                      ),
                                                    ],
                                                  )
                                                      : Text(
                                                    categoryNameList[
                                                    index],
                                                    style: TextStyle(
                                                        color: Colors
                                                            .white,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                selected = 'All';
                                                selectedCategory =
                                                categoryNameList[selectedCategoryIndex];
                                                if (selectedCategory == 'All') {
                                                  filterList = transactionData;
                                                  var data = filterList;

                                                  if (cycleOrAllTime ==
                                                      'All Time') {
                                                    allTimeButton();
                                                  } else {
                                                    if (dropdownvalue ==
                                                        '1 Day') {
                                                      List dailyDates = [];
                                                      DateTime selectedOne =
                                                      DateFormat(
                                                          'dd-MM-yyyy')
                                                          .parse(
                                                          selectedDate);
                                                      DateTime today =
                                                      DateTime.now();
                                                      DateTime currentDate =
                                                      DateTime(
                                                          selectedOne.year,
                                                          selectedOne.month,
                                                          selectedOne.day);

                                                      while (currentDate
                                                          .isBefore(
                                                          today) ||
                                                          (currentDate.year ==
                                                              today.year &&
                                                              currentDate
                                                                  .month ==
                                                                  today.month &&
                                                              currentDate.day ==
                                                                  today.day)) {
                                                        dailyDates.add(DateFormat(
                                                            'dd-MM-yyyy')
                                                            .format(
                                                            currentDate));

                                                        currentDate =
                                                            currentDate.add(
                                                                Duration(
                                                                    days: 1));
                                                      }

                                                      List<ChartData>
                                                      dailyChart = [];

                                                      for (int i = 0;
                                                      i < dailyDates.length;
                                                      i++) {
                                                        dailyChart.add(
                                                            ChartData(
                                                                dailyDates[i],
                                                                0.0));
                                                      }
                                                      double total = 0;
                                                      double dateTotal = 0;
                                                      for (int i = 0;
                                                      i < dailyDates.length;
                                                      i++) {
                                                        String date2 =
                                                        dailyDates[i];

                                                        for (int j = 0;
                                                        j < data.length;
                                                        j++) {
                                                          DateTime localDate =
                                                          DateTime.parse(
                                                              data[j].date);
                                                          String localDate1 =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .format(
                                                              localDate);

                                                          if (localDate1 ==
                                                              date2) {
                                                            dateTotal = 0;

                                                            for (int i = 0;
                                                            i < data.length;
                                                            i++) {
                                                              if (localDate1 ==
                                                                  DateFormat(
                                                                      'dd-MM-yyyy')
                                                                      .format(DateTime.parse(
                                                                      data[i]
                                                                          .date))) {
                                                                if (data[i]
                                                                    .categoryType ==
                                                                    CategoryType
                                                                        .income) {
                                                                  dateTotal =
                                                                      dateTotal +
                                                                          data[i]
                                                                              .amount;
                                                                } else if (data[
                                                                i]
                                                                    .categoryType ==
                                                                    CategoryType
                                                                        .expense) {
                                                                  dateTotal =
                                                                      dateTotal -
                                                                          data[i]
                                                                              .amount;
                                                                } else {}
                                                              }
                                                            }

                                                            // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
                                                            total = total +
                                                                dateTotal;
                                                            break;
                                                          } else {
                                                            print('no');
                                                          }
                                                        }

                                                        dailyChart[i] =
                                                            ChartData(
                                                                dailyDates[i],
                                                                total);
                                                      }

                                                      chartData = dailyChart;
                                                      setState(() {});
                                                    } else if (dropdownvalue ==
                                                        '1 Week') {
                                                      List weeklyDates = [];
                                                      DateTime selectedOne =
                                                      DateFormat(
                                                          'dd-MM-yyyy')
                                                          .parse(
                                                          selectedDate);
                                                      DateTime todayDate =
                                                      DateTime.now();

                                                      while (
                                                      selectedOne.isBefore(
                                                          todayDate)) {
                                                        weeklyDates.add(DateFormat(
                                                            'dd-MM-yyyy')
                                                            .format(
                                                            selectedOne));
                                                        selectedOne =
                                                            selectedOne.add(
                                                                Duration(
                                                                    days: 7));
                                                      }

                                                      // print(weeklyDates);

                                                      List<ChartData>
                                                      weekChart = [];
                                                      for (int i = 0;
                                                      i <
                                                          weeklyDates
                                                              .length;
                                                      i++) {
                                                        weekChart.add(ChartData(
                                                            weeklyDates[i],
                                                            300));
                                                      }

                                                      List<ChartData>
                                                      weeklyChart = [];
                                                      for (int i = 0;
                                                      i <
                                                          weeklyDates
                                                              .length;
                                                      i++) {
                                                        weeklyChart.add(
                                                            ChartData(
                                                                weeklyDates[i],
                                                                0));
                                                      }

                                                      // data.sort((a, b) => a.date.compareTo(b.date),);

                                                      List myweekList = [];

                                                      for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                        bool found = false;
                                                        for (int j = 0;
                                                        j <
                                                            weeklyDates
                                                                .length -
                                                                1;
                                                        j++) {
                                                          DateTime startDate =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              weeklyDates[
                                                              j]);
                                                          DateTime endDate =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              weeklyDates[
                                                              j + 1]);
                                                          DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                          if (date2.isAfter(
                                                              startDate) &&
                                                              date2.isBefore(
                                                                  endDate)) {
                                                            print(myweekList);
                                                            print('Yes');
                                                            double amountToAdd =
                                                            data[i].categoryType ==
                                                                CategoryType
                                                                    .income
                                                                ? data[i]
                                                                .amount
                                                                : -data[i]
                                                                .amount;

                                                            myweekList.add({
                                                              'index': j + 1,
                                                              'amt': amountToAdd
                                                            });

                                                            // monthlyChart[j] = ChartData(
                                                            //     monthlyDates[j + 1],
                                                            //     data[i].amount);

                                                            found = true;
                                                            break;
                                                          } else {
                                                            print('no');
                                                          }
                                                        }
                                                        if (!found) {
                                                          print(
                                                              'Item from list2 at index $i is not within any date range of list1.');
                                                        }
                                                      }

                                                      print(myweekList);

                                                      Map<int, double>
                                                      indexAmtMap = {};
                                                      for (var data
                                                      in myweekList) {
                                                        int index =
                                                        data['index'];
                                                        double amt =
                                                        data['amt'];
                                                        indexAmtMap[index] =
                                                            (indexAmtMap[
                                                            index] ??
                                                                0) +
                                                                amt;
                                                      }

                                                      List<Map<String, dynamic>>
                                                      finalList = [];
                                                      indexAmtMap.forEach(
                                                              (index, totalAmt) {
                                                            finalList.add({
                                                              'index': index,
                                                              'totalamt': totalAmt
                                                            });
                                                          });

                                                      print(finalList);

                                                      double finalTotal = 0;
                                                      for (int k = 0;
                                                      k <
                                                          weeklyChart
                                                              .length;
                                                      k++) {
                                                        for (int i = 0;
                                                        i <
                                                            finalList
                                                                .length;
                                                        i++) {
                                                          if (finalList[i]
                                                          ['index'] ==
                                                              k) {
                                                            finalTotal =
                                                                finalTotal +
                                                                    finalList[i]
                                                                    [
                                                                    'totalamt'];
                                                          }
                                                        }
                                                        DateTime dateTime =
                                                        DateFormat(
                                                            "dd-MM-yyyy")
                                                            .parse(
                                                            weeklyDates[
                                                            k]);

                                                        String formattedDate =
                                                        DateFormat(
                                                            "dd-MM-yyyy")
                                                            .format(
                                                            dateTime);

                                                        weeklyChart[k] =
                                                            ChartData(
                                                                formattedDate,
                                                                finalTotal);
                                                      }

                                                      chartData = weeklyChart;
                                                      setState(() {});
                                                    } else if (dropdownvalue ==
                                                        '1 Month') {
                                                      print(data);
                                                      List monthlyDates = [];
                                                      DateTime selectedOne =
                                                      DateFormat(
                                                          'dd-MM-yyyy')
                                                          .parse(
                                                          selectedDate);
                                                      DateTime todayDate =
                                                      DateTime.now();

                                                      while (selectedOne
                                                          .isBefore(
                                                          todayDate) ||
                                                          selectedOne.month ==
                                                              todayDate.month) {
                                                        monthlyDates.add(
                                                            DateFormat(
                                                                'dd-MM-yyyy')
                                                                .format(
                                                                selectedOne));
                                                        selectedOne = DateTime(
                                                            selectedOne.year,
                                                            selectedOne.month +
                                                                1,
                                                            selectedOne.day);
                                                      }

                                                      // print(monthlyDates);

                                                      List<ChartData>
                                                      monthlyChart = [];
                                                      for (int i = 0;
                                                      i <
                                                          monthlyDates
                                                              .length;
                                                      i++) {
                                                        monthlyChart.add(
                                                            ChartData(
                                                                monthlyDates[i],
                                                                0));
                                                      }

                                                      // data.sort((a, b) => a.date.compareTo(b.date),);

                                                      List myMonthList = [];

                                                      for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                        bool found = false;
                                                        for (int j = 0;
                                                        j <
                                                            monthlyDates
                                                                .length -
                                                                1;
                                                        j++) {
                                                          DateTime startDate =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              monthlyDates[
                                                              j]);
                                                          DateTime endDate = DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              monthlyDates[
                                                              j + 1]);
                                                          DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                          if (date2.isAfter(
                                                              startDate) &&
                                                              date2.isBefore(
                                                                  endDate)) {
                                                            print(myMonthList);
                                                            print('Yes');
                                                            double amountToAdd =
                                                            data[i].categoryType ==
                                                                CategoryType
                                                                    .income
                                                                ? data[i]
                                                                .amount
                                                                : -data[i]
                                                                .amount;

                                                            myMonthList.add({
                                                              'index': j + 1,
                                                              'amt': amountToAdd
                                                            });

                                                            // monthlyChart[j] = ChartData(
                                                            //     monthlyDates[j + 1],
                                                            //     data[i].amount);

                                                            found = true;
                                                            break;
                                                          } else {
                                                            print('no');
                                                          }
                                                        }
                                                        if (!found) {
                                                          print(
                                                              'Item from list2 at index $i is not within any date range of list1.');
                                                        }
                                                      }

                                                      print(myMonthList);

                                                      Map<int, double>
                                                      indexAmtMap = {};
                                                      for (var data
                                                      in myMonthList) {
                                                        int index =
                                                        data['index'];
                                                        double amt =
                                                        data['amt'];
                                                        indexAmtMap[index] =
                                                            (indexAmtMap[
                                                            index] ??
                                                                0) +
                                                                amt;
                                                      }

                                                      List<Map<String, dynamic>>
                                                      finalList = [];
                                                      indexAmtMap.forEach(
                                                              (index, totalAmt) {
                                                            finalList.add({
                                                              'index': index,
                                                              'totalamt': totalAmt
                                                            });
                                                          });

                                                      print(finalList);

                                                      double finalTotal = 0;
                                                      for (int k = 0;
                                                      k <
                                                          monthlyChart
                                                              .length;
                                                      k++) {
                                                        for (int i = 0;
                                                        i <
                                                            finalList
                                                                .length;
                                                        i++) {
                                                          if (finalList[i]
                                                          ['index'] ==
                                                              k) {
                                                            finalTotal =
                                                                finalTotal +
                                                                    finalList[i]
                                                                    [
                                                                    'totalamt'];
                                                          }
                                                        }
                                                        DateTime dateTime =
                                                        DateFormat(
                                                            "dd-MM-yyyy")
                                                            .parse(
                                                            monthlyDates[
                                                            k]);

                                                        String formattedDate =
                                                        DateFormat(
                                                            "dd-MM-yyyy")
                                                            .format(
                                                            dateTime);

                                                        monthlyChart[k] =
                                                            ChartData(
                                                                formattedDate,
                                                                finalTotal);
                                                      }

                                                      chartData = monthlyChart;

                                                      setState(() {});
                                                    } else if (dropdownvalue ==
                                                        '1 Year') {
                                                      List yearlyDates = [];
                                                      DateTime selectedOne =
                                                      DateFormat(
                                                          'dd-MM-yyyy')
                                                          .parse(
                                                          selectedDate);
                                                      DateTime today =
                                                      DateTime.now();
                                                      DateTime currentDate =
                                                      DateTime(
                                                          selectedOne.year,
                                                          selectedOne.month,
                                                          selectedOne.day);

                                                      while (currentDate
                                                          .isBefore(
                                                          today) ||
                                                          (currentDate.year ==
                                                              today.year &&
                                                              currentDate
                                                                  .month ==
                                                                  today.month &&
                                                              currentDate.day ==
                                                                  today.day)) {
                                                        yearlyDates.add(DateFormat(
                                                            'dd-MM-yyyy')
                                                            .format(
                                                            currentDate));
                                                        currentDate = DateTime(
                                                            currentDate.year +
                                                                1,
                                                            selectedOne.month,
                                                            selectedOne.day);
                                                      }
                                                      // print(yearlyDates);
                                                      List<ChartData>
                                                      yearChart = [];
                                                      for (int i = 0;
                                                      i <
                                                          yearlyDates
                                                              .length;
                                                      i++) {
                                                        yearChart.add(ChartData(
                                                            yearlyDates[i],
                                                            300));
                                                      }

                                                      List<ChartData>
                                                      yearlyChart = [];
                                                      for (int i = 0;
                                                      i <
                                                          yearlyDates
                                                              .length;
                                                      i++) {
                                                        yearlyChart.add(
                                                            ChartData(
                                                                yearlyDates[i],
                                                                0));
                                                      }

                                                      // data.sort((a, b) => a.date.compareTo(b.date),);

                                                      List myYearList = [];

                                                      for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                        bool found = false;
                                                        for (int j = 0;
                                                        j <
                                                            yearlyDates
                                                                .length -
                                                                1;
                                                        j++) {
                                                          DateTime startDate =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              yearlyDates[
                                                              j]);
                                                          DateTime endDate =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              yearlyDates[
                                                              j + 1]);
                                                          DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                          if (date2.isAfter(
                                                              startDate) &&
                                                              date2.isBefore(
                                                                  endDate)) {
                                                            print(myYearList);
                                                            print('Yes');
                                                            double amountToAdd =
                                                            data[i].categoryType ==
                                                                CategoryType
                                                                    .income
                                                                ? data[i]
                                                                .amount
                                                                : -data[i]
                                                                .amount;

                                                            myYearList.add({
                                                              'index': j + 1,
                                                              'amt': amountToAdd
                                                            });

                                                            // monthlyChart[j] = ChartData(
                                                            //     monthlyDates[j + 1],
                                                            //     data[i].amount);

                                                            found = true;
                                                            break;
                                                          } else {
                                                            print('no');
                                                          }
                                                        }
                                                        if (!found) {
                                                          print(
                                                              'Item from list2 at index $i is not within any date range of list1.');
                                                        }
                                                      }

                                                      print(myYearList);

                                                      Map<int, double>
                                                      indexAmtMap = {};
                                                      for (var data
                                                      in myYearList) {
                                                        int index =
                                                        data['index'];
                                                        double amt =
                                                        data['amt'];
                                                        indexAmtMap[index] =
                                                            (indexAmtMap[
                                                            index] ??
                                                                0) +
                                                                amt;
                                                      }

                                                      List<Map<String, dynamic>>
                                                      finalList = [];
                                                      indexAmtMap.forEach(
                                                              (index, totalAmt) {
                                                            finalList.add({
                                                              'index': index,
                                                              'totalamt': totalAmt
                                                            });
                                                          });

                                                      print(finalList);

                                                      // for (int i = 0; i < finalList.length; i++) {
                                                      //   yearlyChart[finalList[i]['index']] =
                                                      //       ChartData(
                                                      //           yearlyDates[finalList[i]['index']],
                                                      //           finalList[i]['totalamt']);
                                                      // }
                                                      double finalTotal = 0;
                                                      for (int k = 0;
                                                      k <
                                                          yearlyChart
                                                              .length;
                                                      k++) {
                                                        for (int i = 0;
                                                        i <
                                                            finalList
                                                                .length;
                                                        i++) {
                                                          if (finalList[i]
                                                          ['index'] ==
                                                              k) {
                                                            // weeklyChart[k] = ChartData(
                                                            //     weeklyDates[k],
                                                            //     finalList[i]
                                                            //         ['totalamt']);
                                                            finalTotal =
                                                                finalTotal +
                                                                    finalList[i]
                                                                    [
                                                                    'totalamt'];
                                                          }
                                                        }
                                                        DateTime dateTime =
                                                        DateFormat(
                                                            "dd-MM-yyyy")
                                                            .parse(
                                                            yearlyDates[
                                                            k]);

                                                        String formattedDate =
                                                        DateFormat(
                                                            "dd-MM-yyyy")
                                                            .format(
                                                            dateTime);

                                                        yearlyChart[k] =
                                                            ChartData(
                                                                formattedDate,
                                                                finalTotal);
                                                      }

                                                      chartData = yearlyChart;

                                                      setState(() {});
                                                    }
                                                  }

                                                  setState(() {});
                                                  Navigator.pop(context);
                                                } else {
                                                  List<TransactionModel>
                                                  transactionList = [];
                                                  for (int i = 0;
                                                  i <
                                                      transactionData
                                                          .length;
                                                  i++) {
                                                    if (transactionData[i]
                                                        .category
                                                        .name ==
                                                        selectedCategory) {
                                                      transactionList.add(
                                                          transactionData[i]);
                                                    } else {}
                                                  }
                                                  filterList = transactionList;

                                                  var data = filterList;

                                                  if (cycleOrAllTime ==
                                                      'All Time') {
                                                    allTimeCategoryButton(
                                                        selectedCategory);
                                                  } else {
                                                    if (dropdownvalue ==
                                                        '1 Day') {
                                                      List dailyDates = [];
                                                      DateTime selectedOne =
                                                      DateFormat(
                                                          'dd-MM-yyyy')
                                                          .parse(
                                                          selectedDate);
                                                      DateTime today =
                                                      DateTime.now();
                                                      DateTime currentDate =
                                                      DateTime(
                                                          selectedOne.year,
                                                          selectedOne.month,
                                                          selectedOne.day);

                                                      while (currentDate
                                                          .isBefore(
                                                          today) ||
                                                          (currentDate.year ==
                                                              today.year &&
                                                              currentDate
                                                                  .month ==
                                                                  today.month &&
                                                              currentDate.day ==
                                                                  today.day)) {
                                                        dailyDates.add(DateFormat(
                                                            'dd-MM-yyyy')
                                                            .format(
                                                            currentDate));

                                                        currentDate =
                                                            currentDate.add(
                                                                Duration(
                                                                    days: 1));
                                                      }

                                                      List<ChartData>
                                                      dailyChart = [];

                                                      for (int i = 0;
                                                      i < dailyDates.length;
                                                      i++) {
                                                        dailyChart.add(
                                                            ChartData(
                                                                dailyDates[i],
                                                                0.0));
                                                      }
                                                      double total = 0;
                                                      double dateTotal = 0;
                                                      for (int i = 0;
                                                      i < dailyDates.length;
                                                      i++) {
                                                        String date2 =
                                                        dailyDates[i];

                                                        for (int j = 0;
                                                        j < data.length;
                                                        j++) {
                                                          DateTime localDate =
                                                          DateTime.parse(
                                                              data[j].date);
                                                          String localDate1 =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .format(
                                                              localDate);

                                                          if (localDate1 ==
                                                              date2) {
                                                            dateTotal = 0;

                                                            for (int i = 0;
                                                            i < data.length;
                                                            i++) {
                                                              if (localDate1 ==
                                                                  DateFormat(
                                                                      'dd-MM-yyyy')
                                                                      .format(DateTime.parse(
                                                                      data[i]
                                                                          .date))) {
                                                                if (data[i]
                                                                    .categoryType ==
                                                                    CategoryType
                                                                        .income) {
                                                                  dateTotal =
                                                                      dateTotal +
                                                                          data[i]
                                                                              .amount;
                                                                } else if (data[
                                                                i]
                                                                    .categoryType ==
                                                                    CategoryType
                                                                        .expense) {
                                                                  dateTotal =
                                                                      dateTotal -
                                                                          data[i]
                                                                              .amount;
                                                                } else {}
                                                              }
                                                            }

                                                            // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
                                                            total = total +
                                                                dateTotal;
                                                            break;
                                                          } else {
                                                            print('no');
                                                          }
                                                        }

                                                        dailyChart[i] =
                                                            ChartData(
                                                                dailyDates[i],
                                                                total);
                                                      }

                                                      chartData = dailyChart;
                                                      setState(() {});
                                                    } else if (dropdownvalue ==
                                                        '1 Week') {
                                                      List weeklyDates = [];
                                                      DateTime selectedOne =
                                                      DateFormat(
                                                          'dd-MM-yyyy')
                                                          .parse(
                                                          selectedDate);
                                                      DateTime todayDate =
                                                      DateTime.now();

                                                      while (
                                                      selectedOne.isBefore(
                                                          todayDate)) {
                                                        weeklyDates.add(DateFormat(
                                                            'dd-MM-yyyy')
                                                            .format(
                                                            selectedOne));
                                                        selectedOne =
                                                            selectedOne.add(
                                                                Duration(
                                                                    days: 7));
                                                      }

                                                      // print(weeklyDates);

                                                      List<ChartData>
                                                      weekChart = [];
                                                      for (int i = 0;
                                                      i <
                                                          weeklyDates
                                                              .length;
                                                      i++) {
                                                        weekChart.add(ChartData(
                                                            weeklyDates[i],
                                                            300));
                                                      }

                                                      List<ChartData>
                                                      weeklyChart = [];
                                                      for (int i = 0;
                                                      i <
                                                          weeklyDates
                                                              .length;
                                                      i++) {
                                                        weeklyChart.add(
                                                            ChartData(
                                                                weeklyDates[i],
                                                                0));
                                                      }

                                                      // data.sort((a, b) => a.date.compareTo(b.date),);

                                                      List myweekList = [];

                                                      for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                        bool found = false;
                                                        for (int j = 0;
                                                        j <
                                                            weeklyDates
                                                                .length -
                                                                1;
                                                        j++) {
                                                          DateTime startDate =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              weeklyDates[
                                                              j]);
                                                          DateTime endDate =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              weeklyDates[
                                                              j + 1]);
                                                          DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                          if (date2.isAfter(
                                                              startDate) &&
                                                              date2.isBefore(
                                                                  endDate)) {
                                                            print(myweekList);
                                                            print('Yes');
                                                            double amountToAdd =
                                                            data[i].categoryType ==
                                                                CategoryType
                                                                    .income
                                                                ? data[i]
                                                                .amount
                                                                : -data[i]
                                                                .amount;

                                                            myweekList.add({
                                                              'index': j + 1,
                                                              'amt': amountToAdd
                                                            });

                                                            // monthlyChart[j] = ChartData(
                                                            //     monthlyDates[j + 1],
                                                            //     data[i].amount);

                                                            found = true;
                                                            break;
                                                          } else {
                                                            print('no');
                                                          }
                                                        }
                                                        if (!found) {
                                                          print(
                                                              'Item from list2 at index $i is not within any date range of list1.');
                                                        }
                                                      }

                                                      print(myweekList);

                                                      Map<int, double>
                                                      indexAmtMap = {};
                                                      for (var data
                                                      in myweekList) {
                                                        int index =
                                                        data['index'];
                                                        double amt =
                                                        data['amt'];
                                                        indexAmtMap[index] =
                                                            (indexAmtMap[
                                                            index] ??
                                                                0) +
                                                                amt;
                                                      }

                                                      List<Map<String, dynamic>>
                                                      finalList = [];
                                                      indexAmtMap.forEach(
                                                              (index, totalAmt) {
                                                            finalList.add({
                                                              'index': index,
                                                              'totalamt': totalAmt
                                                            });
                                                          });

                                                      print(finalList);

                                                      double finalTotal = 0;
                                                      for (int k = 0;
                                                      k <
                                                          weeklyChart
                                                              .length;
                                                      k++) {
                                                        for (int i = 0;
                                                        i <
                                                            finalList
                                                                .length;
                                                        i++) {
                                                          if (finalList[i]
                                                          ['index'] ==
                                                              k) {
                                                            finalTotal =
                                                                finalTotal +
                                                                    finalList[i]
                                                                    [
                                                                    'totalamt'];
                                                          }
                                                        }
                                                        DateTime dateTime =
                                                        DateFormat(
                                                            "dd-MM-yyyy")
                                                            .parse(
                                                            weeklyDates[
                                                            k]);

                                                        String formattedDate =
                                                        DateFormat(
                                                            "dd-MM-yyyy")
                                                            .format(
                                                            dateTime);

                                                        weeklyChart[k] =
                                                            ChartData(
                                                                formattedDate,
                                                                finalTotal);
                                                      }

                                                      chartData = weeklyChart;
                                                      setState(() {});
                                                    } else if (dropdownvalue ==
                                                        '1 Month') {
                                                      print(data);
                                                      List monthlyDates = [];
                                                      DateTime selectedOne =
                                                      DateFormat(
                                                          'dd-MM-yyyy')
                                                          .parse(
                                                          selectedDate);
                                                      DateTime todayDate =
                                                      DateTime.now();

                                                      while (selectedOne
                                                          .isBefore(
                                                          todayDate) ||
                                                          selectedOne.month ==
                                                              todayDate.month) {
                                                        monthlyDates.add(
                                                            DateFormat(
                                                                'dd-MM-yyyy')
                                                                .format(
                                                                selectedOne));
                                                        selectedOne = DateTime(
                                                            selectedOne.year,
                                                            selectedOne.month +
                                                                1,
                                                            selectedOne.day);
                                                      }

                                                      // print(monthlyDates);

                                                      List<ChartData>
                                                      monthlyChart = [];
                                                      for (int i = 0;
                                                      i <
                                                          monthlyDates
                                                              .length;
                                                      i++) {
                                                        monthlyChart.add(
                                                            ChartData(
                                                                monthlyDates[i],
                                                                0));
                                                      }

                                                      // data.sort((a, b) => a.date.compareTo(b.date),);

                                                      List myMonthList = [];

                                                      for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                        bool found = false;
                                                        for (int j = 0;
                                                        j <
                                                            monthlyDates
                                                                .length -
                                                                1;
                                                        j++) {
                                                          DateTime startDate =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              monthlyDates[
                                                              j]);
                                                          DateTime endDate = DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              monthlyDates[
                                                              j + 1]);
                                                          DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                          if (date2.isAfter(
                                                              startDate) &&
                                                              date2.isBefore(
                                                                  endDate)) {
                                                            print(myMonthList);
                                                            print('Yes');
                                                            double amountToAdd =
                                                            data[i].categoryType ==
                                                                CategoryType
                                                                    .income
                                                                ? data[i]
                                                                .amount
                                                                : -data[i]
                                                                .amount;

                                                            myMonthList.add({
                                                              'index': j + 1,
                                                              'amt': amountToAdd
                                                            });

                                                            // monthlyChart[j] = ChartData(
                                                            //     monthlyDates[j + 1],
                                                            //     data[i].amount);

                                                            found = true;
                                                            break;
                                                          } else {
                                                            print('no');
                                                          }
                                                        }
                                                        if (!found) {
                                                          print(
                                                              'Item from list2 at index $i is not within any date range of list1.');
                                                        }
                                                      }

                                                      print(myMonthList);

                                                      Map<int, double>
                                                      indexAmtMap = {};
                                                      for (var data
                                                      in myMonthList) {
                                                        int index =
                                                        data['index'];
                                                        double amt =
                                                        data['amt'];
                                                        indexAmtMap[index] =
                                                            (indexAmtMap[
                                                            index] ??
                                                                0) +
                                                                amt;
                                                      }

                                                      List<Map<String, dynamic>>
                                                      finalList = [];
                                                      indexAmtMap.forEach(
                                                              (index, totalAmt) {
                                                            finalList.add({
                                                              'index': index,
                                                              'totalamt': totalAmt
                                                            });
                                                          });

                                                      print(finalList);

                                                      double finalTotal = 0;
                                                      for (int k = 0;
                                                      k <
                                                          monthlyChart
                                                              .length;
                                                      k++) {
                                                        for (int i = 0;
                                                        i <
                                                            finalList
                                                                .length;
                                                        i++) {
                                                          if (finalList[i]
                                                          ['index'] ==
                                                              k) {
                                                            finalTotal =
                                                                finalTotal +
                                                                    finalList[i]
                                                                    [
                                                                    'totalamt'];
                                                          }
                                                        }
                                                        DateTime dateTime =
                                                        DateFormat(
                                                            "dd-MM-yyyy")
                                                            .parse(
                                                            monthlyDates[
                                                            k]);

                                                        String formattedDate =
                                                        DateFormat(
                                                            "dd-MM-yyyy")
                                                            .format(
                                                            dateTime);

                                                        monthlyChart[k] =
                                                            ChartData(
                                                                formattedDate,
                                                                finalTotal);
                                                      }

                                                      chartData = monthlyChart;

                                                      setState(() {});
                                                    } else if (dropdownvalue ==
                                                        '1 Year') {
                                                      List yearlyDates = [];
                                                      DateTime selectedOne =
                                                      DateFormat(
                                                          'dd-MM-yyyy')
                                                          .parse(
                                                          selectedDate);
                                                      DateTime today =
                                                      DateTime.now();
                                                      DateTime currentDate =
                                                      DateTime(
                                                          selectedOne.year,
                                                          selectedOne.month,
                                                          selectedOne.day);

                                                      while (currentDate
                                                          .isBefore(
                                                          today) ||
                                                          (currentDate.year ==
                                                              today.year &&
                                                              currentDate
                                                                  .month ==
                                                                  today.month &&
                                                              currentDate.day ==
                                                                  today.day)) {
                                                        yearlyDates.add(DateFormat(
                                                            'dd-MM-yyyy')
                                                            .format(
                                                            currentDate));
                                                        currentDate = DateTime(
                                                            currentDate.year +
                                                                1,
                                                            selectedOne.month,
                                                            selectedOne.day);
                                                      }
                                                      // print(yearlyDates);
                                                      List<ChartData>
                                                      yearChart = [];
                                                      for (int i = 0;
                                                      i <
                                                          yearlyDates
                                                              .length;
                                                      i++) {
                                                        yearChart.add(ChartData(
                                                            yearlyDates[i],
                                                            300));
                                                      }

                                                      List<ChartData>
                                                      yearlyChart = [];
                                                      for (int i = 0;
                                                      i <
                                                          yearlyDates
                                                              .length;
                                                      i++) {
                                                        yearlyChart.add(
                                                            ChartData(
                                                                yearlyDates[i],
                                                                0));
                                                      }

                                                      // data.sort((a, b) => a.date.compareTo(b.date),);

                                                      List myYearList = [];

                                                      for (int i = 0;
                                                      i < data.length;
                                                      i++) {
                                                        bool found = false;
                                                        for (int j = 0;
                                                        j <
                                                            yearlyDates
                                                                .length -
                                                                1;
                                                        j++) {
                                                          DateTime startDate =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              yearlyDates[
                                                              j]);
                                                          DateTime endDate =
                                                          DateFormat(
                                                              'dd-MM-yyyy')
                                                              .parse(
                                                              yearlyDates[
                                                              j + 1]);
                                                          DateTime date2 =
                                                          DateTime.parse(
                                                              data[i].date);

                                                          if (date2.isAfter(
                                                              startDate) &&
                                                              date2.isBefore(
                                                                  endDate)) {
                                                            print(myYearList);
                                                            print('Yes');
                                                            double amountToAdd =
                                                            data[i].categoryType ==
                                                                CategoryType
                                                                    .income
                                                                ? data[i]
                                                                .amount
                                                                : -data[i]
                                                                .amount;

                                                            myYearList.add({
                                                              'index': j + 1,
                                                              'amt': amountToAdd
                                                            });

                                                            // monthlyChart[j] = ChartData(
                                                            //     monthlyDates[j + 1],
                                                            //     data[i].amount);

                                                            found = true;
                                                            break;
                                                          } else {
                                                            print('no');
                                                          }
                                                        }
                                                        if (!found) {
                                                          print(
                                                              'Item from list2 at index $i is not within any date range of list1.');
                                                        }
                                                      }

                                                      print(myYearList);

                                                      Map<int, double>
                                                      indexAmtMap = {};
                                                      for (var data
                                                      in myYearList) {
                                                        int index =
                                                        data['index'];
                                                        double amt =
                                                        data['amt'];
                                                        indexAmtMap[index] =
                                                            (indexAmtMap[
                                                            index] ??
                                                                0) +
                                                                amt;
                                                      }

                                                      List<Map<String, dynamic>>
                                                      finalList = [];
                                                      indexAmtMap.forEach(
                                                              (index, totalAmt) {
                                                            finalList.add({
                                                              'index': index,
                                                              'totalamt': totalAmt
                                                            });
                                                          });

                                                      print(finalList);

                                                      // for (int i = 0; i < finalList.length; i++) {
                                                      //   yearlyChart[finalList[i]['index']] =
                                                      //       ChartData(
                                                      //           yearlyDates[finalList[i]['index']],
                                                      //           finalList[i]['totalamt']);
                                                      // }
                                                      double finalTotal = 0;
                                                      for (int k = 0;
                                                      k <
                                                          yearlyChart
                                                              .length;
                                                      k++) {
                                                        for (int i = 0;
                                                        i <
                                                            finalList
                                                                .length;
                                                        i++) {
                                                          if (finalList[i]
                                                          ['index'] ==
                                                              k) {
                                                            // weeklyChart[k] = ChartData(
                                                            //     weeklyDates[k],
                                                            //     finalList[i]
                                                            //         ['totalamt']);
                                                            finalTotal =
                                                                finalTotal +
                                                                    finalList[i]
                                                                    [
                                                                    'totalamt'];
                                                          }
                                                        }
                                                        DateTime dateTime =
                                                        DateFormat(
                                                            "dd-MM-yyyy")
                                                            .parse(
                                                            yearlyDates[
                                                            k]);

                                                        String formattedDate =
                                                        DateFormat(
                                                            "dd-MM-yyyy")
                                                            .format(
                                                            dateTime);

                                                        yearlyChart[k] =
                                                            ChartData(
                                                                formattedDate,
                                                                finalTotal);
                                                      }

                                                      chartData = yearlyChart;

                                                      setState(() {});
                                                    }
                                                  }






                                                  setState(() {});
                                                  Navigator.pop(context);
                                                }


                                              },
                                              child: Container(
                                                width: 170,
                                                decoration: BoxDecoration(
                                                  color: AppTheme.chartColor
                                                      .withOpacity(0.3),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                    7,
                                                  ),
                                                ),
                                                alignment: Alignment.center,
                                                height: 45,
                                                child: Text(
                                                  'Apply',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 50,
                        decoration: BoxDecoration(
                            color: selectedCategory != 'All'
                                ? Color(0xff563e5c)
                                : Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.filter_alt_rounded,
                          color: selectedCategory != 'All'
                              ? Color(0xfff9d8fe)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
              (selectedCategory != 'All')
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          var data = TransactionDB
                              .instance.transactionListNotifier.value;
                          filterList = data;
                          selectedCategory = 'All';
                          selected = 'All';
                          selectedCategoryIndex = 0;
                          if (cycleOrAllTime == 'All Time') {
                            allTimeButton();
                          } else {
                            if (dropdownvalue == '1 Day') {
                              List dailyDates = [];
                              DateTime selectedOne =
                              DateFormat('dd-MM-yyyy')
                                  .parse(selectedDate);
                              DateTime today = DateTime.now();
                              DateTime currentDate = DateTime(
                                  selectedOne.year,
                                  selectedOne.month,
                                  selectedOne.day);

                              while (currentDate.isBefore(today) ||
                                  (currentDate.year == today.year &&
                                      currentDate.month == today.month &&
                                      currentDate.day == today.day)) {
                                dailyDates.add(DateFormat('dd-MM-yyyy')
                                    .format(currentDate));

                                currentDate =
                                    currentDate.add(Duration(days: 1));
                              }

                              List<ChartData> dailyChart = [];

                              for (int i = 0;
                              i < dailyDates.length;
                              i++) {
                                dailyChart
                                    .add(ChartData(dailyDates[i], 0.0));
                              }
                              double total = 0;
                              double dateTotal = 0;
                              for (int i = 0;
                              i < dailyDates.length;
                              i++) {
                                String date2 = dailyDates[i];

                                for (int j = 0; j < data.length; j++) {
                                  DateTime localDate =
                                  DateTime.parse(data[j].date);
                                  String localDate1 =
                                  DateFormat('dd-MM-yyyy')
                                      .format(localDate);

                                  if (localDate1 == date2) {
                                    dateTotal = 0;

                                    for (int i = 0;
                                    i < data.length;
                                    i++) {
                                      if (localDate1 ==
                                          DateFormat('dd-MM-yyyy').format(
                                              DateTime.parse(
                                                  data[i].date))) {
                                        if (data[i].categoryType ==
                                            CategoryType.income) {
                                          dateTotal =
                                              dateTotal + data[i].amount;
                                        } else if (data[i].categoryType ==
                                            CategoryType.expense) {
                                          dateTotal =
                                              dateTotal - data[i].amount;
                                        } else {}
                                      }
                                    }

                                    // dailyChart[i] = ChartData(dailyDates[i], dateTotal);
                                    total = total + dateTotal;
                                    break;
                                  } else {
                                    print('no');
                                  }
                                }

                                dailyChart[i] =
                                    ChartData(dailyDates[i], total);
                              }

                              chartData = dailyChart;
                              setState(() {});
                            } else if (dropdownvalue == '1 Week') {
                              List weeklyDates = [];
                              DateTime selectedOne =
                              DateFormat('dd-MM-yyyy')
                                  .parse(selectedDate);
                              DateTime todayDate = DateTime.now();

                              while (selectedOne.isBefore(todayDate)) {
                                weeklyDates.add(DateFormat('dd-MM-yyyy')
                                    .format(selectedOne));
                                selectedOne =
                                    selectedOne.add(Duration(days: 7));
                              }

                              // print(weeklyDates);

                              List<ChartData> weekChart = [];
                              for (int i = 0;
                              i < weeklyDates.length;
                              i++) {
                                weekChart
                                    .add(ChartData(weeklyDates[i], 300));
                              }

                              List<ChartData> weeklyChart = [];
                              for (int i = 0;
                              i < weeklyDates.length;
                              i++) {
                                weeklyChart
                                    .add(ChartData(weeklyDates[i], 0));
                              }

                              // data.sort((a, b) => a.date.compareTo(b.date),);

                              List myweekList = [];

                              for (int i = 0; i < data.length; i++) {
                                bool found = false;
                                for (int j = 0;
                                j < weeklyDates.length - 1;
                                j++) {
                                  DateTime startDate =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(weeklyDates[j]);
                                  DateTime endDate =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(weeklyDates[j + 1]);
                                  DateTime date2 =
                                  DateTime.parse(data[i].date);

                                  if (date2.isAfter(startDate) &&
                                      date2.isBefore(endDate)) {
                                    print(myweekList);
                                    print('Yes');
                                    double amountToAdd =
                                    data[i].categoryType ==
                                        CategoryType.income
                                        ? data[i].amount
                                        : -data[i].amount;

                                    myweekList.add({
                                      'index': j + 1,
                                      'amt': amountToAdd
                                    });

                                    // monthlyChart[j] = ChartData(
                                    //     monthlyDates[j + 1],
                                    //     data[i].amount);

                                    found = true;
                                    break;
                                  } else {
                                    print('no');
                                  }
                                }
                                if (!found) {
                                  print(
                                      'Item from list2 at index $i is not within any date range of list1.');
                                }
                              }

                              print(myweekList);

                              Map<int, double> indexAmtMap = {};
                              for (var data in myweekList) {
                                int index = data['index'];
                                double amt = data['amt'];
                                indexAmtMap[index] =
                                    (indexAmtMap[index] ?? 0) + amt;
                              }

                              List<Map<String, dynamic>> finalList = [];
                              indexAmtMap.forEach((index, totalAmt) {
                                finalList.add({
                                  'index': index,
                                  'totalamt': totalAmt
                                });
                              });

                              print(finalList);

                              double finalTotal = 0;
                              for (int k = 0;
                              k < weeklyChart.length;
                              k++) {
                                for (int i = 0;
                                i < finalList.length;
                                i++) {
                                  if (finalList[i]['index'] == k) {
                                    finalTotal = finalTotal +
                                        finalList[i]['totalamt'];
                                  }
                                }
                                DateTime dateTime =
                                DateFormat("dd-MM-yyyy")
                                    .parse(weeklyDates[k]);

                                String formattedDate =
                                DateFormat("dd-MM-yyyy")
                                    .format(dateTime);

                                weeklyChart[k] =
                                    ChartData(formattedDate, finalTotal);
                              }

                              chartData = weeklyChart;
                              setState(() {});
                            } else if (dropdownvalue == '1 Month') {
                              print(data);
                              List monthlyDates = [];
                              DateTime selectedOne =
                              DateFormat('dd-MM-yyyy')
                                  .parse(selectedDate);
                              DateTime todayDate = DateTime.now();

                              while (selectedOne.isBefore(todayDate) ||
                                  selectedOne.month == todayDate.month) {
                                monthlyDates.add(DateFormat('dd-MM-yyyy')
                                    .format(selectedOne));
                                selectedOne = DateTime(
                                    selectedOne.year,
                                    selectedOne.month + 1,
                                    selectedOne.day);
                              }

                              // print(monthlyDates);

                              List<ChartData> monthlyChart = [];
                              for (int i = 0;
                              i < monthlyDates.length;
                              i++) {
                                monthlyChart
                                    .add(ChartData(monthlyDates[i], 0));
                              }

                              // data.sort((a, b) => a.date.compareTo(b.date),);

                              List myMonthList = [];

                              for (int i = 0; i < data.length; i++) {
                                bool found = false;
                                for (int j = 0;
                                j < monthlyDates.length - 1;
                                j++) {
                                  DateTime startDate =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(monthlyDates[j]);
                                  DateTime endDate =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(monthlyDates[j + 1]);
                                  DateTime date2 =
                                  DateTime.parse(data[i].date);

                                  if (date2.isAfter(startDate) &&
                                      date2.isBefore(endDate)) {
                                    print(myMonthList);
                                    print('Yes');
                                    double amountToAdd =
                                    data[i].categoryType ==
                                        CategoryType.income
                                        ? data[i].amount
                                        : -data[i].amount;

                                    myMonthList.add({
                                      'index': j + 1,
                                      'amt': amountToAdd
                                    });

                                    // monthlyChart[j] = ChartData(
                                    //     monthlyDates[j + 1],
                                    //     data[i].amount);

                                    found = true;
                                    break;
                                  } else {
                                    print('no');
                                  }
                                }
                                if (!found) {
                                  print(
                                      'Item from list2 at index $i is not within any date range of list1.');
                                }
                              }

                              print(myMonthList);

                              Map<int, double> indexAmtMap = {};
                              for (var data in myMonthList) {
                                int index = data['index'];
                                double amt = data['amt'];
                                indexAmtMap[index] =
                                    (indexAmtMap[index] ?? 0) + amt;
                              }

                              List<Map<String, dynamic>> finalList = [];
                              indexAmtMap.forEach((index, totalAmt) {
                                finalList.add({
                                  'index': index,
                                  'totalamt': totalAmt
                                });
                              });

                              print(finalList);

                              double finalTotal = 0;
                              for (int k = 0;
                              k < monthlyChart.length;
                              k++) {
                                for (int i = 0;
                                i < finalList.length;
                                i++) {
                                  if (finalList[i]['index'] == k) {
                                    finalTotal = finalTotal +
                                        finalList[i]['totalamt'];
                                  }
                                }
                                DateTime dateTime =
                                DateFormat("dd-MM-yyyy")
                                    .parse(monthlyDates[k]);

                                String formattedDate =
                                DateFormat("dd-MM-yyyy")
                                    .format(dateTime);

                                monthlyChart[k] =
                                    ChartData(formattedDate, finalTotal);
                              }

                              chartData = monthlyChart;

                              setState(() {});
                            } else if (dropdownvalue == '1 Year') {
                              List yearlyDates = [];
                              DateTime selectedOne =
                              DateFormat('dd-MM-yyyy')
                                  .parse(selectedDate);
                              DateTime today = DateTime.now();
                              DateTime currentDate = DateTime(
                                  selectedOne.year,
                                  selectedOne.month,
                                  selectedOne.day);

                              while (currentDate.isBefore(today) ||
                                  (currentDate.year == today.year &&
                                      currentDate.month == today.month &&
                                      currentDate.day == today.day)) {
                                yearlyDates.add(DateFormat('dd-MM-yyyy')
                                    .format(currentDate));
                                currentDate = DateTime(
                                    currentDate.year + 1,
                                    selectedOne.month,
                                    selectedOne.day);
                              }
                              // print(yearlyDates);
                              List<ChartData> yearChart = [];
                              for (int i = 0;
                              i < yearlyDates.length;
                              i++) {
                                yearChart
                                    .add(ChartData(yearlyDates[i], 300));
                              }

                              List<ChartData> yearlyChart = [];
                              for (int i = 0;
                              i < yearlyDates.length;
                              i++) {
                                yearlyChart
                                    .add(ChartData(yearlyDates[i], 0));
                              }

                              // data.sort((a, b) => a.date.compareTo(b.date),);

                              List myYearList = [];

                              for (int i = 0; i < data.length; i++) {
                                bool found = false;
                                for (int j = 0;
                                j < yearlyDates.length - 1;
                                j++) {
                                  DateTime startDate =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(yearlyDates[j]);
                                  DateTime endDate =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(yearlyDates[j + 1]);
                                  DateTime date2 =
                                  DateTime.parse(data[i].date);

                                  if (date2.isAfter(startDate) &&
                                      date2.isBefore(endDate)) {
                                    print(myYearList);
                                    print('Yes');
                                    double amountToAdd =
                                    data[i].categoryType ==
                                        CategoryType.income
                                        ? data[i].amount
                                        : -data[i].amount;

                                    myYearList.add({
                                      'index': j + 1,
                                      'amt': amountToAdd
                                    });

                                    // monthlyChart[j] = ChartData(
                                    //     monthlyDates[j + 1],
                                    //     data[i].amount);

                                    found = true;
                                    break;
                                  } else {
                                    print('no');
                                  }
                                }
                                if (!found) {
                                  print(
                                      'Item from list2 at index $i is not within any date range of list1.');
                                }
                              }

                              print(myYearList);

                              Map<int, double> indexAmtMap = {};
                              for (var data in myYearList) {
                                int index = data['index'];
                                double amt = data['amt'];
                                indexAmtMap[index] =
                                    (indexAmtMap[index] ?? 0) + amt;
                              }

                              List<Map<String, dynamic>> finalList = [];
                              indexAmtMap.forEach((index, totalAmt) {
                                finalList.add({
                                  'index': index,
                                  'totalamt': totalAmt
                                });
                              });

                              print(finalList);

                              // for (int i = 0; i < finalList.length; i++) {
                              //   yearlyChart[finalList[i]['index']] =
                              //       ChartData(
                              //           yearlyDates[finalList[i]['index']],
                              //           finalList[i]['totalamt']);
                              // }
                              double finalTotal = 0;
                              for (int k = 0;
                              k < yearlyChart.length;
                              k++) {
                                for (int i = 0;
                                i < finalList.length;
                                i++) {
                                  if (finalList[i]['index'] == k) {
                                    // weeklyChart[k] = ChartData(
                                    //     weeklyDates[k],
                                    //     finalList[i]
                                    //         ['totalamt']);
                                    finalTotal = finalTotal +
                                        finalList[i]['totalamt'];
                                  }
                                }
                                DateTime dateTime =
                                DateFormat("dd-MM-yyyy")
                                    .parse(yearlyDates[k]);

                                String formattedDate =
                                DateFormat("dd-MM-yyyy")
                                    .format(dateTime);

                                yearlyChart[k] =
                                    ChartData(formattedDate, finalTotal);
                              }

                              chartData = yearlyChart;

                              setState(() {});
                            }
                          }
                          setState(() {});
                        },
                        child: Icon(
                          Icons.close,
                          color: AppTheme.white,
                          size: 16,
                        )),
                    SizedBox(width: 5),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        border: Border.all(
                            color: AppTheme.chartColor, width: 0.5),
                        borderRadius: BorderRadius.circular(
                          7,
                        ),
                      ),
                      alignment: Alignment.center,
                      height: 30,
                      child: Text(
                        selectedCategory,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
                  : SizedBox(),

              SizedBox(
                height: 10,
              ),

              ListView.separated(
                  itemCount: filterList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Amount : ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${currencySymboleUpdate.value}${filterList[index].amount}',
                                style: TextStyle(
                                    color: filterList[index].categoryType ==
                                        CategoryType.income
                                        ? Colors.green
                                        : Colors.red),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Transaction Type : ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${filterList[index].category.name}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Date : ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${filterList[index].date}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Category : ',
                                style: TextStyle(color: Colors.white),
                              ),
                              filterList[index].categoryType ==
                                  CategoryType.income
                                  ? Text(
                                'Income',
                                style: TextStyle(color: Colors.white),
                              )
                                  : Text(
                                'Expense',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
