import 'package:flutter/material.dart';

import './question.dart';
import './quiz.dart';
import './answerButton.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            AnswerButton(true, () {
              print('you answered true');
            }),
            Material(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text("statement 1: pizz is nice"),
                ),
              ),
            ),
            AnswerButton(false, () {
              print('you answered false');
            })
          ],
        ),
      ],
    );
  }
}
