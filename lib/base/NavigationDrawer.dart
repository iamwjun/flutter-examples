import 'package:flutter/material.dart';

class NavigationDrawerDemo extends StatefulWidget {
  NavigationDrawerDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => new _NavigateionDrawerState();
}

class _NavigateionDrawerState extends State<NavigationDrawerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                    child: Image.asset('assets/images/insta_logo.png'),
                  ),
                  Text(
                    "抽屉式导航栏",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    "cddxwujun@qq.com",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              decoration: BoxDecoration(color: Colors.deepPurple),
            ),
            ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text('导入', style: TextStyle(fontSize: 16.0)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('相册', style: TextStyle(fontSize: 16.0)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.slideshow),
              title: Text('幻灯片', style: TextStyle(fontSize: 16.0)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('工具', style: TextStyle(fontSize: 16.0)),
              onTap: () => Navigator.pop(context),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('首页', style: TextStyle(fontSize: 16.0)),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('分享', style: TextStyle(fontSize: 16.0)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text('发送', style: TextStyle(fontSize: 16.0)),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('NavigationDrawer'),
      ),
    );
  }
}
