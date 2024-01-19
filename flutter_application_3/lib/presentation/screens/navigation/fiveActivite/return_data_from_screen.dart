import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
              onPressed: () {
                context.go('/animated');
              },
              icon: const Icon(Icons.arrow_back))
        ],
        title: const Text('Returning Data Demo'),
        centerTitle: true,
      ),
      body: const Center(
        child: SelectionButtom(),
      ),
    );
  }
}

class SelectionButtom extends StatefulWidget {
  const SelectionButtom({super.key});

  @override
  State<SelectionButtom> createState() => _SelectionButtomState();
}

class _SelectionButtomState extends State<SelectionButtom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _navigateAndDisplaySelection(context);
        },
        child: const Text('Pick an option, any option'));
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
              onPressed: () {
                context.go('/animated');
              },
              icon: const Icon(Icons.arrow_back))
        ],
        title: const Text('Pick an option '),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Yep!');
                  },
                  child: const Text('Yep!')),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Nope!');
                  },
                  child: const Text('Nope!')),
            ),
          ],
        ),
      ),
    );
  }
}
