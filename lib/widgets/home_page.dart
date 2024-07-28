import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:personal_finance/models/category/category.dart';
import 'package:personal_finance/widgets/menu.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page"), centerTitle: true,
      foregroundColor: Colors.blue),
      body: Center(
        child: ListView(
          //scrollDirection: Axis.vertical,
          children: [
            // Net Income Card
            _buildCard("Net Income", "This is your Net Income", context), // Replace with actual data

            // Expenses Card
            _buildCard("Expenses", "This is the amount of your expenses", context), // Replace with actual data
          ],
        ),
      ),
    );
  }

 Widget _buildCard(String title, String subtitle, BuildContext context, [String value = ""]) {
    var dataMap = _createDataMap();
    return Card(
      elevation: 4,
      //child: Padding(
      //padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text( title,
              style: const TextStyle(fontSize: 18)
            ),
              subtitle: Text(subtitle,
              style: const TextStyle(fontSize: 18)),

            ),
            //const SizedBox(height: 8),
            //const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.fromLTRB(100, 1, 1, 50),
              child: const Text("Menu"),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(100, 1, 1, 50),
              child: ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text("Select Date"),
            ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.topRight,
              child: PieChart(dataMap: dataMap),
            )
          ],
        ),
      );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      // Handle the selected date (e.g., fetch income data for that date)
    }
  }

  Map<String, double> _createDataMap() {
    Map<String, double> map = HashMap();
    for (Category c in Category.values) {
      map[c.toString()] = 10.0;
    }
    return map;
  }
}