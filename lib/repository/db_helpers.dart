import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

enum DBType { sqlite }

class DBDto {
  String? tableName;
  String? queryString;
  Map<String, Object?>? data;
  List<String>? where;
  List<Object>? whereArgs;

  DBDto(
      {this.tableName,
      this.queryString,
      this.data,
      this.where,
      this.whereArgs});
}

abstract class DBHelper {
  DBHelper();
  factory DBHelper.fromJson(DBType type, {Function? init}) {
    switch (type) {
      case DBType.sqlite:
        return Sqlite(init: init);
    }
  }
  Future<List<Map<String, Object?>>> findAll(DBDto dto);
  Future<List<Map<String, Object?>>> find(DBDto dto);
  Future<int> save(DBDto dto);
  Future<int> remove(DBDto dto);
  Future<int> modify(DBDto dto);
  void close();
  Function rawQueryExecute(DBDto dto);
}

class Sqlite extends DBHelper {
  late Database db;
  static final Map<String, Sqlite> _cache = <String, Sqlite>{};

//처음엔 값이 없으니까 생성, 두번째부턴 cache에 있으므로 생성된 거 반환
  factory Sqlite({Function? init}) {
    return _cache.putIfAbsent('singleton', () => Sqlite._internal(init!));
  }

  Sqlite._internal(Function init) {
    _open(init);
  }

  Future<void> _open(Function onCreate) async {
    db = await openDatabase(join(await getDatabasesPath(), 'memo_database.db'),
        onCreate: (Database db, int version) async {
      for (Function func in onCreate()) {
        await func(db);
      }
    });
  }

  @override
  Function rawQueryExecute(DBDto dto) => (Database db) async {
        await db.execute(dto.queryString!);
      };

  @override
  Future<List<Map<String, Object?>>> findAll(DBDto dto) async {
    return db.query(dto.tableName!);
  }

  @override
  Future<List<Map<String, Object?>>> find(DBDto dto) async {
    return db.query(dto.tableName!,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  @override
  Future<int> modify(DBDto dto) {
    return db.update(dto.tableName!, dto.data!,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  @override
  Future<int> remove(DBDto dto) {
    return db.delete(dto.tableName!,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  @override
  Future<int> save(DBDto dto) {
    return db.insert(dto.tableName!, dto.data!);
  }

  @override
  Future close() async => db.close();
}
