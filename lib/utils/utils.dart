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
}