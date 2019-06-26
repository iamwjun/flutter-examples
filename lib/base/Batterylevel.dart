import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryLevel extends StatefulWidget {
  final String title;

  BatteryLevel({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BatteryLevelState();
}

class _BatteryLevelState extends State<BatteryLevel> {
  static const platform = const MethodChannel('examples.flutter.dev/battery');
  String _batteryLevel = '电池电量未知';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = '当前电量: $result %';
    } on PlatformException catch (e) {
      batteryLevel = '获取电池电量失败: ${e.message}';
    }

    setState(() {
     _batteryLevel = batteryLevel; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(_batteryLevel),
            RaisedButton(
              child: Text('Click Me'),
              onPressed: _getBatteryLevel,
            )
          ],
        ),
      ),
    );
  }
}
