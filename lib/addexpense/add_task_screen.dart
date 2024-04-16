import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pokercat/addexpense/accounts_screen/balance_calculation.dart';
import 'package:pokercat/addexpense/db/functions/account_group_function.dart';
import 'package:pokercat/addexpense/db/functions/category_functions.dart';
import 'package:pokercat/addexpense/db/models/transactions/transaction_model_db.dart';
import 'package:pokercat/addexpense/widget/transaction_helper.dart';
import 'package:pokercat/getx_route/routes.dart';
import '../constant.dart';
import '../packages/expense_repository/lib/src/models/expense.dart';
import '../pages/graph_screen.dart';
import 'db/functions/currency_function.dart';
import 'db/functions/transaction_function.dart';
import 'db/models/account_group/account_group_model_db.dart';
import 'db/models/category/category_model_db.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key, this.modelFromTransation});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();

  final TransactionModel? modelFromTransation;
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _amountController = TextEditingController();
  String? _categoryID;
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

  CategoryModel selectedcategoryModel = CategoryModel(
      id: '', name: '', isDeleted: true, categoryType: CategoryType.income);

  //빈 카테고리 모델
  TextEditingController _noteController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  // DateTime selectDate = DateTime.now();
  late Expense expense;
  bool isLoading = false;

  final _FormKey = GlobalKey<FormState>();
  File? image;

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

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        height: 400.0,
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: AppTheme.pcPopUpColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Form(
            key: _FormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 80,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Date ',
                          style: TextStyle(
                            color: AppTheme.pcTextTertiaryColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Date';
                          } else {
                            return null;
                          }
                        },
                        cursorColor: AppTheme.pcTextSecondayColor,
                        style: const TextStyle(
                          color: AppTheme.pcTextSecondayColor,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.pcTabBarSelectorColor,
                            ),
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  final DateTime? date = await showDatePicker(
                                    context: context,
                                    builder: (context, child) {
                                      return Theme(
                                        data: ThemeData.dark().copyWith(
                                            colorScheme: const ColorScheme.dark(
                                                onPrimary:
                                                    AppTheme.pcAppBarColor,
                                                onSurface: AppTheme
                                                    .pcTextSecondayColor,
                                                primary: AppTheme
                                                    .pcTextTertiaryColor),
                                            dialogBackgroundColor:
                                                AppTheme.pcAppBarColor),
                                        child: child!,
                                      );
                                    },
                                    initialDate: selectedDate,
                                    firstDate: DateTime.now()
                                        .subtract(const Duration(days: 90)),
                                    lastDate: DateTime.now(),
                                  );
                                  if (date != null && date != selectedDate) {
                                    setState(
                                      () {
                                        selectedDate = date;
                                      },
                                    );
                                  }
                                },
                                icon: const Icon(
                                  Ionicons.calendar_outline,
                                ),
                              ),
                            ],
                          ),
                          suffixIconColor: AppTheme.pcTabBarSelectorColor,
                        ),
                        controller: TextEditingController(
                          text:
                              '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}', // display selected date in text field
                        ),
                        readOnly: true,
                        onTap: () async {
                          final DateTime? date = await showDatePicker(
                            context: context,
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.dark().copyWith(
                                    colorScheme: const ColorScheme.dark(
                                        onPrimary: AppTheme.pcAppBarColor,
                                        onSurface: AppTheme.pcTextSecondayColor,
                                        primary: AppTheme.pcTextTertiaryColor),
                                    dialogBackgroundColor:
                                        AppTheme.pcAppBarColor),
                                child: child!,
                              );
                            },
                            initialDate: selectedDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );
                          if (date != null && date != selectedDate) {
                            setState(
                              () {
                                selectedDate = date;
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 80,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Amount ',
                          style: TextStyle(
                            color: AppTheme.pcTextTertiaryColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required ';
                          } else {
                            return null;
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        // inputFormatters: [
                        //   CurrencyTextInputFormatter(
                        //     decimalDigits: 0,
                        //     symbol: '',
                        //   )
                        // ],
                        //화폐를 3단위로 쪼개주는 기능을하는데 긴금액 안들어가서 짜름
                        controller: _amountController,
                        cursorColor: AppTheme.pcTextSecondayColor,
                        style: const TextStyle(
                          color: AppTheme.pcTextSecondayColor,
                        ),
                        decoration: InputDecoration(
                            prefixText: "${currencySymboleUpdate.value} ",
                            prefixStyle: const TextStyle(
                                color: AppTheme.pcTextSecondayColor),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.pcTabBarSelectorColor,
                              ),
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  // FlutterClipboard.paste().then((value) {
                                  //   setState(() {
                                  //     _amountController.text = value;
                                  //   });
                                  // });
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.coins,
                                  size: 20,
                                  color: AppTheme.pcTabBarSelectorColor,
                                ))),
                        readOnly: false,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Category ',
                          style: TextStyle(
                            color: AppTheme.pcTextTertiaryColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Theme(
                      data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: StatefulBuilder(builder: (context, setState2) {
                        return DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.pcTabBarSelectorColor,
                              ),
                            ),
                          ),
                          hint: const Text(
                            'Select category',
                            style: TextStyle(color: Colors.transparent),
                          ),
                          value: _categoryID,
                          items: CategoryDB()
                              .incomeCategoryNotifier
                              .value
                              .where(
                                  (e) => e.categoryType == CategoryType.income)
                              .map((e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(
                                      e.name,
                                      style: const TextStyle(
                                        color: AppTheme.pcTextSecondayColor,
                                      ),
                                    ),
                                    onTap: () {
                                      print(e.categoryType);

                                      selectedcategoryModel = e;
                                    },
                                  ))
                              .toList(),
                          onChanged: (selectedValue) {
                            setState(() {
                              _categoryID = selectedValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required Feild';
                            } else {
                              return null;
                            }
                          },
                          isExpanded: true,
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: const Icon(Icons.arrow_drop_down,
                                  color: AppTheme.pcTabBarSelectorColor),
                            ),
                          ),
                          dropdownColor: AppTheme.pcAppBarColor,
                        );
                      }),
                    )),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Note ',
                          style: TextStyle(
                            color: AppTheme.pcTextTertiaryColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(
                              r'[a-z|A-Z|0-9|ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ|ㆍ|ᆢ|ᄀᆞ|ᄂᆞ|ᄃᆞ|ᄅᆞ|ᄆᆞ|ᄇᆞ|ᄉᆞ|ᄋᆞ|ᄌᆞ|ᄎᆞ|ᄏᆞ|ᄐᆞ|ᄑᆞ|ᄒᆞ]'))
                        ],
                        controller: _noteController,
                        cursorColor: AppTheme.pcTextSecondayColor,
                        style: const TextStyle(
                          color: AppTheme.pcTextSecondayColor,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.pcTabBarSelectorColor,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.description_outlined,
                          ),
                          suffixIconColor: AppTheme.pcTabBarSelectorColor,
                        ),
                        readOnly: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.41,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.pcIncomeColor,
                          boxShadow: const [
                            BoxShadow(
                              color: AppTheme.pcShadowColor,
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ValueListenableBuilder(
                                valueListenable: TransactionDB
                                    .instance.transactionListNotifier,
                                builder: (context, newList, child) {
                                  return TextButton(
                                      onPressed: () async {
                                        setState(() {});
                                        if (_FormKey.currentState!.validate()) {
                                          if (_amountController.text != '' &&
                                              _categoryID != null) {
                                            //금액을임력안하면 빈 스트링이 돌아오기에 이렇게 내맘대로 썼음
                                            print(
                                                '_amountController.text==${_amountController.text.runtimeType}==');
                                            Navigator.pop(context);
                                          }
                                          try {
                                            await addIncomeTransaction();
                                          } catch (e) {
                                            print(e.toString());
                                          }
                                        }

                                        // context.read<CreateExpenseBloc>().add(CreateExpense(expense));
                                        //임의로
                                        var data = TransactionDB
                                            .instance.transactionListNotifier;
                                        print(data.value);
                                        Map<String, List<TransactionModel>>
                                            mapList =
                                            SelectDate().sortByDate(newList);
                                        List<String> keys =
                                            mapList.keys.toList();

                                        print(mapList);

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
                                          String month =
                                              DateFormat('MMMM').format(date);

                                          print(month);

                                          if (month == 'January') {
                                            for (int i = 0;
                                                i < value.length;
                                                i++) {
                                              totalJan =
                                                  totalJan + value[i].amount;
                                              if (value[i].categoryType ==
                                                  CategoryType.income) {
                                                incomeMonthJan =
                                                    incomeMonthJan +
                                                        value[i].amount;
                                              } else {
                                                expenseMonthJan =
                                                    expenseMonthJan +
                                                        value[i].amount;
                                              }
                                            }

                                            monthDataForGraph['jan']['total'] =
                                                totalJan.toString();
                                            monthDataForGraph['jan']['income'] =
                                                incomeMonthJan.toString();
                                            monthDataForGraph['jan']
                                                    ['expense'] =
                                                expenseMonthJan.toString();
                                          } else if (month == 'February') {
                                            for (int i = 0;
                                                i < value.length;
                                                i++) {
                                              totalFeb =
                                                  totalFeb + value[i].amount;
                                              if (value[i].categoryType ==
                                                  CategoryType.income) {
                                                incomeMonthFeb =
                                                    incomeMonthFeb +
                                                        value[i].amount;
                                              } else {
                                                expenseMonthFeb =
                                                    expenseMonthFeb +
                                                        value[i].amount;
                                              }
                                            }

                                            monthDataForGraph['feb']['total'] =
                                                totalFeb.toString();
                                            monthDataForGraph['feb']['income'] =
                                                incomeMonthFeb.toString();
                                            monthDataForGraph['feb']
                                                    ['expense'] =
                                                expenseMonthFeb.toString();
                                          } else if (month == 'March') {
                                            for (int i = 0;
                                                i < value.length;
                                                i++) {
                                              totalMarch =
                                                  totalMarch + value[i].amount;
                                              if (value[i].categoryType ==
                                                  CategoryType.income) {
                                                incomeMonthMarch =
                                                    incomeMonthMarch +
                                                        value[i].amount;
                                              } else {
                                                expenseMonthMarch =
                                                    expenseMonthMarch +
                                                        value[i].amount;
                                              }
                                            }

                                            monthDataForGraph['mar']['total'] =
                                                totalMarch.toString();
                                            monthDataForGraph['mar']['income'] =
                                                incomeMonthMarch.toString();
                                            monthDataForGraph['mar']
                                                    ['expense'] =
                                                expenseMonthMarch.toString();
                                          } else if (month == 'April') {
                                            for (int i = 0;
                                                i < value.length;
                                                i++) {
                                              totalA = totalA + value[i].amount;

                                              if (value[i].categoryType ==
                                                  CategoryType.income) {
                                                incomeMonth = incomeMonth +
                                                    value[i].amount;
                                              } else {
                                                expenseMonth = expenseMonth +
                                                    value[i].amount;
                                              }
                                            }

                                            monthDataForGraph['apr']['total'] =
                                                totalA.toString();

                                            monthDataForGraph['apr']['income'] =
                                                incomeMonth.toString();
                                            monthDataForGraph['apr']
                                                    ['expense'] =
                                                expenseMonth.toString();
                                          } else if (month == 'May') {
                                            for (int i = 0;
                                                i < value.length;
                                                i++) {
                                              totalMay =
                                                  totalMay + value[i].amount;
                                              if (value[i].categoryType ==
                                                  CategoryType.income) {
                                                incomeMonthMay =
                                                    incomeMonthMay +
                                                        value[i].amount;
                                              } else {
                                                expenseMonthMay =
                                                    expenseMonthMay +
                                                        value[i].amount;
                                              }
                                            }

                                            monthDataForGraph['may']['total'] =
                                                totalMay.toString();
                                            monthDataForGraph['may']['income'] =
                                                incomeMonthMay.toString();
                                            monthDataForGraph['may']
                                                    ['expense'] =
                                                expenseMonthMay.toString();
                                          } else if (month == 'June') {
                                            for (int i = 0;
                                                i < value.length;
                                                i++) {
                                              totalJun =
                                                  totalJun + value[i].amount;
                                              if (value[i].categoryType ==
                                                  CategoryType.income) {
                                                incomeMonthJun =
                                                    incomeMonthJun +
                                                        value[i].amount;
                                              } else {
                                                expenseMonthJun =
                                                    expenseMonthJun +
                                                        value[i].amount;
                                              }
                                            }

                                            monthDataForGraph['jun']['total'] =
                                                totalJun.toString();
                                            monthDataForGraph['jun']['income'] =
                                                incomeMonthJun.toString();
                                            monthDataForGraph['jun']
                                                    ['expense'] =
                                                expenseMonthJun.toString();
                                          } else if (month == 'July') {
                                            for (int i = 0;
                                                i < value.length;
                                                i++) {
                                              totalJul =
                                                  totalJul + value[i].amount;
                                              if (value[i].categoryType ==
                                                  CategoryType.income) {
                                                incomeMonthJul =
                                                    incomeMonthJul +
                                                        value[i].amount;
                                              } else {
                                                expenseMonthJul =
                                                    expenseMonthJul +
                                                        value[i].amount;
                                              }
                                            }

                                            monthDataForGraph['july']['total'] =
                                                totalJul.toString();
                                            monthDataForGraph['july']
                                                    ['income'] =
                                                incomeMonthJul.toString();
                                            monthDataForGraph['july']
                                                    ['expense'] =
                                                expenseMonthJul.toString();
                                          } else if (month == 'August') {
                                            for (int i = 0;
                                                i < value.length;
                                                i++) {
                                              totalAug =
                                                  totalAug + value[i].amount;
                                              if (value[i].categoryType ==
                                                  CategoryType.income) {
                                                incomeMonthAug =
                                                    incomeMonthAug +
                                                        value[i].amount;
                                              } else {
                                                expenseMonthAug =
                                                    expenseMonthAug +
                                                        value[i].amount;
                                              }
                                            }

                                            monthDataForGraph['aug']['total'] =
                                                totalAug.toString();

                                            monthDataForGraph['aug']['income'] =
                                                incomeMonthAug.toString();
                                            monthDataForGraph['aug']
                                                    ['expense'] =
                                                expenseMonthAug.toString();
                                          } else if (month == 'September') {
                                            for (int i = 0;
                                                i < value.length;
                                                i++) {
                                              totalSep =
                                                  totalSep + value[i].amount;
                                              if (value[i].categoryType ==
                                                  CategoryType.income) {
                                                incomeMonthSep =
                                                    incomeMonthSep +
                                                        value[i].amount;
                                              } else {
                                                expenseMonthSep =
                                                    expenseMonthSep +
                                                        value[i].amount;
                                              }
                                            }

                                            monthDataForGraph['sep']['total'] =
                                                totalSep.toString();
                                            monthDataForGraph['sep']['income'] =
                                                incomeMonthSep.toString();
                                            monthDataForGraph['sep']
                                                    ['expense'] =
                                                expenseMonthSep.toString();
                                          } else if (month == 'October') {
                                            for (int i = 0;
                                                i < value.length;
                                                i++) {
                                              totalOct =
                                                  totalOct + value[i].amount;
                                              if (value[i].categoryType ==
                                                  CategoryType.income) {
                                                incomeMonthOct =
                                                    incomeMonthOct +
                                                        value[i].amount;
                                              } else {
                                                expenseMonthOct =
                                                    expenseMonthOct +
                                                        value[i].amount;
                                              }
                                            }

                                            monthDataForGraph['oct']['total'] =
                                                totalOct.toString();
                                            monthDataForGraph['oct']['income'] =
                                                incomeMonthOct.toString();
                                            monthDataForGraph['oct']
                                                    ['expense'] =
                                                expenseMonthOct.toString();
                                          } else if (month == 'November') {
                                            for (int i = 0;
                                                i < value.length;
                                                i++) {
                                              totalNov =
                                                  totalNov + value[i].amount;
                                              if (value[i].categoryType ==
                                                  CategoryType.income) {
                                                incomeMonthNov =
                                                    incomeMonthNov +
                                                        value[i].amount;
                                              } else {
                                                expenseMonthNov =
                                                    expenseMonthNov +
                                                        value[i].amount;
                                              }
                                            }

                                            monthDataForGraph['nov']['total'] =
                                                totalNov.toString();
                                            monthDataForGraph['nov']['income'] =
                                                incomeMonthNov.toString();
                                            monthDataForGraph['nov']
                                                    ['expense'] =
                                                expenseMonthNov.toString();
                                          } else if (month == 'December') {
                                            for (int i = 0;
                                                i < value.length;
                                                i++) {
                                              totalDec =
                                                  totalDec + value[i].amount;
                                              if (value[i].categoryType ==
                                                  CategoryType.income) {
                                                incomeMonthDec =
                                                    incomeMonthDec +
                                                        value[i].amount;
                                              } else {
                                                expenseMonthDec =
                                                    expenseMonthDec +
                                                        value[i].amount;
                                              }
                                            }

                                            monthDataForGraph['dec']['total'] =
                                                totalDec.toString();
                                            monthDataForGraph['dec']['income'] =
                                                incomeMonthDec.toString();
                                            monthDataForGraph['dec']
                                                    ['expense'] =
                                                expenseMonthDec.toString();
                                          } else {}
                                        });

                                        monthChartDataGraph = monthDataForGraph;

                                        initialize();

                                        setState(() {});
                                      },
                                      style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12))),
                                      child: const Text(
                                        'Income',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ));
                                },
                              ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.41,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.pcExpenseColor,
                          boxShadow: const [
                            BoxShadow(
                              color: AppTheme.pcShadowColor,
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : TextButton(
                                onPressed: () async {
                                  setState(() {});

                                  if (_FormKey.currentState!.validate()) {
                                    if (_amountController.text != '' &&
                                        _categoryID != null) {
                                      //금액을임력안하면 빈 스트링이 돌아오기에 이렇게 내맘대로 썼음
                                      print(
                                          '_amountController.text==${_amountController.text.runtimeType}==');
                                      Navigator.pop(context);
                                    }
                                    await addExpenseTransaction();
                                  }

                                  // expense.amount = int.parse(expenseController.text);

                                  // context.read<CreateExpenseBloc>().add(CreateExpense(expense));
                                  //임의로
                                },
                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                                child: const Text(
                                  'Expense',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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

      var data = TransactionDB.instance.transactionListNotifier;
      print(data.value);
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
