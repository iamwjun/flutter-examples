import 'package:flutter/material.dart';

class ReorderableListViewDemo extends StatefulWidget {
  final String title;

  ReorderableListViewDemo({Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ReorderableListViewDemoState();
}

class _ReorderableListViewDemoState extends State<ReorderableListViewDemo> {
  List<String> data = ["aaa", "bbb", "ccc", "ddd", "eee", "fff"];

  void onreorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      var x = data.removeAt(oldIndex);
      data.insert(newIndex, x);
    });
  }

  void onSort() {
    setState(() {
      data.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            tooltip: "Sort it",
            onPressed: onSort,
          )
        ],
      ),
      body: ReorderableListView(
        header: Text("title"),
        children: data
            .map((index) => ListTile(
                contentPadding: EdgeInsets.all(20.0),
                key: ObjectKey(index),
                title: Text("$index"),
                subtitle: Text("Move it anywherer")))
            .toList(),
        onReorder: onreorder,
      ),
    );
  }
}
