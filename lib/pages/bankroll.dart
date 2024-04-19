import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:pokercat/addexpense/add_task_screen.dart';
import 'package:pokercat/addexpense/db/functions/transaction_function.dart';
import 'package:pokercat/addexpense/db/models/account_group/account_group_model_db.dart';
import 'package:pokercat/addexpense/db/models/category/category_model_db.dart';
import 'package:pokercat/constant.dart';
import 'package:pokercat/pages/calendar_screen.dart';
import 'package:pokercat/pages/graph_screen.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:pokercat/addexpense/accounts_screen/balance_calculation.dart';
import 'package:pokercat/addexpense/db/functions/account_group_function.dart';
import 'package:pokercat/addexpense/db/functions/category_functions.dart';
import 'package:pokercat/addexpense/db/models/transactions/transaction_model_db.dart';
import 'package:pokercat/pages/transaction_screen.dart';
import '../addexpense/widget/transaction_helper.dart';
import '../packages/expense_repository/lib/src/models/expense.dart';
import '../global/component/appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokercat/addexpense/db/functions/currency_function.dart';

class Bankroll extends StatefulWidget {
  const Bankroll({super.key, this.modelFromTransation});

  @override
  State<Bankroll> createState() => _BankrollState();
  final TransactionModel? modelFromTransation;
}

class _BankrollState extends State<Bankroll> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _amountController = TextEditingController();
  String? _categoryID;

  String? accountType;
  CategoryModel selectedcategoryModel = CategoryModel(
      id: '', name: '', isDeleted: true, categoryType: CategoryType.income);
  TextEditingController _noteController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  // DateTime selectDate = DateTime.now();
  late Expense expense;
  bool isLoading = false;
  File? image;

  bool screenIsGraph = false;

  Map<String, dynamic> monthDataForGraph = {
    'jan': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'feb': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'mar': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'apr': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'may': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'jun': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'july': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'aug': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'sep': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'oct': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'nov': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'dec': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    }
  };
