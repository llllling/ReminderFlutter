import 'package:remainder_flutter/models/memo.dart';
import 'package:remainder_flutter/repository/db_helpers.dart';

class MemoService {
  late final DBHelper dbHelper;
  final String tableName = 'memo';

  MemoService() {
    dbHelper = DBHelper(init: init);
  }

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
              'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, noticeDate TEXT, repeat TEXT,  FOREIGN KEY(repeat) REFERENCES repeat_cycle(code) )'))
    ];
  }

  Future<List<Map<String, Object?>>> findAll() async {
    return dbHelper.findAll(DBDto(tableName: tableName));
  }

  Future<int> save(Memo memo) async {
    return dbHelper.save(DBDto(tableName: tableName, data: memo.toJson()));
  }

  Future<int> remove(int id) async {
    return dbHelper
        .remove(DBDto(tableName: tableName, where: ['id'], whereArgs: [id]));
  }

  Future<int> modify(Memo memo) async {
    return dbHelper.modify(DBDto(
        tableName: tableName,
        data: memo.toJson(),
        where: ['id'],
        whereArgs: [memo.id]));
  }

  void close() {
    dbHelper.close();
  }
}
