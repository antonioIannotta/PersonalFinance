import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../utils/utils.dart';

class WidgetUtils {
  static Widget buildCard(String title, String subtitle, BuildContext context,
      [String value = ""]) {
    var dataMap = FinanceManagementUtils.createDataMap();
    return Card(
      elevation: 4,
      child: Column(
        children: [
          getTitleAndSubtitle(title, subtitle),
          Container(
            padding: const EdgeInsets.fromLTRB(600, 1, 1, 50),
            child: Row(
              children: [
                getDropdownMonth(),
                const SizedBox(width: 16),
                getDropdownYear(),
              ],
            ),
          ),
          getPieChart(dataMap),
        ],
      ),
    );
  }

  static ListTile getTitleAndSubtitle(String title, String subtitle) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 18)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 18)),
    );
  }

  static DropdownButton<int> getDateDropdown(String category) {
    return category == "month" ? getDropdownMonth() : getDropdownYear();
  }

  static DropdownButton<int> getDropdownMonth() {
    return DropdownButton<int>(
      value: DateTime.now().month,
      onChanged: (newValue) {
        //Here the logic when the value changes
      },
      items: List.generate(12, (index) {
        return DropdownMenuItem<int>(
          value: index + 1,
          child: Text('${index + 1}'),
        );
      }),
    );
  }

  static DropdownButton<int> getDropdownYear() {
    //here the code for the year
    //TODO: insert here the code for the retrieve of the year;
  }

  static Container getPieChart(Map<String, double> dataMap) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.topRight,
      child: PieChart(dataMap: dataMap),
    );
  }
}
