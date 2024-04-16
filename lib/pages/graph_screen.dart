import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:pokercat/addexpense/db/functions/category_functions.dart';
import 'package:pokercat/addexpense/db/functions/currency_function.dart';
import 'package:pokercat/addexpense/db/functions/transaction_function.dart';
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
  Map monthChartDataGraph={};
List<ChartData> chartData = [

];
final List<Color> color = <Color>[];
final List<double> stops = <double>[];
initialize(){
  chartData = [
    ChartData('jan', double.parse(monthChartDataGraph!['jan']['total'])),
    ChartData('feb', double.parse(monthChartDataGraph!['feb']['total'])),
    ChartData('mar', double.parse(monthChartDataGraph!['mar']['total'])),
    ChartData('apr', double.parse(monthChartDataGraph!['apr']['total'])),
    ChartData('may', double.parse(monthChartDataGraph!['may']['total'])),
    ChartData('jun', double.parse(monthChartDataGraph!['jun']['total'])),
    ChartData('july',double.parse(monthChartDataGraph!['july']['total'])),
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



  @override
  void initState() {
    initialize();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    print(monthChartDataGraph!);

    print(TransactionDB.instance.transactionMonthListNotifier.value);

    final LinearGradient gradientColors =
    LinearGradient(colors: color, stops: stops);

    return Scaffold(
        backgroundColor: AppTheme.pcScafoldColor,
        body: Column(
          children: [
            // LineChartSample2(),
            // SfChartScreen(
            //   monthChartData: monthChartDataGraph!,
            // ),
            Container(
              height: 300,
              // width: 200,
              child: SfCartesianChart(
                primaryYAxis:
                NumericAxis(),
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
                            chartData=[
                              ChartData('jan', double.parse(monthChartDataGraph!['jan']['total'])),
                              ChartData('feb', double.parse(monthChartDataGraph!['feb']['total'])),
                              ChartData('mar', double.parse(monthChartDataGraph!['mar']['total'])),
                              ChartData('apr', double.parse(monthChartDataGraph!['apr']['total'])),
                              ChartData('may', double.parse(monthChartDataGraph!['may']['total'])),
                              ChartData('jun', double.parse(monthChartDataGraph!['jun']['total'])),
                              ChartData('july',double.parse(monthChartDataGraph!['july']['total'])),
                              ChartData('Aug', double.parse(monthChartDataGraph!['aug']['total'])),
                              ChartData('Sep', double.parse(monthChartDataGraph!['sep']['total'])),
                              ChartData('Oct', double.parse(monthChartDataGraph!['oct']['total'])),
                              ChartData('Nov', double.parse(monthChartDataGraph!['nov']['total'])),
                              ChartData('Dec', double.parse(monthChartDataGraph!['dec']['total'])),
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

                            chartData =[
                              ChartData('jan', double.parse(monthChartDataGraph!['jan']['expense'])),
                              ChartData('feb', double.parse(monthChartDataGraph!['feb']['expense'])),
                              ChartData('mar', double.parse(monthChartDataGraph!['mar']['expense'])),
                              ChartData('apr', double.parse(monthChartDataGraph!['apr']['expense'])),
                              ChartData('may', double.parse(monthChartDataGraph!['may']['expense'])),
                              ChartData('jun', double.parse(monthChartDataGraph!['jun']['expense'])),
                              ChartData('july', double.parse(monthChartDataGraph!['july']['expense'])),
                              ChartData('Aug', double.parse(monthChartDataGraph!['aug']['expense'])),
                              ChartData('Sep', double.parse(monthChartDataGraph!['sep']['expense'])),
                              ChartData('Oct', double.parse(monthChartDataGraph!['oct']['expense'])),
                              ChartData('Nov', double.parse(monthChartDataGraph!['nov']['expense'])),
                              ChartData('Dec', double.parse(monthChartDataGraph!['dec']['expense'])),

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
                            chartData =[
                              ChartData('jan', double.parse(monthChartDataGraph!['jan']['income'])),
                              ChartData('feb', double.parse(monthChartDataGraph!['feb']['income'])),
                              ChartData('mar', double.parse(monthChartDataGraph!['mar']['income'])),
                              ChartData('apr', double.parse(monthChartDataGraph!['apr']['income'])),
                              ChartData('may', double.parse(monthChartDataGraph!['may']['income'])),
                              ChartData('jun', double.parse(monthChartDataGraph!['jun']['income'])),
                              ChartData('july', double.parse(monthChartDataGraph!['july']['income'])),
                              ChartData('Aug', double.parse(monthChartDataGraph!['aug']['income'])),
                              ChartData('Sep', double.parse(monthChartDataGraph!['sep']['income'])),
                              ChartData('Oct', double.parse(monthChartDataGraph!['oct']['income'])),
                              ChartData('Nov', double.parse(monthChartDataGraph!['nov']['income'])),
                              ChartData('Dec', double.parse(monthChartDataGraph!['dec']['income'])),

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(Icons.replay_outlined,color: Colors.white,),
                          SizedBox(width: 10,)
                    ,                    Text(         '1 day',
                            style: TextStyle(
                                color:  Colors.white,

                                fontWeight: FontWeight.w600,
                                fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 45,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child:Icon(Icons.filter_alt_rounded,color: Colors.white,),
                  ),

                ],
              ),
            ),

          ],
        ));
  }
}
class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}