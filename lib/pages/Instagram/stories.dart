import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InstagramStories extends StatelessWidget {
  final Row topText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text("Stories", style: TextStyle(fontWeight: FontWeight.bold)),
      Row(
        children: <Widget>[
          Icon(Icons.play_arrow),
          Text("Watch All", style: TextStyle(fontWeight: FontWeight.bold))
        ],
      )
    ],
  );

  final Expanded stories = Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://tva2.sinaimg.cn/crop.0.0.640.640.180/6a6b9a4ejw8ewsdyhql9hj20hs0htjsd.jpg")),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
                index == 0
                    ? Positioned(
                        right: 10.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          radius: 10.0,
                          child: Icon(
                            Icons.add,
                            size: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          topText,
          stories,
        ],
      ),
    );
  }
}
