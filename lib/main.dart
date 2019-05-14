import 'package:flutter/material.dart';
import 'package:myapp/pages/Signature/home.dart';
import 'package:myapp/pages/Charts/home.dart';
import 'package:myapp/pages/Instagram/home.dart';
import 'package:myapp/pages/AvailableKittens/AvailableKittens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          cardColor: Colors.purple,
          buttonColor: Colors.purple,
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)),
      home: AvailableKittens(),
    );
  }
}
