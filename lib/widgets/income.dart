import 'package:flutter/material.dart';

import 'menu.dart';

class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Income")),
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