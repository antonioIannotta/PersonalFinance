import 'package:flutter/material.dart';

class MonthYearPicker extends StatefulWidget {
  @override
  _MonthYearPickerState createState() => _MonthYearPickerState();
}

class _MonthYearPickerState extends State<MonthYearPicker> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton<int>(
          value: selectedMonth,
          onChanged: (newValue) {
            setState(() {
              selectedMonth = newValue!;
            });
          },
          items: List.generate(12, (index) {
            return DropdownMenuItem<int>(
              value: index + 1,
              child: Text('${index + 1}'),
            );
          }),
        ),
        SizedBox(width: 16),
        DropdownButton<int>(
          value: selectedYear,
          onChanged: (newValue) {
            setState(() {
              selectedYear = newValue!;
            });
          },
          items: List.generate(10, (index) {
            final year = DateTime.now().year - 5 + index;
            return DropdownMenuItem<int>(
              value: year,
              child: Text('$year'),
            );
          }),
        ),
      ],
    );
  }
}