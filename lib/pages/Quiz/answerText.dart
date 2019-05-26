import 'package:flutter/material.dart';

class AnswerText extends StatefulWidget {
  final String _question;
  final int _questionNumber;

  AnswerText(this._question, this._questionNumber);

  @override
  State<StatefulWidget> createState() => new AnserTextState();
}

class AnserTextState extends State<AnswerText>
    with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = AnimationController(duration: Duration(microseconds: 500), vsync: this);
    _fontSizeAnimation = CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.bounceInOut);
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Center(
          child: Text("Statement " + widget._questionNumber.toString() + ": " + widget._question,
            style: TextStyle(fontSize: _fontSizeAnimation.value * 15)
          ),
        ),
      ),
    );
  }
}
