import 'package:flutter/material.dart';

import 'menu.dart';

class Saving extends StatelessWidget {
  const Saving({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Savings")),
      body: const Center(
        child: Column(
         children: [
           AnimatedMenuButton()
            ]
        )
      )
    );
  }
}