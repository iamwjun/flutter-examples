import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '汽车', icon: Icons.directions_car),
  const Choice(title: '火车', icon: Icons.directions_transit),
  const Choice(title: '船', icon: Icons.directions_boat),
  const Choice(title: '自行车', icon: Icons.directions_bike),
  const Choice(title: '客气', icon: Icons.directions_bus),
  const Choice(title: '步行', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget{
  const ChoiceCard({Key key, this.choice}):super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle)
          ],
        ),
      ),
    );
  }
}

class TabbedAppBar extends StatelessWidget {
  final String title;
  TabbedAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
          bottom: TabBar(
            isScrollable: false,
            tabs: choices.map((Choice choice) {
              return Tab(
                text: choice.title,
                icon: Icon(choice.icon),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: choices.map((Choice choice){
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ChoiceCard(choice: choice),
            );
          }).toList(),
        )
      ),
    );
  }
}
