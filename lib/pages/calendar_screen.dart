import 'package:flutter/scheduler.dart';
import 'package:pokercat/calander.dart';
import 'package:pokercat/imports.dart';
import 'package:pokercat/pages/bankroll.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';
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

ValueNotifier<double> incomeCurrentMonthNotifier = ValueNotifier(0);
ValueNotifier<double> expenseCurrentMonthNotifier = ValueNotifier(0);
ValueNotifier<double> totalCurrentMonthNotifier = ValueNotifier(0);


DateTime selectDate = DateTime.now();

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<String> transactionList = [];
  Map<String, List<TransactionModel>> newListData = {};

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formattedDate = formatter.format(date);
    return formattedDate;
  }


  void onDaySelectedDate(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectDate = selectedDay; // Update selectDate when a day is selected
    });
  }

  RxBool loader = false.obs;

  List<Meeting> getDataSource() {
    loader.value = true;
    final List<Meeting> meetings = <Meeting>[];
    final Map<DateTime, double> totalAmountMap = {};

    var data = TransactionDB.instance.transactionListNotifier.value;
    // Calculate total amount for each date
    for (int i = 0; i < data.length; i++) {
      DateTime dateTime = DateTime.parse(data[i].date);
      double totalAmount = totalAmountMap[dateTime] ?? 0;

      if (data[i].categoryType == CategoryType.income) {
        totalAmount += data[i].amount;
      } else {
        totalAmount -= data[i].amount;
      }

      totalAmountMap[dateTime] = totalAmount;
    }
    // Create Meeting objects with total amount for each date
    totalAmountMap.forEach((date, totalAmount) {
      final DateTime startTime = DateTime(date.year, date.month, date.day, 9);
      final DateTime endTime = startTime.add(const Duration(hours: 2));

      // Define color and whether it's income or expense

      String amountText;

      if (totalAmount < 0) {
        amountText =
        '- ${currencySymboleUpdate.value} ${formatter.format(totalAmount.abs())}';
        colorM = Colors.red;
        setState(() {});
      } else {
        amountText =
        '+ ${currencySymboleUpdate.value} ${formatter.format(totalAmount.abs())}';
        colorM = Colors.green;
        setState(() {});
      }
        meetings.add(
          Meeting(
            amountText,
            startTime,
            endTime,
            colorM,
            totalAmount < 0,
          ),
        );
      });

    setState(() {});
    loader.value = false;
    // Get.forceAppUpdate();
    return meetings;
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'hy',
      color: Colors.pink,
    ));

    return _AppointmentDataSource(appointments);
  }

  int myNumber = 0;
  final CalendarController _calendarController = CalendarController();

  //-----------calendar ----------------
  late final ValueNotifier<List<Event>> _selectedEvents;
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime select = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  bool click = false;

  //-----------------------------------

  NumberFormat formatter = NumberFormat('#,##0');
  DateTimeRange selectedDateRange =
  SelectDate().currentDateForCalenderSelection();

  DateTime myChosenDate = DateTime.now();
  Color colorM = Colors.green;


  @override
  void initState() {
    _selectedDay = selectDate;
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
    DateTime.utc(2024, 3, 14): [const Event('title3')],
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
    return [];
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

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        myNumber = myNumber + 1;
        print('myNumber= ${myNumber}');
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
        selectedDateRange = DateTimeRange(start: selectedDay, end: selectedDay);
        myChosenDate = selectedDay;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
    selectDate = selectedDay;
    // TransactionDB.instance
    //     .filterByDate(selectedDateRange.start, selectedDateRange.end);

    print('myChosenDate==${myChosenDate}');
    print('selectedDate==${selectedDateRange}');
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    // setState(() {
    _selectedDay = null;
    _focusedDay = focusedDay;
    _rangeStart = start;
    _rangeEnd = end;
    _rangeSelectionMode = RangeSelectionMode.toggledOn;
    // });

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
  build(BuildContext context) {
    double incomeData = 0;
    double expenseData = 0;

    final double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = 13;
    if (screenWidth > 350) {
      fontSize = 16;
    }
    CategoryDB.instance.getAllCategory();

    getCurrency();

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


    List<String> months = [];
    Future<void> filterDataForCurrentMonth(List<DateTime> visibleDates) async {
      // Extract the start and end dates of the current month
      DateTime startOfMonth =
      DateTime(visibleDates[0].year, visibleDates[0].month, 1);
      DateTime endOfMonth = DateTime(
          visibleDates[visibleDates.length - 1].year,
          visibleDates[visibleDates.length - 1].month + 1,
          0);

      // Call your filter method with start and end dates
      TransactionDB.instance.filterForHome(startOfMonth, endOfMonth);
    }



    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppTheme.pcPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 400,
              child: SfCalendar(
                viewHeaderStyle: const ViewHeaderStyle(
                    dayTextStyle: TextStyle(color: Colors.white)),
                headerHeight: 0,
                controller: _calendarController,
                appointmentBuilder: (context, calendarAppointmentDetails) {
                  print(
                      calendarAppointmentDetails.appointments.first.background);
                  final Meeting meeting =
                      calendarAppointmentDetails.appointments.last;

                  return Center(
                      child: Text(
                        meeting.eventName,
                        style: TextStyle(
                          color: meeting.background,
                          fontSize: meeting.eventName.length <= 11
                              ? 8
                              : meeting.eventName.length <= 12
                              ? 7
                              : meeting.eventName.length <= 13
                              ? 6
                              : 4.2,
                        ),
                        overflow: TextOverflow.visible,
                        maxLines: 1,
                      ));
                },
                todayTextStyle: const TextStyle(color: Colors.black),
                initialSelectedDate: selectDate,
                initialDisplayDate: selectDate,
                monthViewSettings: const MonthViewSettings(
                  dayFormat: 'EEE',
                  showTrailingAndLeadingDates: false,
                  appointmentDisplayMode:
                  MonthAppointmentDisplayMode.appointment,
                  monthCellStyle: MonthCellStyle(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),

                onViewChanged: (viewChangedDetails) async {
                  selectedDate1.value = viewChangedDetails.visibleDates[0];
                  SchedulerBinding.instance!.addPostFrameCallback((Duration duration) {
                    _calendarController.selectedDate =
                    viewChangedDetails.visibleDates[0];
                    selectDate = _calendarController.selectedDate!;
                  });

                  if (viewChangedDetails.visibleDates.isNotEmpty) {
                    DateTime currentVisibleMonth =
                    viewChangedDetails.visibleDates[0];
                    int previousVisibleMonth = DateTime.now().month;
                    await filterDataForCurrentMonth(
                        viewChangedDetails.visibleDates);
                    setState(() {
                      previousVisibleMonth = currentVisibleMonth.month;
                    });
                  }
                  if (click) {
                    final DateTime firstVisibleDate = viewChangedDetails.visibleDates.first;
                    _calendarController.selectedDate = DateTime(
                        firstVisibleDate.year, firstVisibleDate.month + 1);
                    onDaySelected(_calendarController.selectedDate!, _calendarController.selectedDate!);
                  } else {
                    click = true;
                  }
                },

                onSelectionChanged: (selectionDetails) {
                  final DateTime selectedDay =
                      selectionDetails.date ?? DateTime.now();
                  final DateTime focusedDay =
                      selectionDetails.date ?? DateTime.now();
                  onDaySelected(selectedDay, focusedDay);
                },
                selectionDecoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2.0),
                ),
                todayHighlightColor: Colors.blue,
                view: CalendarView.month,
                // dataSource: _getCalendarDataSource(),
                dataSource: MeetingDataSource(
                  getDataSource(),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 350.0,
                child: Divider(
                  thickness: 1.0,
                  height: 1.0,
                  color: AppTheme.dark_grey,
                ),
              ),
            ),
            //---------------------

            ValueListenableBuilder(
              valueListenable:
              TransactionDB.instance.transactionMyMonthListNotifier,
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
                String myChosenDateString =
                DateFormat('yyyy-MM-dd').format(myChosenDate).toString();

                Map<String, List<TransactionModel>> mapList =
                SelectDate().sortByDate(newList);
                newListData = mapList;

                //keys는 2024-03-24, 2024-03-21, 2024-03-12, 2024-03-01 같은 날짜의 나열.
                List<String> keys = mapList.keys.toList();

                print('============$transactionList');
                keys = ['${myChosenDateString}'];

                // 예 고민의 흔적 일단놔둠
                print('keys = ${keys}');
                print(
                    'List<TransactionModel> = ${mapList['${myChosenDateString}']}');
                print('myChosenDateString = ${myChosenDateString}');

                return mapList['${myChosenDateString}'] != null
                    ? Padding(
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
                                          IconButton(
                                            onPressed: () async {
                                              resetTransactionsOnly(
                                                  context,
                                                  mapList[keys[index]]!);
                                              setState(() {
                                                mapList.remove(
                                                    keys[index].length);
                                                keys
                                                    .removeAt(index)
                                                    .length;
                                              });
                                              await TransactionDB.instance
                                                  .refresh();
                                              setState(() {});
                                              Get.forceAppUpdate();
                                            },
                                            icon: const Icon(
                                                Icons.delete_forever,
                                                color: AppTheme
                                                    .pcTextTertiaryColor),
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
                                              Text(
                                                '= ${currencySymboleUpdate.value} ${formatter.format(incomeData - expenseData)}',
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
                )
                    : Center(
                  child: Padding(
                    padding:
                    const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 150,
                          child:
                          Lottie.asset('assets/searchNotFound.json'),
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
      ),
    );
  }

  resetTransactionsOnly(
      BuildContext context, List<TransactionModel> transactions) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, update) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: AppTheme.pcWaveColor,
            content: const Text(
                'Resetting transactions will erase all your transaction data for this date.'),
            title: const Text(
              'Do you want to delete all transactions for this date?',
              style: TextStyle(
                color: AppTheme.pcTextQuaternaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  final transactionDB =
                  await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
                  for (var transaction in transactions) {
                    transactionDB.delete(transaction.id);
                  }
                  update.call(
                        () {},
                  );
                  await TransactionDB.instance.refresh();
                  setState(() {});
                  // Refresh the transaction list
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
                  Navigator.of(context).pop(); // Close the dialog
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
          ),
        );
      },
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
//---------------------------------------------------calendar-------------------------------------------------------------
// TableCalendar<Event>(
//   firstDay: kFirstDay,
//   lastDay: kLastDay,
//   focusedDay: _focusedDay,
//   selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//   rangeStartDay: _rangeStart,
//   rangeEndDay: _rangeEnd,
//   calendarFormat: _calendarFormat,
//   rangeSelectionMode: _rangeSelectionMode,
//   eventLoader: _getEventsForDay,
//   startingDayOfWeek: StartingDayOfWeek.monday,
//   daysOfWeekStyle: const DaysOfWeekStyle(
//     weekdayStyle: TextStyle(color: AppTheme.calendarTextColor),
//     weekendStyle: TextStyle(color: AppTheme.calendarWeekendColor),
//   ),
//   headerStyle: const HeaderStyle(
//     leftChevronIcon: Icon(
//       color: AppTheme.calendarHeaderColor,
//       Icons.arrow_left,
//       size: 20.0,
//     ),
//     rightChevronIcon: Icon(
//       color: AppTheme.calendarHeaderColor,
//       Icons.arrow_right,
//       size: 20.0,
//     ),
//     formatButtonVisible: false,
//     titleTextStyle: TextStyle(
//       fontSize: 18.0,
//       color: AppTheme.calendarHeaderColor,
//     ),
//   ),
//   calendarStyle: const CalendarStyle(
//     markerDecoration: BoxDecoration(
//         color: AppTheme.calendarMarkerColor,
//         shape: BoxShape.circle),
//     //---------주말텍스트스타일
//     weekendTextStyle: TextStyle(color: AppTheme.calendarTextColor),
//     //---------평일텍스트스타일
//     defaultTextStyle: TextStyle(color: AppTheme.calendarTextColor),
//
//     outsideTextStyle:
//         TextStyle(color: AppTheme.calendarOutsideTextColor),
//     outsideDaysVisible: true,
//   ),
//   onDaySelected: onDaySelected,
//   onRangeSelected: _onRangeSelected,
//   onFormatChanged: (format) {
//     if (_calendarFormat != format) {
//       setState(() {
//         _calendarFormat = format;
//       });
//     }
//   },
//   onPageChanged: (focusedDay) {
//     _focusedDay = focusedDay;
//   },
// ),
//---------------------------------------------------divider-------------------------------------------------------------

//--reset transaction only

// resetTransactionsOnly(value, id) {
//   showDialog(
//     context: value,
//     builder: (context) {
//       return StatefulBuilder(
//         builder: (context, update) => AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           backgroundColor: AppTheme.pcWaveColor,
//           content: const Text(
//               'Reseting transaction will erase all your transaction data.'),
//           title: const Text(
//             'Do you want to delete all transactions?',
//             style: TextStyle(
//               color: AppTheme.pcTextQuaternaryColor,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () async {
//                 setState(() {
//                   myNumber = myNumber + 1;
//                 });
//                 print(myNumber);
//                 final transactionDB =
//                     await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
//
//                 // final keys = transactionDB.values.toList();
//                 transactionDB.delete(id);
//
//                 setState(() {});
//                 update.call(
//                   () {},
//                 );
//                 TransactionDB.instance.refresh();
//                 Navigator.of(context).pop();
//               },
//               child: const Text(
//                 'Yes',
//                 style: TextStyle(
//                   color: AppTheme.pcTextQuaternaryColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text(
//                 'No',
//                 style: TextStyle(
//                   color: AppTheme.pcTextQuaternaryColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
