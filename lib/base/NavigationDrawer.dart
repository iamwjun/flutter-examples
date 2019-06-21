import 'package:flutter/material.dart';

class NavigationDrawerDemo extends StatefulWidget {
  NavigationDrawerDemo({Key key, this.title}): super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => new _NavigateionDrawerState();
}

class _NavigateionDrawerState extends State<NavigationDrawerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('NavigationDrawer'),
      ),
    );
  }  
}