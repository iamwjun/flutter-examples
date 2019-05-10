import 'package:flutter/material.dart';
import 'package:myapp/pages/chart/chart.dart';
import 'package:myapp/pages/chart/schedule.dart';
import 'package:myapp/pages/chart/slider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Instagram
      // title: 'Instagram',
      // debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //     primarySwatch: Colors.blue,
      //     primaryColor: Colors.black,
      //     primaryIconTheme: IconThemeData(color: Colors.black),
      //     primaryTextTheme: TextTheme(
      //         title: TextStyle(color: Colors.black, fontFamily: "Aveny")),
      //     textTheme: TextTheme(title: TextStyle(color: Colors.black))),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          buttonColor: Colors.purple,
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
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
