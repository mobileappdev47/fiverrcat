
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokercat/addexpense/db/functions/category_functions.dart';
import 'package:pokercat/addexpense/db/functions/currency_function.dart';
import 'package:pokercat/addexpense/db/functions/transaction_function.dart';
import 'package:pokercat/addexpense/db/models/category/category_model_db.dart';
import 'package:pokercat/addexpense/db/models/transactions/transaction_model_db.dart';
import 'package:pokercat/addexpense/widget/transaction_helper.dart';
import 'package:pokercat/pages/line_chart_sample2.dart';
import '../constant.dart';
import '../global/component/appbar.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: AppTheme.pcScafoldColor,

      body: Column(
        children: [
          LineChartSample2(),
          Center(child: Text('developing..',
          style: TextStyle(color: AppTheme.allInColor,fontSize: 20.0),))
        ],
      )
    );

  }
}
