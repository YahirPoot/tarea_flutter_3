import 'package:flutter/material.dart';

class FirstRouter extends StatelessWidget {
  const FirstRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('First Router'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Router'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SecondRouter()));
          },
        ),
      ),
    );
  }
}

class SecondRouter extends StatelessWidget {
  const SecondRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Second Router'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            MaterialPageRoute(builder: (context) => const FirstRouter());
          },
          child: const Text('Go Back!'),
        ),
      ),
    );
  }
}
