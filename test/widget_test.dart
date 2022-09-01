// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:remainder_flutter/providers/repeat_cycle_provider.dart';

void main() {
  test('findRepeatCycle in repeat_cycle_provider returns list', () async {
    final provider = RepeatCycleProvider();
    provider.findRepeatCycle();
    expect(provider.repeatCycle, [
      {'code': 'none', 'name': '안함'},
      {'code': 'day', 'name': '매일'},
      {'code': 'week', 'name': '매주'},
      {'code': 'month', 'name': '매월'}
    ]);
  });
}
