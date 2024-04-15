import 'package:flutter/material.dart';
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
import '../packages/expense_repository/lib/src/models/expense.dart';
import '../global/component/appbar.dart';

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
  CategoryModel selectedcategoryModel =  CategoryModel(id: '', name: '', isDeleted: true, categoryType: CategoryType.income
  );
  TextEditingController _noteController = TextEditingController();





  TextEditingController dateController = TextEditingController();
  // DateTime selectDate = DateTime.now();
  late Expense expense;
  bool isLoading = false;
  File? image;


bool screenIsGraph= false;


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
              Padding(
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
                      });
                      print('turned ${(state) ? 'on' : 'off'},$state');
                    },
                    onDoubleTap: () {},
                    onSwipe: () {},
                    onTap: () {},
                  ),
                ),
              ),

            ],
          )
        ],
      ),
      body: screenIsGraph ==true?GraphScreen():CalendarScreen(),

      floatingActionButton:
        FloatingActionButton(
          // backgroundColor: AppTheme.floatingButtonColor,
          child: const Icon(Icons.add),
          onPressed: () async {
            showModalBottomSheet(
                context: context,

                builder: (context) => AddTaskScreen()
            );
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
        account:  AccountType.cash,
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
        account:  AccountType.cash,
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

