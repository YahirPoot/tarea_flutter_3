import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String route;
  final IconData icon;

  MenuItem({required this.title, required this.route, required this.icon});
}

List<MenuItem> listMenuItems = [
  MenuItem(
      title: 'Animate a Widget Across Screens',
      route: '/animated',
      icon: Icons.abc),
  MenuItem(
      title: 'Navigate to a new screen and back',
      route: '/navigation_buttom',
      icon: Icons.navigate_next),
  MenuItem(
      title: 'Navigate with named routes',
      route: '/navigation_name',
      icon: Icons.navigate_next),
  MenuItem(
      title: 'Pass argument to a named route',
      route: '/name_route',
      icon: Icons.navigate_next),
  MenuItem(
      title: 'Return data from a screen',
      route: '/return_data',
      icon: Icons.navigate_next),
  MenuItem(
      title: 'Send data to new screen',
      route: '/todos_activite',
      icon: Icons.navigate_next),
  MenuItem(
      title: 'Fetch data from the Internet',
      route: '/album_1',
      icon: Icons.navigate_next),
  MenuItem(
      title: 'Make authenticated requests',
      route: '/album_2',
      icon: Icons.navigate_next),
  MenuItem(
      title: 'Send data to the Internet',
      route: '/send_data',
      icon: Icons.navigate_next),
  MenuItem(
      title: 'Update data over the ineternet',
      route: '/update_data',
      icon: Icons.navigate_next),
  MenuItem(
      title: 'Delete data on the internet',
      route: '/delete_data',
      icon: Icons.navigate_next),
  MenuItem(
      title: 'Communicate with WebSockets',
      route: '/communicate_websocket',
      icon: Icons.navigate_next),
  MenuItem(
      title: 'Parse JSON in the background',
      route: '/parse_json',
      icon: Icons.navigate_next),
  MenuItem(
      title: 'Persist data with SQLite',
      route: '/slq_activite',
      icon: Icons.navigate_next),
  MenuItem(
      title: 'Read and Write Files',
      route: '/read_files',
      icon: Icons.navigate_next)
];
