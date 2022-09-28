import 'package:flutter/material.dart';
import 'package:memomemo/models/repeat_cycle.dart';
import 'package:memomemo/services/repeat_cycle_service.dart';

class RepeatCycleProvider with ChangeNotifier {
  final RepeatCycleService _service = RepeatCycleService();
  List<RepeatCycle> repeatCycleList = [];

  RepeatCycleProvider() {
    findRepeatCycle();
  }

  void findRepeatCycle() async {
    List findResult = await _service.findAll();
    repeatCycleList =
        findResult.map((data) => RepeatCycle.fromJson(data)).toList();
    notifyListeners();
  }

  void close() {
    _service.close();
  }
}
