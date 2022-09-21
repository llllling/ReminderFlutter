import 'package:flutter/material.dart';
import 'package:remainder_flutter/models/repeat_cycle.dart';
import 'package:remainder_flutter/services/repeat_cycle_service.dart';

class RepeatCycleProvider with ChangeNotifier {
  final RepeatCycleService _service = RepeatCycleService();
  List<RepeatCycle> _repeatCycleList = [RepeatCycle('test', '안함')];
  String _selectedCode = 'none';

  List<RepeatCycle> get repeatCycleList => _repeatCycleList;
  String get selectedCode => _selectedCode;
  set selsetedCode(code) => _selectedCode = code;

  RepeatCycleProvider() {
    findRepeatCycle();
  }

  void findRepeatCycle() async {
    List findResult = await _service.findAll();
    _repeatCycleList =
        findResult.map((data) => RepeatCycle.fromJson(data)).toList();
    notifyListeners();
  }

  void close() {
    _service.close();
  }
}
