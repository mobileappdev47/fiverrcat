import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pokercat/addexpense/db/functions/category_functions.dart';
import 'package:pokercat/addexpense/db/functions/currency_function.dart';
import 'package:pokercat/addexpense/db/functions/transaction_function.dart';
import 'package:pokercat/addexpense/db/models/category/category_model_db.dart';
import 'package:pokercat/addexpense/db/models/transactions/transaction_model_db.dart';
import 'package:pokercat/addexpense/widget/transaction_helper.dart';
import 'package:pokercat/constant.dart';
import 'package:pokercat/imports.dart';
import 'package:pokercat/pages/bankroll.dart';
import '../global/component/appbar.dart';

// ignore: must_be_immutable
class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  NumberFormat formatter = NumberFormat('#,##0');
  DateTimeRange selectedDate = SelectDate().currentDateForCalenderSelection();

  List<String> months = [

  ];

  List<int> years = [];



 getMonthNames() {
   months.clear();
   years.clear();

    DateTime currentMonth = DateTime.now();

    // Add nine months before the current month
    for (int i = 9; i > 0; i--) {
      DateTime month = DateTime(currentMonth.year, currentMonth.month - i);
      String monthName = DateFormat.MMMM().format(month) + " ${month.year}";
      months.add(monthName);
      int year = month.year;

      if(years.contains(year)==false){
        years.add(year);
      }


    }

    // Add the current month
    String currentMonthName = DateFormat.MMMM().format(currentMonth)+ " ${currentMonth.year}";
    months.add(currentMonthName);
     int year = currentMonth.year;
   if(years.contains(year)==false){
     years.add(year);
   }

    // Add nine months after the current month
    for (int i = 1; i <= 9; i++) {
      DateTime month = DateTime(currentMonth.year, currentMonth.month + i);
      String monthName = DateFormat.MMMM().format(month)+ " ${month.year}";
      months.add(monthName);
      int year = month.year;
      if(years.contains(year)==false){
        years.add(year);
      }
    }

   print(months);
    print(years);
  }




  @override
  void initState() {


   getMonthNames();

    // years.forEach((element) {
    //   if(element == DateTime.now().year)
    //     {
    //       if(years.indexOf(element) ==0)
    //         {
    //           indexAll = DateTime.now().month-1;
    //         }
    //       else if(years.indexOf(element) ==1)
    //       {
    //         indexAll =( DateTime.now().month-1) +12;
    //       }
    //       else
    //         {
    //           indexAll = (DateTime.now().month-1 )+24;
    //         }
    //     }
    // });

    selectedDate = SelectDate()
        .selectMonth(DateTime.now().month, DateTime.now().year);
    TransactionDB.instance.filterForHome(
        selectedDate.start, selectedDate.end);
    TransactionDB.instance.refresh();
    TransactionDB.instance.getTransactionsForCurrentMonth();

    CategoryDB.instance.getAllCategory();
    super.initState();
  }

  ValueNotifier<double> incomeCustomDateNotifier = ValueNotifier(0);
  ValueNotifier<double> expenseCustomDateNotifier = ValueNotifier(0);
  ValueNotifier<double> totalCustomDateNotifier = ValueNotifier(0);
  PageController scrollController = PageController();
  // int indexAll = DateTime.now().month;
  int indexAll = 9;


  int getMonthIndex(String monthName) {
    switch (monthName.toLowerCase()) {
      case 'january':
        return 1;
      case 'february':
        return 2;
      case 'march':
        return 3;
      case 'april':
        return 4;
      case 'may':
        return 5;
      case 'june':
        return 6;
      case 'july':
        return 7;
      case 'august':
        return 8;
      case 'september':
        return 9;
      case 'october':
        return 10;
      case 'november':
        return 11;
      case 'december':
        return 12;
      default:
        return -1; // Return -1 for invalid month names
    }
  }

   @override
   Widget build(BuildContext context) {
   print(Get.width);

    double initialScrollOffset = ((19/1.75) * 85) - (MediaQuery.of(context).size.width/ 2) + (85/ 2);


    final double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = 13;
    if (screenWidth > 350) {
      fontSize = 16;
    }
    TransactionDB.instance.getTransactionsForCurrentMonth();
    CategoryDB.instance.getAllCategory();

    getCurrency();

    double incomeData = 0;
    double expenseData = 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppTheme.pcPrimaryColor,
      appBar: const Appbar(
        titleStr: 'Income and expense',
      ),
      body: Column(
        children: [

          SizedBox(
            height: 65,
            child: Row(
              children: [

                Expanded(
                  child: ListView.builder(

                    controller:  ScrollController(initialScrollOffset: initialScrollOffset),
                    itemCount: months.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      // int monthIndex = index % months.length;
                      // int yearIndex = index ~/ months.length;
                      // int year = years[yearIndex];
                      // String month = months[monthIndex];

                      String currentYear = DateTime.now().year.toString();

                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                int  selectedYear = int.parse(months[index].toString().split(' ').last);
                                String  selectedMonth = months[index].toString().split(' ').first;

                                int monthIndex = getMonthIndex(selectedMonth);
                                 print(selectedYear );
                                 print(monthIndex );
                                DateTime firstDateOfMonth = DateTime(selectedYear, monthIndex, 1);

                                DateTime lastDateOfMonth = DateTime(selectedYear, monthIndex + 1, 0);

                                print("$firstDateOfMonth" + '$lastDateOfMonth');

                              //  if (selectedYear <= DateTime.now().year) {
                                  setState(() {
                                    indexAll = index;
                                    TransactionDB.instance.filterForHome(firstDateOfMonth, lastDateOfMonth);
                                    TransactionDB.instance.getTransactionsForCurrentMonth();
                                  });
                               // }

                                // if (year != 2025) {
                                //   setState(() {
                                //     indexAll = index;
                                //     selectedDate = SelectDate().selectMonth(monthIndex + 1, year);
                                //     TransactionDB.instance.filterForHome(selectedDate.start, selectedDate.end);
                                //     TransactionDB.instance.getTransactionsForCurrentMonth();
                                //   });
                                // }

                              },
                              child: SizedBox(
                                width : 85,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    (currentYear == months[index].split(' ').last)?     SizedBox(height: 12,):SizedBox(),
                                    Text(
                                      months[index].split(' ').first,
                                      // months[index],
                                      style: const TextStyle(color: Colors.white),
                                    ),

                                    (currentYear == months[index].split(' ').last)? SizedBox():  Text(
                                      months[index].split(' ').last,
                                      // months[index],
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                   Spacer(),
                                    indexAll == index
                                        ? Container(
                                            height: 1,

                                            color: Colors.white,
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          //------------------------------------Income, Expense and Balance Preview --------------------------
          ValueListenableBuilder(
            valueListenable:
                TransactionDB.instance.transactionMonthListNotifier,
            builder: (context, value, child) {
              Map<String, List<TransactionModel>> mapList =
                  SelectDate().sortByDate(value);

              incomeData = mapList.values.fold(0, (previousValue, element) {
                for (var transaction in element) {
                  if (transaction.categoryType == CategoryType.income) {
                    previousValue += transaction.amount;
                  }
                }
                return previousValue;
              });
              expenseData = mapList.values.fold(0, (previousValue, element) {
                for (var transaction in element) {
                  if (transaction.categoryType == CategoryType.expense) {
                    previousValue += transaction.amount;
                  }
                }
                return previousValue;
              });
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_drop_up_outlined,
                        color: AppTheme.pcTextIncomeColor,
                      ),
                      Text(
                        '${currencySymboleUpdate.value} ${formatter.format(incomeData)}',
                        style: TextStyle(
                            color: AppTheme.pcTextIncomeColor, fontSize: 13),
                      )
                    ],
                  ),
                  //------------------------------Expense-------------------------
                  Row(
                    children: [
                      const Icon(Icons.arrow_drop_down_outlined,
                          color: AppTheme.pcTextExpenseColor),
                      Text(
                        '${currencySymboleUpdate.value} ${formatter.format(expenseData)}',
                        style: TextStyle(
                          color: AppTheme.pcTextExpenseColor,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                  // -------------------------------- Balance Start ----------------------------------------------
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '=  ${currencySymboleUpdate.value} ${formatter.format(incomeData - expenseData)}',
                            style: const TextStyle(
                              color: AppTheme.pcTextTertiaryColor,
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  //------------------------------------Income, Expense and Balance Preview End --------------------------
                ],
              );
            },
          ),
          // ----------------------------------- Transaction History ----------------------------------------
          ValueListenableBuilder(
            valueListenable:
                TransactionDB.instance.transactionMonthListNotifier,
            builder: (context, newList, child) {
              Map<String, List<TransactionModel>> mapList =
                  SelectDate().sortByDate(newList);
              List<String> keys = mapList.keys.toList();
              print('Keys before filtering: $mapList');

              return keys.isNotEmpty
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 9),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: keys.length,
                          itemBuilder: (context, index) {
                            List<TransactionModel> calculationList =
                                mapList[keys[index]] ?? [];
                            double incomeDataForDay = calculationList.fold(0,
                                (previousValue, transaction) {
                              if (transaction.categoryType ==
                                  CategoryType.income) {
                                return previousValue + transaction.amount;
                              }
                              return previousValue;
                            });
                            double expenseDataForDay = calculationList.fold(0,
                                (previousValue, transaction) {
                              if (transaction.categoryType ==
                                  CategoryType.expense) {
                                previousValue += transaction.amount;
                              }
                              return previousValue;
                            });
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppTheme.pcTransactionColor,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: AppTheme.pcShadowColor,
                                        spreadRadius: 0,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 105,
                                                  //width: 65,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: AppTheme
                                                        .pcTextLinkColor2,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      DateFormat('yyyy.MM.dd ')
                                                              .format(DateTime
                                                                  .parse(keys[
                                                                      index]))
                                                              .toString() +
                                                          DateFormat('EEE')
                                                              .format(DateTime
                                                                  .parse(keys[
                                                                      index]))
                                                              .toString(),
                                                      style: const TextStyle(
                                                          color: AppTheme
                                                              .pcTextSecondayColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '+ ${currencySymboleUpdate.value} ${formatter.format(incomeDataForDay)}',
                                                      style: const TextStyle(
                                                          color: AppTheme
                                                              .pcTextIncomeColor,
                                                          fontSize: 13),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '- ${currencySymboleUpdate.value} ${formatter.format(expenseDataForDay)}',
                                                      style: const TextStyle(
                                                          color: AppTheme
                                                              .pcTextExpenseColor,
                                                          fontSize: 13),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                              color: AppTheme
                                                  .pcSecondaryDividerColor,
                                              thickness: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: TransactionsCategory(
                                            newList:
                                                mapList[keys[index]] ?? []),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : Center(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Lottie.asset('assets/noSearch.json'),
                          ),
                          const Text(
                            "No data available..!",
                            style: TextStyle(
                                fontSize: 15,
                                color: AppTheme.pcTextTertiaryColor),
                          ),
                        ],
                      ),
                    );
            },
          ),
          // ----------------------------------- Transaction History End----------------------------------------
        ],
      ),
    );
  }
}
