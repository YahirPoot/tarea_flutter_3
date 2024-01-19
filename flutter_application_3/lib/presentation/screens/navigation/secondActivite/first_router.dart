import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstRouter extends StatelessWidget {
  const FirstRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/animated');
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.cyan,
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
        actions: [
          IconButton(
              onPressed: () {
                context.go('/animated');
              },
              icon: const Icon(Icons.arrow_back)),
        ],
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text('Second Router'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back!'),
        ),
      ),
    );
  }
}
