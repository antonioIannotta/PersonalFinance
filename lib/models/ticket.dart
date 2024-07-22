class Ticket {

  late double _amount;
  late String _id;
  late int _number;
  late int _used;

  Ticket(String _id, this._amount, this._number, this._used) {
    _amount = _amount;
    _id = _id;
    _number = _number;
  }

  int get number => _number;
  set number(int value) => _number = value;

  String get id => _id;
  set id(String value) => _id = id;

  double get amount => _amount;
  set amount(double value) => _amount = value;

  int get used => _used;
  set used(int value) => _used = value;

}