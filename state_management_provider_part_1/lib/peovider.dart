import 'package:flutter/material.dart';

class counterPeovider with ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }

  void derement() {
    count--;
    notifyListeners();
  }
}
