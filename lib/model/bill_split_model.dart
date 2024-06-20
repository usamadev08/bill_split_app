import 'package:flutter/material.dart';

class BillSplitModel extends ChangeNotifier {
  double _friendsValue = 0.0;
  double _tip = 0.0;
  String _tax = '0';
  String _bill = '';

  double get friendsValue => _friendsValue;
  double get tip => _tip;
  String get tax => _tax;
  String get bill => _bill;

  void setFriendsValue(double value) {
    _friendsValue = value.roundToDouble();
    notifyListeners();
  }

  void setTip(double value) {
    _tip = value;
    notifyListeners();
  }

  void setTax(String value) {
    _tax = value;
    notifyListeners();
  }

  void setBill(String value) {
    _bill = value;
    notifyListeners();
  }

  void clearBill() {
    _bill = '';
    notifyListeners();
  }
}
