import 'package:flutter/material.dart';
import 'package:flutter_application_3/config/menuaitems/menu_items.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Actividades',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontFamily: AutofillHints.oneTimeCode),
              ),
            ),
            // const DrawerHeader(
            //   decoration: BoxDecoration(color: Colors.blue),
            //   child: Text('Task 3'),
            // ),
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const DetailScreen();
            }));
          },
          child: Hero(
            tag: 'imageHero',
            child: Image.network('https://picsum.photos/250?image=9'),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
      ),
    );
  }
}
