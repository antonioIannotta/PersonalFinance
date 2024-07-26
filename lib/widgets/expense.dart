import 'package:flutter/material.dart';

import 'menu.dart';

class Expense extends StatelessWidget {
  const Expense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expenses")),
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