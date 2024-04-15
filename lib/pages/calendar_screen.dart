import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pokercat/pages/app_settings_screen/calendar_utils.dart';
import 'package:table_calendar/table_calendar.dart';
import '../addexpense/db/functions/category_functions.dart';
import '../addexpense/db/functions/currency_function.dart';
import '../addexpense/db/functions/transaction_function.dart';
import '../addexpense/db/models/category/category_model_db.dart';
import '../addexpense/db/models/transactions/transaction_model_db.dart';
import '../addexpense/widget/transaction_helper.dart';
import '../constant.dart';

ValueNotifier<double> incomeCurrentMonthNotifier = ValueNotifier(0);
ValueNotifier<double> expenseCurrentMonthNotifier = ValueNotifier(0);
ValueNotifier<double> totalCurrentMonthNotifier = ValueNotifier(0);

// ignore: must_be_immutable
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int myNumber = 0;
  //-----------calendar ----------------
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  //-----------------------------------

  NumberFormat formatter = NumberFormat('#,##0');
  DateTimeRange selectedDateRange = SelectDate().currentDateForCalenderSelection();

  DateTime myChosenDate = DateTime.now();

  @override
  void initState() {
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    TransactionDB.instance.refresh();
    super.initState();
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }



  Map<DateTime, List<Event>> events = {
    DateTime.utc(2024,3,14) : [ Event('title3') ],
  };

  Future<List<TransactionModel>> getTransactions() async {
    final now = DateTime.now();
    final box = Hive.box<TransactionModel>(TRANSACTION_DB_NAME);
    final results = box.values;
    return results.toList();
  }

  // Map<String, List<TransactionModel>> transactionByDate(DateTime day) {
  //   final box = Hive.box<TransactionModel>(TRANSACTION_DB_NAME);
  //   final results = box.values;
  //   Map<String, List<TransactionModel>> mapList = {};
  //   for (TransactionModel model in results) {
  //
  //     if (!mapList.containsKey(model.date)) {
  //       mapList[model.date] = [];
  //     }
  //     mapList[model.date]!.add(model);
  //   }
  //   print('mapList===${mapList}');
  //   return mapList;
  // }

  List<Event> _getEventsForDay(DateTime day) {

    String dayString = DateFormat('yyyy-MM-dd').format(day).toString();

    // return events[day] ?? [];
     return  [];
  }


  // List<Event> _getEventsForDay(DateTime day) {
  //   String myChosenDateString = DateFormat('yyyy-MM-dd').format(myChosenDate).toString();
  //   // Implementation example
  //   Map<String, List<TransactionModel>> mapListForMarker ;
  //   return kEvents[day] ?? [];
  // }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }


  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {

          myNumber = myNumber+1;
       print('myNumber= ${myNumber}');
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
        selectedDateRange = DateTimeRange(start: selectedDay, end: selectedDay);
        myChosenDate = selectedDay;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
    TransactionDB.instance.filterByDate(selectedDateRange.start, selectedDateRange.end);
    // print('selectedDate.start=${selectedDate.start},,fjsxkdla ==${selectedDate.runtimeType},,,selectedDate.end=${selectedDate.end}');
    // TransactionDB.instance.getTransactionsForCurrentMonth();
print('myChosenDate==${myChosenDate}');
print('selectedDate==${selectedDateRange}');

  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  ValueNotifier<double> incomeCustomDateNotifier = ValueNotifier(0);
  ValueNotifier<double> expenseCustomDateNotifier = ValueNotifier(0);
  ValueNotifier<double> totalCustomDateNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    double incomeData = 0;
    double expenseData = 0;
    final double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = 13;
    if (screenWidth > 350) {
      fontSize = 16;
    }

    //Unhandled Exception: HiveError: Box not found. Did you forget to call Hive.openBox()? 나와서 잠시 지움
    //TransactionDB.instance.getTransactionsForCurrentMonth();
    CategoryDB.instance.getAllCategory();

    getCurrency();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppTheme.pcPrimaryColor,
      body: Column(
        children: [
          //---------------------------------------------------calendar-------------------------------------------------------------
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: AppTheme.calendarTextColor),
              weekendStyle: TextStyle(color: AppTheme.calendarWeekendColor),
            ),
            headerStyle: const HeaderStyle(
              leftChevronIcon: Icon(
                color: AppTheme.calendarHeaderColor,
                Icons.arrow_left,
                size: 20.0,
              ),
              rightChevronIcon: Icon(
                color: AppTheme.calendarHeaderColor,
                Icons.arrow_right,
                size: 20.0,
              ),
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                fontSize: 18.0,
                color: AppTheme.calendarHeaderColor,
              ),
            ),
            calendarStyle: const CalendarStyle(
              markerDecoration: BoxDecoration(
                  color: AppTheme.calendarMarkerColor, shape: BoxShape.circle),
              //---------주말텍스트스타일
              weekendTextStyle: TextStyle(color: AppTheme.calendarTextColor),
              //---------평일텍스트스타일
              defaultTextStyle: TextStyle(color: AppTheme.calendarTextColor),

              outsideTextStyle:
                  TextStyle(color: AppTheme.calendarOutsideTextColor),
              outsideDaysVisible: true,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          //---------------------------------------------------divider-------------------------------------------------------------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 350.0,
              child: const Divider(
                thickness: 1.0,
                height: 1.0,
                color: AppTheme.dark_grey,
              ),
            ),
          ),
          //---------------------
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
                      const Icon(Icons.arrow_drop_up_outlined
                        ,color: AppTheme.pcTextIncomeColor,
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
                      const Icon(Icons.arrow_drop_down_outlined
                          ,color: AppTheme.pcTextExpenseColor
                      ),

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
          //  ---------------table calendar event 날짜클릭시 보이는 event 부분 패키지 예시부분임 ---------------
          // Expanded(
          //   child: ValueListenableBuilder<List<Event>>(
          //     valueListenable: _selectedEvents,
          //     builder: (context, value, _) {
          //       return ListView.builder(
          //         itemCount: 1,
          //         itemBuilder: (context, index) {
          //
          //           return Container(
          //
          //
          //             child: ListTile(
          //               onTap: () {
          //                 print('${value[index]}');
          //               },
          //               title: Text(
          //                 '${value[index]}',
          //                 style: TextStyle(color: AppTheme.allInColor),
          //               ),
          //             ),
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),

          // ----------------------------------- Transaction History ----------------------------------------
          ValueListenableBuilder(
            valueListenable: TransactionDB.instance.transactionListNotifier,
            builder: (context, newList, child) {


              /////maplist 는 2024-03-24: [Instance of 'TransactionModel', Instance of 'TransactionModel']같은  [날짜:TransactionModel]의 나열
              //newList는 [Instance of 'TransactionModel', Instance of 'TransactionModel'] 같은 TransactionModel 객채의 나열
              String myChosenDateString = DateFormat('yyyy-MM-dd').format(myChosenDate).toString();

              Map<String, List<TransactionModel>> mapList = SelectDate().sortByDate(newList);
              //keys는 2024-03-24, 2024-03-21, 2024-03-12, 2024-03-01 같은 날짜의 나열.
              List<String> keys = mapList.keys.toList();
              keys = ['${myChosenDateString}'];

              // 예 고민의 흔적 일단놔둠
              print('keys = ${keys}');
              print('List<TransactionModel> = ${mapList['${myChosenDateString}']}');
              print('myChosenDateString = ${myChosenDateString}');

              return mapList['${myChosenDateString}']!= null
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
                      double incomeData = calculationList.fold(0,
                              (previousValue, transaction) {
                            if (transaction.categoryType ==
                                CategoryType.income) {
                              return previousValue + transaction.amount;
                            }
                            return previousValue;
                          });
                      double expenseData = calculationList.fold(0,
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
                                                DateFormat('yyyy.MM.dd ').format(DateTime
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

                                          IconButton(
                                            onPressed: () {

                                              resetTransactionsOnly(context);

                                            },
                                            icon: const Icon(Icons.delete_forever,
                                                color: AppTheme.pcTextTertiaryColor),
                                          ),
                                          const Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '+ ${currencySymboleUpdate.value} ${formatter.format(incomeData)}',
                                                style: const TextStyle(
                                                  color: AppTheme
                                                      .pcTextIncomeColor,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '- ${currencySymboleUpdate.value} ${formatter.format(expenseData)}',
                                                style: const TextStyle(
                                                  color: AppTheme
                                                      .pcTextExpenseColor,
                                                  fontSize: 13,
                                                ),
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
                                    newList: mapList[keys[index]]!,
                                  ),
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Lottie.asset('assets/searchNotFound.json'),
                      ),
                      const Text(
                        "No data available..!",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppTheme.pcTextTertiaryColor),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // ----------------------------------- Transaction History End----------------------------------------
        ],
      ),
    );
  }

  resetTransactionsOnly(value) {
    showDialog(
      context: value,
      builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: AppTheme.pcWaveColor,
              content: const Text(
                  'Reseting transaction will erase all your transaction data.'),
              title: const Text(
                'Do you want to delete all transactions?',
                style: TextStyle(
                  color: AppTheme.pcTextQuaternaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async {

                    setState(() {
                      myNumber = myNumber+1;

                    });
                    print(myNumber);
                    final transactionDB =
                    await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
                    transactionDB.clear();
                    Navigator.of(context).pop();

                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: AppTheme.pcTextQuaternaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: AppTheme.pcTextQuaternaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
      },
    );
  }
}
