import 'dart:collection';

import '../models/category/category.dart';

class FinanceManagementUtils {

  static double minimumThreshold = 0.0;

  static bool isCategoryValid(String category, List<String> categories) {
    for (String c in categories) {
      if (c == category.toUpperCase()) {
        return true;
      }
    }
    return false;
  }

  static bool isAmountValid(double amount) {
    return amount > minimumThreshold;
  }

  static bool isDescriptionValid(String description) {
    return description.isNotEmpty;
  }

  static Map<String, double> createDataMap() {
    Map<String, double> map = HashMap();
    for (Category c in Category.values) {
      map[c.name] = 10.0;
    }
    return map;
  }
}