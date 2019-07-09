import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Post {
  final int code;
  final String message;
  final String content;

  Post({this.code, this.message, this.content});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        code: json['code'], message: json['message'], content: json['content']);
  }
}

class AlipayDemo extends StatefulWidget {
  final String title;

  AlipayDemo({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlipayDemoState();
}

class _AlipayDemoState extends State<AlipayDemo> {
  static const platform = const MethodChannel('examples.flutter.dev/battery');

  void _initiatedPayment() async {
    final Post result = await _payment();
    if (result.code == 200) {
      final String payInfo = await _sendPaymentParameters(result.content);
      print(payInfo);
    } else {
      _neverSatisfied(result.message);
    }
  }

  Future<void> _neverSatisfied(String content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('发起支付失败'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('错误信息:'),
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('确认'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Post> _payment() async {
    final client = new http.Client();
    Post result;
    try {
      final response = await client
          .get("http://192.168.98.20:8080/alipay")
          .timeout(const Duration(seconds: 5));
      result = Post.fromJson(json.decode(response.body));
    } on PlatformException catch (e) {
      result = Post(code: int.parse(e.code), message: e.message, content: e.toString());
    } on TimeoutException catch (e) {
      result = Post(code: 408, message: e.message, content: e.toString());
    } on FormatException catch (e) {
      result = Post(code: 405, message: e.message, content: e.toString());
    }
    return result;
  }

  Future<String> _sendPaymentParameters(payInfo) async {
    String result;
    try {
      result = await platform.invokeMethod(
          "sendPaymentParameters", <String, dynamic>{"payInfo": payInfo});
    } on PlatformException catch (e) {
      result = e.details;
    }
    return result;
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
            RaisedButton(
              padding: EdgeInsets.only(left: 60.0, right: 60.0),
              child: Text('立即支付'),
              onPressed: _initiatedPayment,
            )
          ],
        ),
      ),
    );
  }
}
