import 'imports.dart';
import 'package:flutter/material.dart';

class RouteItem {
  String navigation;
  String title;

  RouteItem(this.navigation, this.title);
}

List<RouteItem> routelist = [
  RouteItem('/NavigationDrawer', '抽屉式导航栏'),
  RouteItem('/AnimatedSwitcher', '动画切换器'),
  RouteItem('/ProgressButton', '进度按钮'),
  RouteItem('/BottomNavigation', '底部导航'),
  RouteItem('/TabBar', 'Tab Bar'),
  RouteItem('/TabbedAppBar', 'Tabbed AppBar'),
];

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    '/': (context) => Navigation(),
    '/NavigationDrawer': (context) => NavigationDrawerDemo(title: '抽屉式导航栏'),
    '/AnimatedSwitcher': (context) => AnimatedSwitcherDemo(title: '动画切换器'),
    '/ProgressButton': (context) => ProgressButton(title: '进度按钮'),
    '/BottomNavigation': (context) => BottomNavigationBarDemo(title: '底部导航'),
    '/TabBar': (context) => TabBarDemo(title: 'Tab bar'),
    '/TabbedAppBar': (context) => TabbedAppBar(title: 'Tabbed AppBar'),
  };
}