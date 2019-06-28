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
    final String payInfo = await _sendPaymentParameters(result.content);
    print(payInfo);
  }

  Future<Post> _payment() async {
    final response = await http.get("http://192.168.98.20:8080/alipay");
    return Post.fromJson(json.decode(response.body));
  }

  Future<String> _sendPaymentParameters(payInfo) async {
    String result;
    try {
      result = await platform.invokeMethod("sendPaymentParameters", payInfo);
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
