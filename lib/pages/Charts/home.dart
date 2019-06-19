import 'package:flutter/material.dart';
import 'package:example/pages/Charts/chart.dart';
import 'package:example/pages/Charts/schedule.dart';
import 'package:example/pages/Charts/slider.dart';
import 'package:provider/provider.dart';

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => MySchedule(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Time spent'),
          leading: Icon(Icons.menu),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: MyChart(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: MySlider(),
            )
          ],
        ),
      ),
    );
  }
}