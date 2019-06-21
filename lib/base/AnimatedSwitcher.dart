import 'package:flutter/material.dart';

class AnimatedSwitcherDemo extends StatefulWidget {
  AnimatedSwitcherDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedSwitcherState createState() => _AnimatedSwitcherState();
}

class _AnimatedSwitcherState extends State<AnimatedSwitcherDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            Text(
              'You have pushed the button this many times:',
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) =>
                  ScaleTransition(child: child, scale: animation),
              child: Text(
                '$_counter',
                key: ValueKey<int>(_counter),
                style: Theme.of(context).textTheme.display1,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}