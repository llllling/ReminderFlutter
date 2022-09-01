// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
@TestOn('android')
import 'package:flutter_test/flutter_test.dart';
import 'package:remainder_flutter/repository/db_helpers.dart';

void main() {
  //runApp() 호출 되기전에 바인딩울 초기화해야하는 경우 때문에 사용.. ?
  TestWidgetsFlutterBinding.ensureInitialized();
  test('db init test', () async {
    late DBHelper dbHelper;
    Future<List<Function>> init() async {
      return [
        dbHelper.rawQueryExecute(DBDto(
            queryString:
                'CREATE TABLE repeat_cycle (code TEXT PRIMARY KEY, name TEXT)')),
        dbHelper.rawQueryExecute(DBDto(
            queryString:
                'INSERT INTO repeat_cycle(code, name) VALUES("none", "안함"), ("day", "매일"), ("week", "매주"), ("month", "매월")')),
        dbHelper.rawQueryExecute(DBDto(
            queryString:
                'CREATE TABLE memo (id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, noticeDate TEXT, repeat TEXT,  FOREIGN KEY(repeat) REFERENCES repeat_cycle(code) )'))
      ];
    }

    dbHelper = DBHelper(init: init);
  });

  // test('db open & init', () async {
  //   final memoProvider = MemoProvider();
  //   final service = RepeatCycleService();
  //   var result = await service.findAll();
  //   expect(result, [
  //     {'code': 'none', 'name': '안함'},
  //     {'code': 'day', 'name': '매일'},
  //     {'code': 'week', 'name': '매주'},
  //     {'code': 'month', 'name': '매월'}
  //   ]);
  // });
}
