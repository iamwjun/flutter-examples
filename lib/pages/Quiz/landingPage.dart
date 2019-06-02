import 'package:flutter/material.dart';
import './quizPage.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.greenAccent,
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => QuizPage())),
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