import 'package:flutter/material.dart';

class GoogleMaps extends StatefulWidget{
  final String title;

  GoogleMaps({Key key, this.title}):super(key: key);

  @override
  State<StatefulWidget> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Google 地图'),
      ),
    );
  }
}