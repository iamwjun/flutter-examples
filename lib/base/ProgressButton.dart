import 'dart:async';

import 'package:flutter/material.dart';

class ProgressButton extends StatefulWidget {
  ProgressButton({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => new _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  int _state = 0;
  Animation _animation;
  AnimationController _controller;
  GlobalKey _globalKey = GlobalKey();
  double _width = double.infinity;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: PhysicalModel(
          elevation: 8.0,
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.lightGreen,
          shadowColor: Colors.lightGreen,
          child: Container(
            key: _globalKey,
            color: Colors.lightGreen,
            height: 48.0,
            width: _width,
            child: RaisedButton(
              padding: EdgeInsets.all(0.0),
              child: setUpButtonChild(),
              onPressed: () {
                setState(() {
                  if (_state == 0) {
                    animateButton();
                  }
                });
              },
              elevation: 4.0,
              color: Colors.lightGreen,
            ),
          ),
        ),
      ),
    );
  }

  setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Click Here",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        value: null,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    double initialWidth = _globalKey.currentContext.size.width;

    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - 48.0) * _animation.value);
        });
      });
    _controller.forward();

    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }
}
