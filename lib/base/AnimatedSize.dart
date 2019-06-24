import 'package:flutter/material.dart';

class AnimatedSizeDemo extends StatefulWidget {
  final String title;

  AnimatedSizeDemo({Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AnimatedSizeState();
}

class _AnimatedSizeState extends State<AnimatedSizeDemo>
    with TickerProviderStateMixin {
  double _width = 80.0;
  double _heigth = 80.0;
  var _color = Colors.deepPurple;
  bool _resied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSize(
              curve: Curves.linearToEaseOut,
              duration: Duration(seconds: 1),
              vsync: this,
              child: GestureDetector(
                onTap: () {
                  if (_resied) {
                    setState(() {
                      _width = 80.0;
                      _heigth = 80.0;
                      _color = Colors.deepPurple;
                      _resied = false;
                    });
                  }else{
                    setState(() {
                      _width = 320.0;
                      _heigth = 320.0;
                      _color = Colors.deepPurple;
                      _resied = true;
                    });
                  }
                },
                child: Container(
                  width: _width,
                  height: _heigth,
                  color: _color,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
