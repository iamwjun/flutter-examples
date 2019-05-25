import 'package:flutter/material.dart';

import './question.dart';
import './quiz.dart';
import './answerButton.dart';
import './answerText.dart';

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
            AnswerText('piza is nice', 1),
            AnswerButton(false, () {
              print('you answered false');
            })
          ],
        ),
      ],
    );
  }
}
