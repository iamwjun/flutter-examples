import 'package:flutter/material.dart';

import './question.dart';
import './quiz.dart';
import './answerButton.dart';
import './answerText.dart';
import './correctWrongOverlay.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = Quiz([
    Question("Elon Musk is huma", false),
    Question("Pizza is healthy", false),
    Question("Flutter is aweso", true)
  ]);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
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
        CorrectWrongOverLay(true),
      ],
    );
  }
}
