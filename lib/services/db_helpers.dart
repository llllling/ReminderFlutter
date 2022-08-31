import 'package:path/path.dart';
import 'package:remainder_flutter/models/memo.dart';
import 'package:sqflite/sqflite.dart';

enum DBType { sqlite }

class DBDto {
  String tableName;
  String? query;
  Map<String, Object?>? data;
  List<String>? where;
  List<Object>? whereArgs;

  DBDto(this.tableName, {this.query, this.data, this.where, this.whereArgs});
}

abstract class DBHelper {
  DBHelper();
  factory DBHelper.fromJson(DBType type) {
    switch (type) {
      case DBType.sqlite:
        return _Sqlite();
    }
  }
  findAll(DBDto dto);
  find(DBDto dto);
  save(DBDto dto);
  remove(DBDto dto);
  modify(DBDto dto);
}

class _Sqlite extends DBHelper {
  late Database db;

  Future open(Function onCreate) async {
    db = await openDatabase(join(await getDatabasesPath(), 'memo_database.db'),
        onCreate: (Database db, int version) async {
      await onCreate(db);
    });
  }

  Function create(String query) => (Database db) async {
        await db.execute(query);
      };

  Function rawInsert(String query) => (Database db) async {
        return await db.rawInsert(query);
      };

  @override
  Future<List<Map<String, Object?>>> findAll(DBDto dto) async {
    return await db.query(dto.tableName);
  }

  @override
  Future<List<Map<String, Object?>>> find(DBDto dto) async {
    return await db.query(dto.tableName,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  @override
  Future<int> modify(DBDto dto) {
    return db.update(dto.tableName, dto.data!,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  @override
  Future<int> remove(DBDto dto) {
    return db.delete(dto.tableName,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  @override
  Future<int> save(DBDto dto) {
    return db.insert(dto.tableName, dto.data!);
  }

  Future close() async => db.close();
}
