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
            AnswerButton(true, (){print('true');}),
            AnswerButton(false, (){print('true');})
          ],
        ),
      ],
    );
  }
}
