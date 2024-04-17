import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:pokercat/addexpense/db/functions/category_functions.dart';
import 'package:pokercat/addexpense/db/functions/currency_function.dart';
import 'package:pokercat/addexpense/db/functions/transaction_function.dart';
import 'package:pokercat/addexpense/db/models/category/category_model_db.dart';
import 'package:pokercat/addexpense/db/models/transactions/transaction_model_db.dart';
import 'package:pokercat/addexpense/widget/transaction_helper.dart';
import 'package:pokercat/constant.dart';
import 'package:table_calendar/table_calendar.dart';
import '../global/component/appbar.dart';

// ignore: must_be_immutable
class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String selectedMonth = '';
  void filterTransactionsByMonth(String month) {
    setState(() {
      selectedMonth = month;
    });
  }
  NumberFormat formatter = NumberFormat('#,##0');
  DateTimeRange selectedDate = SelectDate().currentDateForCalenderSelection();

  @override
  void initState() {
    TransactionDB.instance.refresh();
    TransactionDB.instance.getTransactionsForCurrentMonth();
    CategoryDB.instance.getAllCategory();
    super.initState();
  }

  ValueNotifier<double> incomeCustomDateNotifier = ValueNotifier(0);
  ValueNotifier<double> expenseCustomDateNotifier = ValueNotifier(0);
  ValueNotifier<double> totalCustomDateNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    List<String> months = List.generate(12, (index) {
      return DateFormat('MMMM').format(DateTime(2024, index + 1, 1));
    });
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
      appBar: Appbar(
        titleStr: 'Income and expense',
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           //--------------------------------------------왼쪽 뾰족이 버튼---------------------------------------
          //           IconButton(
          //             alignment: Alignment.centerRight,
          //             icon: const Icon(Icons.arrow_back_ios,
          //                 color: AppTheme.pcTextSecondayColor, size: 16),
          //             onPressed: () {
          //               setState(
          //                 () {
          //                   selectedDate = SelectDate().selectePreviousMonth();
          //                 },
          //               );
          //               TransactionDB.instance.filterForHome(
          //                   selectedDate.start, selectedDate.end);
          //               TransactionDB.instance.getTransactionsForCurrentMonth();
          //             },
          //           ),
          //           //--------------------------------------------가운데 날짜 텍스트 버튼---------------------------------------
          //           TextButton(
          //             style: TextButton.styleFrom(
          //                 foregroundColor: AppTheme.pcScafoldColor),
          //             onPressed: () async {
          //               var daterange =
          //                   SelectDate().currentDateForCalenderSelection();
          //               DateTimeRange? picked = await showDateRangePicker(
          //                   context: context,
          //                   builder: (context, child) {
          //                     return Theme(
          //                       data: ThemeData.dark().copyWith(
          //                           colorScheme: const ColorScheme.dark(
          //                               onPrimary: AppTheme.pcAppBarColor,
          //                               onSurface: AppTheme.pcTextSecondayColor,
          //                               primary: AppTheme.pcTextTertiaryColor),
          //                           dialogBackgroundColor:
          //                               AppTheme.pcAppBarColor),
          //                       child: child!,
          //                     );
          //                   },
          //                   firstDate: DateTime(DateTime.now().year - 1),
          //                   lastDate: DateTime.now(),
          //                   initialDateRange: daterange);
          //               if (picked != null) {
          //                 CategoryDB.instance.getAllCategory();
          //                 TransactionDB.instance
          //                     .filterForHome(picked.start, picked.end);
          //                 setState(() {
          //                   selectedDate = picked;
          //                 });
          //               }
          //               TransactionDB.instance.getTransactionsForCurrentMonth();
          //             },
          //             child: Text(
          //               "${DateFormat('MM.dd').format(selectedDate.start)} - ${DateFormat('MM.dd').format(selectedDate.end)}",
          //               style: TextStyle(
          //                   fontSize: fontSize,
          //                   fontWeight: FontWeight.bold,
          //                   color: AppTheme.pcTextSecondayColor),
          //             ),
          //           ),
          //           //--------------------------------------------오른쪽 뾰족이 버튼---------------------------------------
          //           IconButton(
          //             alignment: Alignment.centerLeft,
          //             icon: const Icon(Icons.arrow_forward_ios,
          //                 color: AppTheme.pcTextSecondayColor, size: 16),
          //             onPressed: () {
          //               setState(
          //                 () {
          //                   selectedDate = SelectDate().selecteNextMonth();
          //                 },
          //               );
          //               TransactionDB.instance.refresh();
          //             },
          //           ),
          //         ],
          //       ),
          //       const Spacer(
          //         flex: 1,
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            height: 50,
            child: Row(
              children: [
                IconButton(
                  alignment: Alignment.centerRight,
                  icon: const Icon(Icons.arrow_back_ios,
                      color: AppTheme.pcTextSecondayColor, size: 16),
                  onPressed: () {
                    setState(
                      () {
                        selectedDate = SelectDate().selectePreviousMonth();
                      },
                    );
                    TransactionDB.instance
                        .filterForHome(selectedDate.start, selectedDate.end);
                    TransactionDB.instance.getTransactionsForCurrentMonth();
                  },
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: months.map((month) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  filterTransactionsByMonth(selectedMonth);
                                },
                                child: Text(
                                  //"${DateFormat(month).format(selectedDate.start)} - ${DateFormat(month).format(selectedDate.end)}",
                                   month,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                IconButton(
                  alignment: Alignment.centerLeft,
                  icon: const Icon(Icons.arrow_forward_ios,
                      color: AppTheme.pcTextSecondayColor, size: 16),
                  onPressed: () {
                    setState(
                      () {
                        selectedDate = SelectDate().selecteNextMonth();
                      },
                    );
                    TransactionDB.instance.refresh();
                  },
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
              if (selectedMonth.isNotEmpty) {
                mapList.removeWhere((key, value) => !key.startsWith(selectedMonth));
              }
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
                                mapList[keys[index]]!;
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
                                            newList: mapList[keys[index]]!),
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
