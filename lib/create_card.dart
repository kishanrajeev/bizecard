import 'package:flutter/material.dart';
import 'app_colors.dart'; // Import the color constants

class CreateCardPage extends StatelessWidget {
  const CreateCardPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        title: Text(title),
      ),
      body: Center(
        child: const Text('Hello from CreateCard Page!'),
      ),
    );
  }
}
