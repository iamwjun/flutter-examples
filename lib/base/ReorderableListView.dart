import 'package:flutter/material.dart';

class ReorderableListViewDemo extends StatefulWidget {
  final String title;

  ReorderableListViewDemo({Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ReorderableListViewDemoState();
}

class _ReorderableListViewDemoState extends State<ReorderableListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ReorderableListView(
          header: Text("This is the header!"),
          children: [
            for (final item in myItems)
              ListTile(key: ValueKey(item), title: Text('Item #$item'))
          ],
          onReorder: (oldIndex, newIndex) {
            setState(() {
              _updateMyItem(oldIndex, newIndex);
            });
          }),
    );
  }
}
