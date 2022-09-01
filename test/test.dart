// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
@TestOn('android')
import 'package:flutter_test/flutter_test.dart';
import 'package:remainder_flutter/services/memo_service.dart';
import 'package:remainder_flutter/services/repeat_cycle_service.dart';

void main() {
  //runApp() 호출 되기전에 바인딩울 초기화해야하는 경우 때문에 사용.. ?
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    final memoService = MemoService();
  });

  test('db open & init', () async {
    final service = RepeatCycleService();
    var result = await service.findAll();
    expect(result, [
      {'code': 'none', 'name': '안함'},
      {'code': 'day', 'name': '매일'},
      {'code': 'week', 'name': '매주'},
      {'code': 'month', 'name': '매월'}
    ]);
  });
}
