import 'package:flutter/material.dart';

class CounterViewmodel extends ChangeNotifier {
  int _count = 0;

  int get counter => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (_count > 0) {
      _count--;
    } else {
      _count = 0;
    }

    notifyListeners();
  }
}
