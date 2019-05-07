import 'package:flutter/material.dart';

TextStyle boot = TextStyle(
  color: Colors.white,
  fontSize: 24.0,
  fontWeight: FontWeight.w900,
);

var base = Container(
  child: Center(
    child: Container(
      child: Text('Lorem 3 ipsum', style: boot),
      decoration: BoxDecoration(color: Colors.red[400]),
      padding: EdgeInsets.all(16.0),
      width: 240.0,
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);

var position = Container(
  child: Stack(
    children: <Widget>[
      Positioned(
        child: Container(
          child: Text("Lorem 3 ipsum", style: boot),
          decoration: BoxDecoration(color: Colors.red[400]),
          padding: EdgeInsets.all(16.0),
        ),
        left: 24.0,
        top: 24.0,
      ),
    ],
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);

var transform = Container(
  child: Center(
    child: Transform(
      child: Container(
        child: Text(
          "lorem ipsum 10",
          style: boot,
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
          color: Colors.red[400],
        ),
        padding: EdgeInsets.all(16.0),
      ),
      alignment: Alignment.center,
      //transform: Matrix4.identity()..rotateZ(15 * 3.1415927 / 180),
      transform: Matrix4.identity()..scale(1.5),
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);

var linearGradient = Container(
  child: Center(
    child: Container(
      child: Text(
        "lorem ipsum",
        style: boot,
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: const Alignment(-10, 0.0),
              end: const Alignment(0.6, 0),
              colors: <Color>[
            const Color(0xffef5350),
            const Color(0x00ef5350)
          ])),
      padding: EdgeInsets.all(16.0),
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);

var borderRadius = Container(
  child: Center(
    child: Container(
      child: Text(
        "Lorem ipsum",
        style: boot,
      ),
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: BorderRadius.all(
          const Radius.circular(8.0),
        ),
      ),
      padding: EdgeInsets.all(16.0),
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);

var boxShadows = Container(
  child: Center(
    child: Container(
      child: Text("Lorem ipsum", style: boot),
      decoration: BoxDecoration(color: Colors.red[400], boxShadow: <BoxShadow>[
        BoxShadow(
            color: const Color(0xcc000000),
            offset: Offset(0.0, 2.0),
            blurRadius: 4.0),
        BoxShadow(
            color: const Color(0x80000000),
            offset: Offset(0.0, 6.0),
            blurRadius: 20.0)
      ]),
      padding: EdgeInsets.all(16.0),
    ),
  ),
  width: 320.0,
  height: 240.0,
  decoration: BoxDecoration(
    color: Colors.grey[300],
  ),
  margin: EdgeInsets.only(bottom: 16.0),
);

var boxShapes = Container(
  child: Center(
    child: Container(
      child: Text(
        "Lorem ipsum",
        style: boot,
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(
        color: Colors.red[400],
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(16.0),
      width: 160.0,
      height: 160.0,
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);

var letterSpacing = Container(
  child: Center(
    child: Container(
      child: Text("Lorem ipsum",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
            letterSpacing: 4.0,
          )),
      decoration: BoxDecoration(
        color: Colors.red[400],
      ),
      padding: EdgeInsets.all(16.0),
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[400],
);

var formatting = Container(
  child: Center(
    child: Container(
      // red box
      child: RichText(
        text: TextSpan(
          style: boot,
          children: <TextSpan>[
            TextSpan(text: "Lorem "),
            TextSpan(
              text: "ipsum",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                fontSize: 48.0,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.red[400],
      ),
      padding: EdgeInsets.all(16.0),
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[300],
);

var textOverflow = Container(
  child: Center(
    child: Container(
      child: Text(
        "Lorem ipsum dolor sit amet, consec etur",
        style: boot,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      decoration: BoxDecoration(
        color: Colors.red[400]
      ),
    ),
  ),
  width: 320.0,
  height: 240.0,
  color: Colors.grey[400],
);

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('style demo 2'),
      ),
      body: textOverflow,
    );
  }
}
