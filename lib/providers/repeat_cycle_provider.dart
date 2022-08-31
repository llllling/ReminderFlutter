import 'package:flutter/material.dart';

class RepeatCycleProvider with ChangeNotifier {
  RepeatCycleProvider() {
    _initRepeatCycle();
  }
  _initRepeatCycle() {}

  findRepeatCycle() {
    notifyListeners();
  }
}
