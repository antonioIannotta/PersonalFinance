enum DebtCategory {
  general,
  dentistry,
  car;

  static DebtCategory returnCategoryFromString(String categoryString) {
    for (DebtCategory dc in DebtCategory.values) {
      if (dc.toString().toLowerCase() == categoryString.toLowerCase()) {
        return dc;
      }
    }
    return DebtCategory.general;
  }
}