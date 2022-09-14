import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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

class DBHelper {
  late Database _db;
  static final Map<String, DBHelper> _cache = <String, DBHelper>{};
  late String _dbPath;
  String get dbPath => _dbPath;
//처음엔 값이 없으니까 생성, 두번째부턴 cache에 있으므로 생성된 거 반환
  factory DBHelper({Function? init}) {
    return _cache.putIfAbsent('singleton', () => DBHelper._internal(init!));
  }

  DBHelper._internal(Function init) {
    _open(init);
  }

  _open(Function onCreate) async {
    _dbPath = await getDatabasesPath();
    _db = await openDatabase(join(_dbPath, 'memo_database.db'), version: 1,
        onCreate: (Database db, int version) async {
      // await onCreate(db);
      db.execute(
          'CREATE TABLE repeat_cycle (code TEXT PRIMARY KEY, name TEXT)');
    });
  }

  Database _database(Database? db) {
    return db ?? _db;
  }

  Future<void> rawQueryExecute(DBDto dto, {Database? db}) async {
    await _database(db).execute(dto.queryString!);
  }

  Future<List<Map<String, Object?>>> findAll(DBDto dto, {Database? db}) async {
    return _database(db).query(dto.tableName!);
  }

  Future<List<Map<String, Object?>>> find(DBDto dto, {Database? db}) async {
    return _database(db).query(dto.tableName!,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  Future<int> modify(DBDto dto, {Database? db}) {
    return _database(db).update(dto.tableName!, dto.data!,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  Future<int> remove(DBDto dto, {Database? db}) {
    return _database(db).delete(dto.tableName!,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  Future<int> save(DBDto dto, {Database? db}) {
    return _database(db).insert(dto.tableName!, dto.data!);
  }

  Future<void> close({Database? db}) async {
    _database(db).close();
  }

  Future<void> transction(Function queries, {Database? db}) async {
    await _database(db).transaction((txn) async {
      for (Function func in queries()) {
        await func(txn);
      }
    });
  }
}
