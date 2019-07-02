// import 'dart:io';
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:example/pages/Instagram/body.dart';
// import 'package:image_picker/image_picker.dart';

// class InstagramHome extends StatefulWidget {
//   @override
//   _InstagramHomeState createState() => _InstagramHomeState();
// }

// class _InstagramHomeState extends State<InstagramHome> {
//   File image;

//   Future getImage() async {
//     var _image = await ImagePicker.pickImage(source: ImageSource.camera);

//     setState(() {
//       image = _image;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xfff8faf8),
//         centerTitle: true,
//         elevation: 1.0,
//         leading: IconButton(
//           icon: Icon(Icons.camera_alt),
//           onPressed: getImage,
//         ),
//         title: SizedBox(
//           height: 35.0,
//           child: Image.asset('assets/images/insta_logo.png'),
//         ),
//         actions: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(right: 12.0),
//             child: Icon(Icons.send),
//           )
//         ],
//       ),
//       body: Center(
//         child: InstagramBody(image: image),
//       ),
//       bottomNavigationBar: Container(
//         color: Colors.white,
//         height: 50.0,
//         alignment: Alignment.center,
//         child: BottomAppBar(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               IconButton(icon: Icon(Icons.home), onPressed: () {}),
//               IconButton(icon: Icon(Icons.search), onPressed: null),
//               IconButton(icon: Icon(Icons.add_box), onPressed: null),
//               IconButton(icon: Icon(Icons.favorite), onPressed: null),
//               IconButton(icon: Icon(Icons.account_box), onPressed: null),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