initMonthData (){
 monthDataForGraph = {
    'jan': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'feb': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'mar': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'apr': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'may': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'jun': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'july': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'aug': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'sep': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'oct': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'nov': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    },
    'dec': {
      'income': '0.0',
      'expense': '0.0',
      'total': '0.0',
    }
  };
}

  @override
  void initState() {
    dateController.text = DateFormat('yyyy/MM/dd').format(DateTime.now());
    // expense = Expense.empty;
    // expense.expenseId = const Uuid().v1();

    if (widget.modelFromTransation != null) {
      String categoryFromTransaction =
          widget.modelFromTransation!.category.id.toString();
      String accountTypeFromTransaction = '';
      if (widget.modelFromTransation!.account == AccountType.account) {
        accountTypeFromTransaction = 'account';
      } else if (widget.modelFromTransation!.account == AccountType.cash) {
        accountTypeFromTransaction = 'cash';
      }
      selectedDate = DateTime.parse(widget.modelFromTransation!.date);

      _amountController.text = widget.modelFromTransation!.amount.toString();
      accountType = accountTypeFromTransaction;
      _categoryID = categoryFromTransaction;
      _noteController.text = widget.modelFromTransation!.note;
      selectedcategoryModel = widget.modelFromTransation!.category;
      if (widget.modelFromTransation!.image != null) {
        image = File(widget.modelFromTransation!.image!);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDB.instance.getAllCategory();
    getAllAccountGroup();
    accountGroupBalanceAmount();

    return Scaffold(
      appBar: Appbar(
        titleStr: 'Bankroll',
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                alignment: Alignment.centerRight,
                icon: const Icon(Ionicons.options_outline,
                    color: AppTheme.pcTextSecondayColor, size: 25),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransactionScreen(),
                    ),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: TransactionDB.instance.transactionListNotifier,
                builder: (context, newList, child) {
                  Map<String, List<TransactionModel>> mapList =
                      SelectDate().sortByDate(newList);
                  List<String> keys = mapList.keys.toList();

                  print(mapList);

                  return Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Align(
                      child: LiteRollingSwitch(
                        value: false,
                        width: 85,
                        textOn: '',
                        textOff: '',
                        colorOn: AppTheme.pcTabBarSelectorColor,
                        colorOff: AppTheme.pcPopUpIconColor,
                        iconOn: Ionicons.analytics_outline,
                        iconOff: Icons.calendar_month,
                        animationDuration: const Duration(milliseconds: 200),
                        onChanged: (bool state) {
                          setState(() {


                            screenIsGraph = state;
                            initMonthData();
                            //january

                            double totalJan = 0.0;
                            double incomeMonthJan = 0.0;
                            double expenseMonthJan = 0.0;

                            //feb

                            double totalFeb = 0.0;
                            double incomeMonthFeb = 0.0;
                            double expenseMonthFeb = 0.0;

                            // march

                            double totalMarch = 0.0;
                            double incomeMonthMarch = 0.0;
                            double expenseMonthMarch = 0.0;

                            //april

                            double totalA = 0.0;
                            double incomeMonth = 0.0;
                            double expenseMonth = 0.0;

                            //may
                            double totalMay = 0.0;
                            double incomeMonthMay = 0.0;
                            double expenseMonthMay = 0.0;

                            //june

                            double totalJun = 0.0;
                            double incomeMonthJun = 0.0;
                            double expenseMonthJun = 0.0;

                            //july

                            double totalJul = 0.0;
                            double incomeMonthJul = 0.0;
                            double expenseMonthJul = 0.0;

                            //aug

                            double totalAug = 0.0;
                            double incomeMonthAug = 0.0;
                            double expenseMonthAug = 0.0;

                            //sep

                            double totalSep = 0.0;
                            double incomeMonthSep = 0.0;
                            double expenseMonthSep = 0.0;

                            //oct

                            double totalOct = 0.0;
                            double incomeMonthOct = 0.0;
                            double expenseMonthOct = 0.0;

                            //nov

                            double totalNov = 0.0;
                            double incomeMonthNov = 0.0;
                            double expenseMonthNov = 0.0;

                            //dec

                            double totalDec = 0.0;
                            double incomeMonthDec = 0.0;
                            double expenseMonthDec = 0.0;

                            print(mapList);

                             print(keys);

                            mapList.forEach((key, value) {
                              print('$key: $value');
                              DateTime date = DateTime.parse(key);
                              String month = DateFormat('MMMM').format(date);

                              print(month);

                              if (month == 'January') {
                                for (int i = 0; i < value.length; i++) {
                                  totalJan = totalJan + value[i].amount;
                                  if (value[i].categoryType ==
                                      CategoryType.income) {
                                    incomeMonthJan =
                                        incomeMonthJan + value[i].amount;
                                  } else {
                                    expenseMonthJan =
                                        expenseMonthJan + value[i].amount;
                                  }
                                }

                                monthDataForGraph['jan']['total'] =
                                    totalJan.toString();
                                monthDataForGraph['jan']['income'] =
                                    incomeMonthJan.toString();
                                monthDataForGraph['jan']['expense'] =
                                    expenseMonthJan.toString();
                              } else if (month == 'February') {
                                for (int i = 0; i < value.length; i++) {
                                  totalFeb = totalFeb + value[i].amount;
                                  if (value[i].categoryType ==
                                      CategoryType.income) {
                                    incomeMonthFeb =
                                        incomeMonthFeb + value[i].amount;
                                  } else {
                                    expenseMonthFeb =
                                        expenseMonthFeb + value[i].amount;
                                  }
                                }

                                monthDataForGraph['feb']['total'] =
                                    totalFeb.toString();
                                monthDataForGraph['feb']['income'] =
                                    incomeMonthFeb.toString();
                                monthDataForGraph['feb']['expense'] =
                                    expenseMonthFeb.toString();
                              } else if (month == 'March') {
                                for (int i = 0; i < value.length; i++) {
                                  totalMarch = totalMarch + value[i].amount;
                                  if (value[i].categoryType ==
                                      CategoryType.income) {
                                    incomeMonthMarch =
                                        incomeMonthMarch + value[i].amount;
                                  } else {
                                    expenseMonthMarch =
                                        expenseMonthMarch + value[i].amount;
                                  }
                                }

                                monthDataForGraph['mar']['total'] =
                                    totalMarch.toString();
                                monthDataForGraph['mar']['income'] =
                                    incomeMonthMarch.toString();
                                monthDataForGraph['mar']['expense'] =
                                    expenseMonthMarch.toString();
                              } else if (month == 'April') {
                                for (int i = 0; i < value.length; i++) {
                                  totalA = totalA + value[i].amount;

                                  if (value[i].categoryType ==
                                      CategoryType.income) {
                                    incomeMonth = incomeMonth + value[i].amount;
                                  } else {
                                    expenseMonth =
                                        expenseMonth + value[i].amount;
                                  }
                                }

                                monthDataForGraph['apr']['total'] =
                                    totalA.toString();

                                monthDataForGraph['apr']['income'] =
                                    incomeMonth.toString();
                                monthDataForGraph['apr']['expense'] =
                                    expenseMonth.toString();
                              } else if (month == 'May') {
                                for (int i = 0; i < value.length; i++) {
                                  totalMay = totalMay + value[i].amount;
                                  if (value[i].categoryType ==
                                      CategoryType.income) {
                                    incomeMonthMay =
                                        incomeMonthMay + value[i].amount;
                                  } else {
                                    expenseMonthMay =
                                        expenseMonthMay + value[i].amount;
                                  }
                                }

                                monthDataForGraph['may']['total'] =
                                    totalMay.toString();
                                monthDataForGraph['may']['income'] =
                                    incomeMonthMay.toString();
                                monthDataForGraph['may']['expense'] =
                                    expenseMonthMay.toString();
                              } else if (month == 'June') {
                                for (int i = 0; i < value.length; i++) {
                                  totalJun = totalJun + value[i].amount;
                                  if (value[i].categoryType ==
                                      CategoryType.income) {
                                    incomeMonthJun =
                                        incomeMonthJun + value[i].amount;
                                  } else {
                                    expenseMonthJun =
                                        expenseMonthJun + value[i].amount;
                                  }
                                }

                                monthDataForGraph['jun']['total'] =
                                    totalJun.toString();
                                monthDataForGraph['jun']['income'] =
                                    incomeMonthJun.toString();
                                monthDataForGraph['jun']['expense'] =
                                    expenseMonthJun.toString();
                              } else if (month == 'July') {
                                for (int i = 0; i < value.length; i++) {
                                  totalJul = totalJul + value[i].amount;
                                  if (value[i].categoryType ==
                                      CategoryType.income) {
                                    incomeMonthJul =
                                        incomeMonthJul + value[i].amount;
                                  } else {
                                    expenseMonthJul =
                                        expenseMonthJul + value[i].amount;
                                  }
                                }

                                monthDataForGraph['july']['total'] =
                                    totalJul.toString();
                                monthDataForGraph['july']['income'] =
                                    incomeMonthJul.toString();
                                monthDataForGraph['july']['expense'] =
                                    expenseMonthJul.toString();
                              } else if (month == 'August') {
                                for (int i = 0; i < value.length; i++) {
                                  totalAug = totalAug + value[i].amount;
                                  if (value[i].categoryType ==
                                      CategoryType.income) {
                                    incomeMonthAug =
                                        incomeMonthAug + value[i].amount;
                                  } else {
                                    expenseMonthAug =
                                        expenseMonthAug + value[i].amount;
                                  }
                                }

                                monthDataForGraph['aug']['total'] =
                                    totalAug.toString();

                                monthDataForGraph['aug']['income'] =
                                    incomeMonthAug.toString();
                                monthDataForGraph['aug']['expense'] =
                                    expenseMonthAug.toString();
                              } else if (month == 'September') {
                                for (int i = 0; i < value.length; i++) {
                                  totalSep = totalSep + value[i].amount;
                                  if (value[i].categoryType ==
                                      CategoryType.income) {
                                    incomeMonthSep =
                                        incomeMonthSep + value[i].amount;
                                  } else {
                                    expenseMonthSep =
                                        expenseMonthSep + value[i].amount;
                                  }
                                }

                                monthDataForGraph['sep']['total'] =
                                    totalSep.toString();
                                monthDataForGraph['sep']['income'] =
                                    incomeMonthSep.toString();
                                monthDataForGraph['sep']['expense'] =
                                    expenseMonthSep.toString();
                              } else if (month == 'October') {
                                for (int i = 0; i < value.length; i++) {
                                  totalOct = totalOct + value[i].amount;
                                  if (value[i].categoryType ==
                                      CategoryType.income) {
                                    incomeMonthOct =
                                        incomeMonthOct + value[i].amount;
                                  } else {
                                    expenseMonthOct =
                                        expenseMonthOct + value[i].amount;
                                  }
                                }

                                monthDataForGraph['oct']['total'] =
                                    totalOct.toString();
                                monthDataForGraph['oct']['income'] =
                                    incomeMonthOct.toString();
                                monthDataForGraph['oct']['expense'] =
                                    expenseMonthOct.toString();
                              } else if (month == 'November') {
                                for (int i = 0; i < value.length; i++) {
                                  totalNov = totalNov + value[i].amount;
                                  if (value[i].categoryType ==
                                      CategoryType.income) {
                                    incomeMonthNov =
                                        incomeMonthNov + value[i].amount;
                                  } else {
                                    expenseMonthNov =
                                        expenseMonthNov + value[i].amount;
                                  }
                                }

                                monthDataForGraph['nov']['total'] =
                                    totalNov.toString();
                                monthDataForGraph['nov']['income'] =
                                    incomeMonthNov.toString();
                                monthDataForGraph['nov']['expense'] =
                                    expenseMonthNov.toString();
                              } else if (month == 'December') {
                                for (int i = 0; i < value.length; i++) {
                                  totalDec = totalDec + value[i].amount;
                                  if (value[i].categoryType ==
                                      CategoryType.income) {
                                    incomeMonthDec =
                                        incomeMonthDec + value[i].amount;
                                  } else {
                                    expenseMonthDec =
                                        expenseMonthDec + value[i].amount;
                                  }
                                }

                                monthDataForGraph['dec']['total'] =
                                    totalDec.toString();
                                monthDataForGraph['dec']['income'] =
                                    incomeMonthDec.toString();
                                monthDataForGraph['dec']['expense'] =
                                    expenseMonthDec.toString();
                              } else {}
                            });

                            monthChartDataGraph = monthDataForGraph;
                          });
                          print('turned ${(state) ? 'on' : 'off'},$state');
                        },
                        onDoubleTap: () {},
                        onSwipe: () {},
                        onTap: () {},
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
      body: screenIsGraph == true
          ? GraphScreen(
              // monthChartData: monthDataForGraph,
              )
          : CalendarScreen(),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: AppTheme.floatingButtonColor,
        child: const Icon(Icons.add),
        onPressed: () async {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen()).then((value) {
            setState(() {
              initialize();
            });
          });

        },
      ),
    );
  }

  Future addExpenseTransaction() async {
    CategoryType selectedCategoryType = CategoryType.expense;
    final note = _noteController.text;
    final amount = _amountController.text;
    final parsedAmount = double.tryParse(amount);
    if (widget.modelFromTransation == null) {
      final model = TransactionModel(
        id: DateTime.now().day + DateTime.now().hour + DateTime.now().second,
        date: DateFormat('yyyy-MM-dd').format(selectedDate),
        amount: parsedAmount ?? 0.0,
        account: AccountType.cash,
        categoryType: selectedCategoryType,
        category: selectedcategoryModel!,
        note: note.trim(),
        image: 'assets/images/catpic3.png',
      );

      await TransactionDB.instance.addTransaction(model);
    } else {
      final model = TransactionModel(
        id: widget.modelFromTransation!.id,
        date: DateFormat('yyyy-MM-dd').format(selectedDate),
        amount: parsedAmount ?? 0.0,
        account: AccountType.cash,
        categoryType: selectedCategoryType,
        category: selectedcategoryModel!,
        note: note.trim(),
        image: 'assets/images/catpic3.png',
      );

      await TransactionDB.instance.editTransactionDb(model.id!, model);
    }
    textFeildClear();
  }

  Future addIncomeTransaction() async {
    final note = _noteController.text;
    final amount = _amountController.text;
    final parsedAmount = double.tryParse(amount);
    CategoryType selectedCategoryType = CategoryType.income;
    if (widget.modelFromTransation == null) {
      final model = TransactionModel(
        id: DateTime.now().day + DateTime.now().hour + DateTime.now().second,
        date: DateFormat('yyyy-MM-dd').format(selectedDate),
        amount: parsedAmount ?? 0.0,
        account: AccountType.cash,
        categoryType: selectedCategoryType,
        category: selectedcategoryModel!,
        note: note.trim(),
        image: 'assets/images/catpic3.png',
      );
      await TransactionDB.instance.addTransaction(model);
    } else {
      print('in side else case');
      final model = TransactionModel(
        id: widget.modelFromTransation!.id,
        date: DateFormat('yyyy-MM-dd').format(selectedDate),
        amount: parsedAmount ?? 0.0,
        account: AccountType.cash,
        categoryType: selectedCategoryType,
        category: selectedcategoryModel!,
        note: note.trim(),
        image: 'assets/images/catpic3.png',
      );
      await TransactionDB.instance.editTransactionDb(model.id!, model);
    }

    textFeildClear();
  }

  void textFeildClear() {
    setState(() {
      selectedDate = DateTime.now();
      _amountController.clear();
      _categoryID = null;
      _noteController.clear();
      // image = null;
    });
  }
}
