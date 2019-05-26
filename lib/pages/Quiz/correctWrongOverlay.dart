import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CorrectWrongOverLay extends StatefulWidget {

  final bool _isCorrect;

  CorrectWrongOverLay(this._isCorrect);

  @override
  State<StatefulWidget> createState() => new CorrectWrongOverLayState();
}
  
class CorrectWrongOverLayState extends State<CorrectWrongOverLay> with SingleTickerProviderStateMixin {
  
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _iconAnimation = CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticInOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }  
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: InkWell(
        onTap: () => print("Ypu tapped the overlay"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: Icon(widget._isCorrect == true ? Icons.done : Icons.clear, size: _iconAnimation.value * 80.0),
              )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
            ),
            Text(widget._isCorrect == true ? "Correct!" : "Wrong", style: TextStyle(color: Colors.white, fontSize: 30.0),)
          ],
        ),
      ),
    );
  }
}