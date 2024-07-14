import 'dart:ffi';

import 'package:personal_finance/models/category/saving_category.dart';

class Savings {

  late SavingCategory _name;
  late double _targetAmount;
  late double _actualAmount = 0.0;

  Savings(this._name, this._targetAmount, this._actualAmount);

  SavingCategory get name => _name;
  set name(SavingCategory value) => _name = value;

  double get targetAmount => _targetAmount;
  set targetAmount(double value) => _targetAmount = value;

  double get actualAmount => _actualAmount;
  set actualAmount(double value) => _actualAmount = value;

}