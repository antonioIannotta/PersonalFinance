import 'category/debt_category.dart';

class Debt {

  late double _originalAmount;
  late double _remainingAmount;
  late int _remainingInstalments;
  late String _description;
  late DebtCategory _debtCategory;
  late Map<DateTime, double> _paymentsDate;
  late double _instalmentAmount;
  late String _id;

  Debt(this._id, this._originalAmount, this._remainingAmount, this._remainingInstalments, this._description,
      this._debtCategory, this._paymentsDate, this._instalmentAmount) {
    _originalAmount = _originalAmount;
    _remainingAmount = _remainingAmount;
    _remainingInstalments = _remainingInstalments;
    _description = _description;
    _debtCategory = _debtCategory;
    _paymentsDate = _paymentsDate;
    _instalmentAmount = _instalmentAmount;
  }

  double get instalmentAmount => _instalmentAmount;
  set instalmentAmount(double value) => _instalmentAmount = value;

  Map<DateTime, double> get paymentsDate => _paymentsDate;
  set paymentsDate(Map<DateTime, double> value) => _paymentsDate = value;

  double get originalAmount => _originalAmount;

  int get remainingInstalments => _remainingInstalments;

  double get remainingAmount => _remainingAmount;

  DebtCategory get debtCategory => _debtCategory;

  String get description => _description;

  String get id => _id;

  set description(String value) => _description = value;

  set debtCategory(DebtCategory value) => _debtCategory = value;

  set remainingAmount(double value) => _remainingAmount = value;

  set remainingInstalments(int value) => _remainingInstalments = value;

  set id(String value) => _id = value;

}