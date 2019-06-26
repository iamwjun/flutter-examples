import 'package:flutter/material.dart';

class AlipayDemo extends StatefulWidget {
  final String title;

  AlipayDemo({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlipayDemoState();
}

class _AlipayDemoState extends State<AlipayDemo> {
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
            RaisedButton(
              padding: EdgeInsets.only(left: 60.0, right: 60.0),
              child: Text('立即支付'),
              onPressed: () {
                print('发起支付');
              },
            )
          ],
        ),
      ),
    );
  }
}
