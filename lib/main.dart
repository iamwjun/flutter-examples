/*
 * 模仿Instagram APP示例
 */
// import 'package:flutter/material.dart';
// import 'package:myapp/pages/Instagram/home.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Instagram',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           primarySwatch: Colors.blue,
//           primaryColor: Colors.black,
//           primaryIconTheme: IconThemeData(color: Colors.black),
//           primaryTextTheme: TextTheme(
//               title: TextStyle(color: Colors.black, fontFamily: "Aveny")),
//           textTheme: TextTheme(title: TextStyle(color: Colors.black))),
//       home: InstagramHome(),
//     );
//   }
// }

/*
 * AvailableKittens APP示例
 */
// import 'package:flutter/material.dart';
// import 'package:myapp/pages/AvailableKittens/AvailableKittens.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AvailableKittens(),
//     );
//   }
// }

/*
 * 图表APP示例
 * 参考: https://google.github.io/charts/flutter/gallery.html
 */
// import 'package:flutter/material.dart';
// import 'package:myapp/pages/Charts/home.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(  
//       theme: ThemeData(
//           primarySwatch: Colors.purple,
//           cardColor: Colors.purple,
//           buttonColor: Colors.purple,
//           buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)),
//       home: PieChart(),
//     );
//   }
// }

/*
 * 签名APP示例
 */
// import 'package:flutter/material.dart';
// import 'package:myapp/pages/Signature/home.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SignatureHome(),
//     );
//   }
// }

/*
 * 简单的答题APP示例
 */
// import 'package:flutter/material.dart';
// import './pages/Quiz/landingPage.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LandingPage(),
//     );
//   }
// }

/*
 * 炫酷示例
 * next https://github.com/Solido/awesome-flutter
 */

/*
 * 基础组件使用
 * next https://github.com/ibhavikmakwana/FlutterPlayground
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}






