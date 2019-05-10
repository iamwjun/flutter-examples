import 'package:flutter/material.dart';
import 'package:myapp/pages/chart/schedule.dart';
import 'package:provider/provider.dart';

class MySlider extends StatefulWidget {
  @override
  createState() => _SliderState();
}

class _SliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<MySchedule>(context);
    return Slider(
      value: schedule.stateManagementTime,
      onChanged: (value) => schedule.stateManagementTime = value,
    );
  }
}
