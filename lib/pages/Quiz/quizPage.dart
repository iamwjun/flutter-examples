import 'package:flutter/material.dart';

import './question.dart';
import './quiz.dart';
import './answerButton.dart';
import './answerText.dart';
import './correctWrongOverlay.dart';
import './scorePage.dart';

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

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overLayShouIdBeVisible = false;

  @override
  void initState(){
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState((){
      overLayShouIdBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          children: <Widget>[
            AnswerButton(true, () {
              handleAnswer(true);
            }),
            AnswerText(questionText, questionNumber),
            AnswerButton(false, () {
              handleAnswer(false);
            })
          ],
        ),
        overLayShouIdBeVisible == true ? CorrectWrongOverLay(
          isCorrect,
          (){
            if(quiz.length == questionNumber){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState((){
              overLayShouIdBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : Container(),
      ],
    );
  }
}
