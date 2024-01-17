import 'package:flutter/material.dart';
import 'package:flutter_application_3/config/menuaitems/menu_items.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: const Center(child: Text('Hola Bienvenido')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Task 3'),
            ),
            ...listMenuItems.map((e) => ListTile(
              trailing: Icon(e.icon),
              title: Text(e.title),
              onTap: () {
                context.push(e.route);
              },
            )),
          ],
        ),
      ),
    );
  }
}
