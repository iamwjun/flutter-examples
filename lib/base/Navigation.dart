import 'package:flutter/material.dart';
import 'package:example/base/routes.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件示例'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: routelist.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 4.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 4.0,
                    color: Colors.red
                  )
                )
              ),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, routelist[index].navigation),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                        child: Text(
                          routelist[index].title,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_right
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), title: Text('钱包')),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('设置'))
        ],
      ),
    );
  }
}
