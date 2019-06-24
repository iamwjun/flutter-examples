import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  BottomNavigationBarDemo({Key key, this.title}) : super(key: key);
  final String title;
  State<StatefulWidget> createState() => _BottomNavigationBartDemoState();
}

class _BottomNavigationBartDemoState extends State<BottomNavigationBarDemo> {
  int _indexBar = 0;

  void _onItemTapped(int index) {
    setState(() {
      _indexBar = index;
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/');
          break;
        case 1:
         Navigator.pushNamed(context, '/ProgressButton');
         break;
        case 2:
         Navigator.pushNamed(context, '/NavigationDrawer');
         break;
        default:
          Navigator.pushNamed(context, '/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Text(widget.title)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked), title: Text('进度按钮')),
          BottomNavigationBarItem(
              icon: Icon(Icons.low_priority), title: Text('抽屉导航'))
        ],
        currentIndex: _indexBar,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
