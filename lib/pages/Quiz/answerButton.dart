import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  bool answer;
  VoidCallback _onTap;

  AnswerButton(this.answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: answer ? Colors.greenAccent : Colors.redAccent,
        child: InkWell(
          onTap: () => _onTap,
          child: Center(
            child: Container(
              child: Text(answer ? 'True' : 'false'),
            ),
          ),
        ),
      ),
    );
  }
}
