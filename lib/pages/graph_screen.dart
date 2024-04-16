import 'dart:math';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:pokercat/addexpense/db/functions/category_functions.dart';
import 'package:pokercat/addexpense/db/functions/currency_function.dart';
import 'package:pokercat/addexpense/db/functions/transaction_function.dart';
import 'package:pokercat/addexpense/db/models/account_group/account_group_model_db.dart';
import 'package:pokercat/addexpense/db/models/category/category_model_db.dart';
import 'package:pokercat/addexpense/db/models/transactions/transaction_model_db.dart';
import 'package:pokercat/addexpense/widget/transaction_helper.dart';
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

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  String selected = 'All';
  String dropdownvalue = '1 Day';
  var items = [
    '1 Day',
    '1 Week',
    '1 Month',
    '1 Year',

  ];


  String selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  List<TransactionModel>  filterList = [];

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(TransactionDB.instance.transactionMonthListNotifier.value);

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
              Container(
                height: 300,
                // width: 200,
                child: SfCartesianChart(
                  primaryYAxis: NumericAxis(),
                  primaryXAxis: CategoryAxis(),
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
                              selected = 'All';
                              chartData = [
                                ChartData(
                                    'jan',
                                    double.parse(
                                        monthChartDataGraph!['jan']['total'])),
                                ChartData(
                                    'feb',
                                    double.parse(
                                        monthChartDataGraph!['feb']['total'])),
                                ChartData(
                                    'mar',
                                    double.parse(
                                        monthChartDataGraph!['mar']['total'])),
                                ChartData(
                                    'apr',
                                    double.parse(
                                        monthChartDataGraph!['apr']['total'])),
                                ChartData(
                                    'may',
                                    double.parse(
                                        monthChartDataGraph!['may']['total'])),
                                ChartData(
                                    'jun',
                                    double.parse(
                                        monthChartDataGraph!['jun']['total'])),
                                ChartData(
                                    'july',
                                    double.parse(
                                        monthChartDataGraph!['july']['total'])),
                                ChartData(
                                    'Aug',
                                    double.parse(
                                        monthChartDataGraph!['aug']['total'])),
                                ChartData(
                                    'Sep',
                                    double.parse(
                                        monthChartDataGraph!['sep']['total'])),
                                ChartData(
                                    'Oct',
                                    double.parse(
                                        monthChartDataGraph!['oct']['total'])),
                                ChartData(
                                    'Nov',
                                    double.parse(
                                        monthChartDataGraph!['nov']['total'])),
                                ChartData(
                                    'Dec',
                                    double.parse(
                                        monthChartDataGraph!['dec']['total'])),
                              ];
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
                            setState(() {
                              selected = 'Expense';

                              chartData = [
                                ChartData(
                                    'jan',
                                    double.parse(monthChartDataGraph!['jan']
                                        ['expense'])),
                                ChartData(
                                    'feb',
                                    double.parse(monthChartDataGraph!['feb']
                                        ['expense'])),
                                ChartData(
                                    'mar',
                                    double.parse(monthChartDataGraph!['mar']
                                        ['expense'])),
                                ChartData(
                                    'apr',
                                    double.parse(monthChartDataGraph!['apr']
                                        ['expense'])),
                                ChartData(
                                    'may',
                                    double.parse(monthChartDataGraph!['may']
                                        ['expense'])),
                                ChartData(
                                    'jun',
                                    double.parse(monthChartDataGraph!['jun']
                                        ['expense'])),
                                ChartData(
                                    'july',
                                    double.parse(monthChartDataGraph!['july']
                                        ['expense'])),
                                ChartData(
                                    'Aug',
                                    double.parse(monthChartDataGraph!['aug']
                                        ['expense'])),
                                ChartData(
                                    'Sep',
                                    double.parse(monthChartDataGraph!['sep']
                                        ['expense'])),
                                ChartData(
                                    'Oct',
                                    double.parse(monthChartDataGraph!['oct']
                                        ['expense'])),
                                ChartData(
                                    'Nov',
                                    double.parse(monthChartDataGraph!['nov']
                                        ['expense'])),
                                ChartData(
                                    'Dec',
                                    double.parse(monthChartDataGraph!['dec']
                                        ['expense'])),
                              ];
                            });
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
                            setState(() {
                              selected = 'Income';
                              chartData = [
                                ChartData(
                                    'jan',
                                    double.parse(
                                        monthChartDataGraph!['jan']['income'])),
                                ChartData(
                                    'feb',
                                    double.parse(
                                        monthChartDataGraph!['feb']['income'])),
                                ChartData(
                                    'mar',
                                    double.parse(
                                        monthChartDataGraph!['mar']['income'])),
                                ChartData(
                                    'apr',
                                    double.parse(
                                        monthChartDataGraph!['apr']['income'])),
                                ChartData(
                                    'may',
                                    double.parse(
                                        monthChartDataGraph!['may']['income'])),
                                ChartData(
                                    'jun',
                                    double.parse(
                                        monthChartDataGraph!['jun']['income'])),
                                ChartData(
                                    'july',
                                    double.parse(monthChartDataGraph!['july']
                                        ['income'])),
                                ChartData(
                                    'Aug',
                                    double.parse(
                                        monthChartDataGraph!['aug']['income'])),
                                ChartData(
                                    'Sep',
                                    double.parse(
                                        monthChartDataGraph!['sep']['income'])),
                                ChartData(
                                    'Oct',
                                    double.parse(
                                        monthChartDataGraph!['oct']['income'])),
                                ChartData(
                                    'Nov',
                                    double.parse(
                                        monthChartDataGraph!['nov']['income'])),
                                ChartData(
                                    'Dec',
                                    double.parse(
                                        monthChartDataGraph!['dec']['income'])),
                              ];
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

                              return
                                StatefulBuilder(builder: (context, update) {
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
                                          Container(

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
                                            height: 50,
                                            child: Row(
                                              children: [
                                                SizedBox(width: 10,),
                                                Icon(Icons.grid_view,color: Colors.white,),

                                                SizedBox(width: 10,),

                                                Text(
                                                  'All Time',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(


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
                                                    Icon(Icons.autorenew_rounded,color:Colors.white ,),
                                                    SizedBox(width: 10,),

                                                    Text(
                                                      'Cycle',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 18),
                                                    ),


                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Every',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 16),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    DropdownButton(
                                                      // Initial Value
                                                      value: dropdownvalue,
                                                      dropdownColor: Colors.black,
                                                      style:  TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 18),
                                                      // Down Arrow Icon
                                                      icon: const Icon(Icons.keyboard_arrow_down),

                                                      // Array list of items
                                                      items: items.map((String items) {
                                                        return DropdownMenuItem(
                                                          value: items,
                                                          child: Text(items),
                                                        );
                                                      }).toList(),
                                                      // After selecting the desired option,it will
                                                      // change button value to selected value
                                                      onChanged: (String? newValue) {
                                                        setState(() {
                                                          dropdownvalue = newValue!;
                                                        });
                                                        update.call(() {

                                                        },);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'beginning',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 16),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    GestureDetector(
                                                      onTap: () async {

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
                                                          initialDate: DateTime.now(),
                                                          firstDate: DateTime.now()
                                                              .subtract(const Duration(days: 90)),
                                                          lastDate: DateTime.now(),
                                                        );
                                                        if(date!= null){
                                                          selectedDate= DateFormat('dd-MM-yyyy').format(date);
                                                          setState(() {

                                                          });
                                                          update.call(() {

                                                          },);
                                                        }

                                                      },
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            selectedDate,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 18),
                                                          ),
                                                          Container(height: 1,color: Colors.white,width: 100,),

                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
width: 100,
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
                                            height: 30,
                                            child: Text(
                                              'Done',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
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
                              Icon(
                                Icons.replay_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '1 day',
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
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            var data = TransactionDB
                                .instance.transactionListNotifier.value;
                            print(data);

                            return Container(
                              height: 180.0,
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            List<TransactionModel>  cashTransaction = [];
                                            for (int i = 0;
                                                i < data.length;
                                                i++) {
                                              if (data[i].category.name ==
                                                  'Cash') {
                                                cashTransaction.add(data[i]);
                                              } else {}
                                            }
                                            filterList = cashTransaction;
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
                                            List<TransactionModel>  onlineTransaction = [];
                                            for (int i = 0;
                                                i < data.length;
                                                i++) {
                                              if (data[i].category.name ==
                                                  'Online') {
                                                onlineTransaction.add(data[i]);
                                              } else {}
                                            }
                                            filterList = onlineTransaction;
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
                                            List<TransactionModel>  otherTransaction = [];
                                            for (int i = 0;
                                                i < data.length;
                                                i++) {
                                              if (data[i].category.name ==
                                                  'Other') {
                                                otherTransaction.add(data[i]);
                                              } else {}
                                            }
                                            filterList = otherTransaction;
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
                                            List<TransactionModel>  tournamentTransaction = [];
                                            for (int i = 0;
                                                i < data.length;
                                                i++) {
                                              if (data[i].category.name ==
                                                  'Tournament') {
                                                tournamentTransaction
                                                    .add(data[i]);
                                              } else {}
                                            }
                                            filterList = tournamentTransaction;
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
                                    ),
                                  ],
                                ),
                              ),
                            );

                          },
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.filter_alt_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

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

                              Text('Amount : ',style: TextStyle(color: Colors.white),),
                              Text('${currencySymboleUpdate.value}${filterList[index].amount}',style: TextStyle(color:

                              filterList[index].categoryType==CategoryType.income?
                              Colors.green: Colors.red),),

                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text('Transaction Type : ',style: TextStyle(color: Colors.white),),
                              Text('${filterList[index].category.name}',style: TextStyle(color: Colors.white),),

                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text('Date : ',style: TextStyle(color: Colors.white),),
                              Text('${filterList[index].date}',style: TextStyle(color: Colors.white),),

                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text('Category : ',style: TextStyle(color: Colors.white),),
                              filterList[index].categoryType==CategoryType.income? Text('Income',style: TextStyle(color: Colors.white),):
                              Text('Expense',style: TextStyle(color: Colors.white),),
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
