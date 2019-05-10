import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:myapp/pages/chart/schedule.dart';
import 'dart:math';
import 'package:provider/provider.dart';

class MyChart extends StatelessWidget {
  final seriesList = createData(0.4);

  @override
  Widget build(BuildContext context) {
    return Consumer<MySchedule>(
      builder: (context, schedule, _) => PieChart(
            createData(schedule.stateManagementTime),
            animate: false,            
            defaultRenderer: ArcRendererConfig(
              arcRendererDecorators: [
                ArcLabelDecorator(
                  labelPosition: ArcLabelPosition.inside,
                )
              ],
            ),
          ),
    );
  }

  static List<Series<LinearSales, String>> createData(
    double stateMgmtTime,
  ) {
    final random = new Random();

    final data = [
      LinearSales('UX', stateMgmtTime),
      LinearSales('UI', random.nextDouble()),
      LinearSales('State', random.nextDouble()),
      LinearSales('Process', random.nextDouble()),
    ];

    return [
      Series<LinearSales, String>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.name,
        measureFn: (LinearSales sales, _) => sales.sales,
        //colorFn: (LinearSales clickData, _) => Colors.purple,
        colorFn: (_, __) => MaterialPalette.red.shadeDefault,
        data: data,
      )
    ];
  }
}

class LinearSales {
  final String name;
  final double sales;

  LinearSales(this.name, this.sales);
}
