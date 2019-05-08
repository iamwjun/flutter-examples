import 'package:flutter/material.dart';
import 'package:myapp/pages/Instagram/body.dart';
import 'package:image_picker/image_picker.dart';

class InstagramHome extends StatelessWidget {
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
  }

  final AppBar topBar = AppBar(
    backgroundColor: Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading: Icon(Icons.camera_alt),
    title: SizedBox(
      height: 35.0,
      child: Image.asset("assets/images/insta_logo.png"),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: IconButton(
          icon: Icon(Icons.send),
          onPressed: null
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      body: InstagramBody(),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 50.0,
        alignment: Alignment.center,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(icon: Icon(Icons.home), onPressed: () {}),
              IconButton(icon: Icon(Icons.search), onPressed: null),
              IconButton(icon: Icon(Icons.add_box), onPressed: null),
              IconButton(icon: Icon(Icons.favorite), onPressed: null),
              IconButton(icon: Icon(Icons.account_box), onPressed: null),
            ],
          ),
        ),
      ),
    );
  }
}
