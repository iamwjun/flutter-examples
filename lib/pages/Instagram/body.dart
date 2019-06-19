import 'dart:io';

import 'package:flutter/material.dart';
import 'package:example/pages/Instagram/list.dart';

class InstagramBody extends StatelessWidget {
  InstagramBody({Key key, @required this.image}) : super(key: key);
  final File image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: InstagramList(image: this.image),
        )
      ],
    );
  }
}