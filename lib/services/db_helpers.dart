import 'package:remainder_flutter/models/memo.dart';
import 'package:sqflite/sqflite.dart';

enum DBType { sqlite }

abstract class DBHelper {
  factory DBHelper.fromJson(Map<String, dynamic> json) {
    switch (json['type'] as DBType) {
      case DBType.sqlite:
        return _Sqlite();
    }
  }
  create([Map param]);
  find([Map param]);
  save([Map param]);
  remove([Map param]);
  modify([Map param]);
  close([Map param]);
}

class _Sqlite implements DBHelper {
  final String tableName = 'memo';
  late Database db;
  Map<String,dynamic> test = {
    
  }
  Future open(String path) async {
    db = await openDatabase(
      path,
      onCreate: (Database db, int version) async => { 
        await create(  'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, noticeDate TEXT, repeat INTEGER )'),
    );
  }

 @override
  Future<void> create(Map{db : Database,  query : String} param) {
    return db.execute(query);
  }

  @override
  find() {}

  @override
  modify() {}

  @override
  remove() {}

  @override
  Future<int> save(Map<Memo> memo) {
    return db.insert(tableName, memo.toJson());
  }

 @override
  Future close() async => db.close();
}
