import 'package:flutter/material.dart';
import 'package:personal_finance/widgets/utils/widget_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Home Page"),
          centerTitle: true,
          foregroundColor: Colors.blue),
      body: Center(
        child: ListView(
          children: [
            WidgetUtils.buildCard("Net Income", "This is your Net Income", context),
            WidgetUtils.buildCard("Expenses", "These are your expenses", context)
          ],
        ),
      ),
    );
  }
}
