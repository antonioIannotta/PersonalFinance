class Expense {

  late double _amount;
  late String _category;
  late String _description;
  late DateTime _dateTime;

  Expense(this._category, this._description, this._amount, this._dateTime) {
    if (FinanceManagementUtils.isCategoryValid(
        category, CategoryController.getCategories()) &&
        FinanceManagementUtils.isAmountValid(amount) &&
        FinanceManagementUtils.isDescriptionValid(description)) {
      _category = _category;
      _description = _description;
      _amount = _amount;
      _dateTime = _dateTime;
    } else {
      throw ArgumentError();
    }
  }

  double get amount => _amount;
  set amount(double value) => _amount = value;

  String get category => _category;
  set category(String value) => _category = value;

  String get description => _description;
  set description(String value) => _description = value;

  DateTime get dateTime => _dateTime;
  set dateTime(DateTime value) => _dateTime = value;
}