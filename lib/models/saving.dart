import 'dart:ffi';

import 'package:personal_finance/models/category/saving_category.dart';

class Saving {

  late String _name;
  late double _targetAmount;
  late double _actualAmount = 0.0;
  late String _id;

  Saving(this._id, this._name, this._targetAmount, this._actualAmount);

  String get id => _id;
  set id(String value) => _id = value;

  String get name => _name;
  set name(String value) => _name = value;

  double get targetAmount => _targetAmount;
  set targetAmount(double value) => _targetAmount = value;

  double get actualAmount => _actualAmount;
  set actualAmount(double value) => _actualAmount = value;

}