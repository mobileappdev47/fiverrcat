import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import '../addexpense/db/functions/currency_function.dart';
import '../constant.dart';
import 'graph_screen.dart';

class SfChartScreen extends StatefulWidget {
  const SfChartScreen({super.key, required this.monthChartData});

  final Map monthChartData;

  @override
  State<SfChartScreen> createState() => _SfChartScreenState();
}

class _SfChartScreenState extends State<SfChartScreen> {
  @override
  Widget build(BuildContext context) {
    print(monthChartDataGraph!);
    final List<ChartData> chartData = [
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
    final List<Color> color = <Color>[];

    color.add(
      AppTheme.contentColorCyan.withOpacity(0.2),
    );
    color.add(
      AppTheme.contentColorBlue.withOpacity(0.5),
    );
    color.add(
      AppTheme.contentColorCyan.withOpacity(0.5),
    );

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);
    return Container(
      height: 300,
      // width: 200,
      child: SfCartesianChart(
        primaryYAxis:
            // NumericAxis(labelFormat: '${currencySymboleUpdate.value}{value}',
            //
            // //
            // // maximum: 500,
            // //   minimum: 0,
            // ),

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
    );
  }
}
class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}


