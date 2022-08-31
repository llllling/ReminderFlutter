import 'package:path/path.dart';
import 'package:remainder_flutter/models/memo.dart';
import 'package:sqflite/sqflite.dart';

enum DBType { sqlite }

abstract class DBHelper {
  factory DBHelper.fromJson(Map<String, Object> json) {
    switch (json['type'] as DBType) {
      case DBType.sqlite:
        return _Sqlite();
    }
  }
  findAll();
  find(Map dto);
  save(Map dto);
  remove(Map dto);
  modify(Map dto);
}

class _Sqlite implements DBHelper {
  final String tableName = 'memo';
  late Database db;
  _Sqlite() {
    open();
  }

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'memo_database.db'),
        onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE repeat_cycle (code TEXT PRIMARY KEY, name TEXT)');
    await db.rawInsert(
        'INSERT INTO repeat_cycle(code, name) VALUES("none", "안함"), ("day", "매일"), ("week", "매주"), ("month", "매월")');
    await db.execute(
        'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, noticeDate TEXT, repeat TEXT,  FOREIGN KEY(repeat) REFERENCES repeat_cycle(code) )');
  }

  @override
  Future<List<Memo>> findAll() async {
    List<Map<String, Object?>> result = await db.query(tableName);
    return result.map((data) => Memo.fromJson(data)).toList();
  }

  @override
  Future<Memo?> find(Map dto) async {
    List<Map<String, Object?>> result =
        await db.query(tableName, where: 'id = ?', whereArgs: [dto['data'].id]);

    return result.isNotEmpty ? Memo.fromJson(result[0]) : null;
  }

  @override
  Future<int> modify(Map dto) {
    return db.update(tableName, dto['data'].toJson(),
        where: 'id = ?', whereArgs: [dto['data'].id]);
  }

  @override
  Future<int> remove(Map dto) {
    return db.delete(tableName, where: 'id = ?', whereArgs: [dto['data'].id]);
  }

  @override
  Future<int> save(Map dto) {
    return db.insert(tableName, dto['data'].toJson());
  }

  Future close() async => db.close();
}
