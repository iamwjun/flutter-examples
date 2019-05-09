import 'dart:io';

import 'package:flutter/material.dart';

class Kitten {
  const Kitten({this.name, this.description, this.age, this.imageUrl});

  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final String server = Platform.isAndroid ? "192.168.98.20" : "localhost";

final List<Kitten> _kittens = <Kitten>[
  Kitten(
    name: 'Mittens',
    description: 'The pinnacle of cats. When Mittens sits in your lap,',
    age: 11,
    imageUrl: 'http://$server/static/images/kitten0.jpg',
  ),
  Kitten(
    name: 'Fluffy',
    description: 'World\'s cutest kitten. Seriously. We did the the research.',
    age: 3,
    imageUrl: 'http://$server/static/images/kitten1.jpg',
  ),
  Kitten(
    name: 'Scooter',
    description: 'Chases string faster than 9/10 competing kittens.',
    age: 2,
    imageUrl: 'http://$server/static/images/kitten2.jpg',
  ),
  Kitten(
    name: 'Steve',
    description: 'Steve is cool and just kind of hangs out.',
    age: 4,
    imageUrl: 'http://$server/static/images/kitten3.jpg',
  ),
];

class AvailableKittens extends StatelessWidget {
  const AvailableKittens({Key key}) : super(key: key);

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: <Widget>[
        Image.network(
          kitten.imageUrl,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                kitten.name,
                style: localTheme.textTheme.display1,
              ),
              Text(
                '${kitten.age} months age',
                style: localTheme.textTheme.subhead.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                kitten.description,
                style: localTheme.textTheme.body1,
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: <Widget>[
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text('I\'M ALLERGIC'),
                    ),
                    RaisedButton(
                      onPressed: (){},
                      child: Text('ADOPT'),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, _kittens[index])),
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(_kittens[index].name,
            style: Theme.of(context).textTheme.headline),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Availale Kittens'),
      ),
      body: ListView.builder(
        itemCount: _kittens.length,
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}
