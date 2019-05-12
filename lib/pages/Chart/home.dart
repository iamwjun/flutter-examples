import 'package:flutter/material.dart';
import 'package:myapp/pages/Chart/chart.dart';
import 'package:myapp/pages/Chart/schedule.dart';
import 'package:myapp/pages/Chart/slider.dart';
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