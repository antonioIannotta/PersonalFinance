class Income {

  late String _category;
  late int _id;
  late double _amount;
  late String _description;
  late DateTime _dateTime;

  Income(this._id, this._category, this._amount, this._description,
      this._dateTime) {
    if (!(_isCategoryValid(_category, CategoryController.getCategories()) &&
        _isAmountValid(_amount) &&
        _isDescriptionValid(_description))) {
      throw ArgumentError();
    }
  }

    String get category => _category;
    set category(String value) => _category = value;

    int get id => _id;
    set id(int id) => _id = id;

    double get amount => _amount;
    set amount(double value) => _amount = value;

    String get description => _description;
    set description(String value) => _description = value;

    DateTime get dateTime => _dateTime;
    set dateTime(DateTime value) => _dateTime = value;






}