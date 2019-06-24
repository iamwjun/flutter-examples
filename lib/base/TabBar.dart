import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  final String title;

  TabBarDemo({Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState(){
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: 'tab 1'),
            Tab(text: 'tab 2'),
            Tab(text: 'tab 3')
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Container(color: Colors.red),
          Container(color: Colors.blue),
          Container(color: Colors.amber)
        ],
        controller: _tabController,
      ),
    );
  }
  
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }
}
