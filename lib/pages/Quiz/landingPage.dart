import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.greenAccent,
      child: InkWell(
        onTap: () => print('We tapped this pages!'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Let's Quizzz", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),
            Text('Tap to starts', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0))
          ],
        ),
      ),
    );
  }
}