import 'package:flutter/material.dart';
import 'package:personal_finance/widgets/menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page"), centerTitle: true),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // Net Income Card
            _buildCard("Net Income"), // Replace with actual data

            // Total Income Card with Date Picker
            _buildCardWithDatePicker(context),

            // Expenses Card
            _buildCard("Expenses"), // Replace with actual data
          ],
        ),
      ),
    );
  }

 Widget _buildCard(String title,[String value = ""]) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardWithDatePicker(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          children: [
            const Text(
              "Total Income",
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text("Select Date"),
            ),
            // Display income for the selected date here
          ],
        ),
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
}