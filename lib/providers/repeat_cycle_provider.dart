import 'package:flutter/material.dart';
import 'package:remainder_flutter/models/repeat_cycle.dart';
import 'package:remainder_flutter/services/repeat_cycle_service.dart';

class RepeatCycleProvider with ChangeNotifier {
  final RepeatCycleService _service = RepeatCycleService();
  List<RepeatCycle> _repeatCycle = [];
  List<RepeatCycle> get repeatCycle => _repeatCycle;

  void findRepeatCycle() async {
    List findResult = await _service.findAll();
    _repeatCycle =
        findResult.map((data) => RepeatCycle.fromJson(data)).toList();
    notifyListeners();
  }

  void close() {
    _service.close();
  }
}
