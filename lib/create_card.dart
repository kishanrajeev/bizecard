import 'package:flutter/material.dart';

class CreateCardPage extends StatelessWidget {
  const CreateCardPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: const Text('Hello from CreateCard Page!'),
      ),
    );
  }
}
