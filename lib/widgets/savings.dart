import 'package:flutter/material.dart';

class Saving extends StatelessWidget {
  const Saving({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Savings")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/');
          },
        child: const Text("Return to the Home Page")
        )
      )
    );
  }
}