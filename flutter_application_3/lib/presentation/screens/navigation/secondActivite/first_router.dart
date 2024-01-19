import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstRouter extends StatelessWidget {
  const FirstRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text('Second Router'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/');
          },
          child: const Text('Go Back!'),
        ),
      ),
    );
  }
}
