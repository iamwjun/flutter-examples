import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:myapp/pages/Chart/schedule.dart';
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
    final data = [      
      LinearSales(
        'UX',
        0.1,
        Color.fromOther(color: Color(r: 225, g: 186, b: 136)),
      ),
      LinearSales(
        'UI Programming',
        0.2,
        Color.fromOther(color: Color(r: 183, g: 45, b: 64)),
      ),
      
      LinearSales(
        'Backend',
        0.3,
        Color.fromOther(color: Color(r: 120, g: 179, b: 155)),
      ),
      LinearSales(
        'State Management',
        stateMgmtTime,
        Color.fromOther(color: Color(r: 40, g: 17, b: 58)),
      ),
    ];

    return [
      Series<LinearSales, String>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.name,
        measureFn: (LinearSales sales, _) => sales.sales,
        colorFn: (LinearSales sales, __) => sales.color,
        data: data,
      )
    ];
  }
}

class LinearSales {
  final String name;
  final double sales;
  final color;

  LinearSales(this.name, this.sales, this.color);
}
