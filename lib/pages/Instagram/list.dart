import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/pages/Instagram/stories.dart';

class InstagramList extends StatelessWidget {
  InstagramList({Key key, @required this.image}) : super(key: key);

  final File image;
  final String avatar =
      "https://tvax1.sinaimg.cn/crop.0.0.1080.1080.180/0072ZpCHly8fykk2eckixj30u00u0dju.jpg";
  final String replyAvatar =
      "https://tva2.sinaimg.cn/crop.0.0.180.180.180/bd294defjw1e8qgp5bmzyj2050050aa8.jpg";
  final String beat =
      "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => index == 0
          ? SizedBox(
              child: InstagramStories(),
              height: deviceSize.height * 0.15,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(avatar))),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Beautiful day begins",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
                Flexible(
                    fit: FlexFit.loose,
                    child: image == null
                        ? Image.network(
                            beat,
                            fit: BoxFit.cover,
                          )
                        : Image.file(image)),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.heart),
                          SizedBox(
                            width: 16.0,
                          ),
                          Icon(FontAwesomeIcons.comment),
                          SizedBox(
                            width: 16.0,
                          ),
                          Icon(FontAwesomeIcons.paperPlane),
                        ],
                      ),
                      Icon(FontAwesomeIcons.bookmark)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(replyAvatar),
                            )),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add a comment...",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "1 Day Ago",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
    );
  }
}
