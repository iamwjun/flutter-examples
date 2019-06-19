import 'package:example/main.dart';
import 'package:example/pages/Provider/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('first screen rebuild');
    final _counter = Provider.of<CounterModel>(context);
    final _textSize = Provider.of<int>(context).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Text(
          'Value: ${_counter.value}',
          style: TextStyle(fontSize: _textSize),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondPage())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

// class FirstPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => new _FirstScreenState();
// }

// class _FirstScreenState extends State<FirstPage> {
//   CounterModel _counter;
//   double _textSize;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _counter = Provider.of<CounterModel>(context);
//     _textSize = Provider.of<int>(context).toDouble();
//     _counter.increment();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('First Page'),
//       ),
//       body: Center(
//         child: Text(
//           'Value: ${_counter.value}',
//           style: TextStyle(fontSize: _textSize),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.of(context)
//             .push(MaterialPageRoute(builder: (context) => SecondPage())),
//         child: Icon(Icons.navigate_next),
//       ),
//     );
//   }
// }
