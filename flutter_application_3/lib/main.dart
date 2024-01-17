import 'package:flutter/material.dart';
import 'package:flutter_application_3/config/routes/routes_activite2.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Flutter Demo';
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: appTitle,
    );
  }
}

