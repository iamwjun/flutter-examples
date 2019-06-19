/*
 * 模仿Instagram APP示例
 */
// import 'package:flutter/material.dart';
// import 'package:example/pages/Instagram/home.dart';

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
// import 'package:example/pages/AvailableKittens/AvailableKittens.dart';

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
// import 'package:example/pages/Charts/home.dart';

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
// import 'package:example/pages/Signature/home.dart';

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

// /*
//  * Provider
//  * next https://juejin.im/post/5d00a84fe51d455a2f22023f
//  */
import 'package:example/pages/Provider/FirstPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;
  int get value => _count;

  void increment(){
    _count++;
    notifyListeners();
  }

  void decrement(){
    _count--;
    notifyListeners();
  }
}

void main(){
  final counter = CounterModel();
  final textSize = 48;

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: textSize),
        ChangeNotifierProvider.value(value: counter)
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: FirstPage()
    );
  }
}

/*
 * 炫酷示例
 * next https://github.com/Solido/awesome-flutter
 */

/*
 * Beautiful Material Search App
 * next https://www.youtube.com/watch?v=FPcl1tu0gDs
 */

/*
 * 基础组件使用
 * next https://github.com/ibhavikmakwana/FlutterPlayground
 */






