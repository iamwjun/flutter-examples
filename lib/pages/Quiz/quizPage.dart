import 'package:flutter/material.dart';

import './question.dart';
import './quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Expanded(
          child: Material(
            color: Colors.greenAccent,
            child: InkWell(
              onTap: () => print('You answered true'),
              child: Center(
                child: Container(
                  child: Text('True'),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Material(
            color: Colors.redAccent,
            child: InkWell(
              onTap: () => print('You answered fals'),
              child: Center(
                child: Container(
                  child: Text("false"),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
