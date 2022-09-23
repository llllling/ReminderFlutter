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
  late Database db;
  static final Map<String, DBHelper> _cache = <String, DBHelper>{};
  late String dbPath;
//처음엔 값이 없으니까 생성, 두번째부턴 cache에 있으므로 생성된 거 반환
  factory DBHelper({Function? init}) {
    return _cache.putIfAbsent('singleton', () => DBHelper._internal(init!));
  }

  DBHelper._internal(Function init) {
    _open(init);
  }

  _open(Function onCreate) async {
    dbPath = await getDatabasesPath();
    db = await openDatabase(join(dbPath, 'memo_database.db'), version: 1,
        onCreate: (Database db, int version) async {
      await onCreate(db);
    });
  }

  DatabaseExecutor _databaseExct(DatabaseExecutor? execDb) {
    return execDb ?? db;
  }

  Database _database(Database? execDb) {
    return execDb ?? db;
  }

  Future rawQueryExecute(DBDto dto, {DatabaseExecutor? db}) async {
    await _databaseExct(db).execute(dto.queryString!);
  }

  Future<List<Map<String, Object?>>> rawQueryForSelect(DBDto dto,
      {DatabaseExecutor? db}) async {
    return _databaseExct(db).rawQuery(dto.queryString!);
  }

  Future<List<Map<String, Object?>>> findAll(DBDto dto,
      {DatabaseExecutor? db}) async {
    return _databaseExct(db).query(dto.tableName!);
  }

  Future<List<Map<String, Object?>>> find(DBDto dto,
      {DatabaseExecutor? db}) async {
    return _databaseExct(db).query(dto.tableName!,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  Future<int> modify(DBDto dto, {DatabaseExecutor? db}) {
    return _databaseExct(db).update(dto.tableName!, dto.data!,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  Future<int> remove(DBDto dto, {DatabaseExecutor? db}) {
    return _databaseExct(db).delete(dto.tableName!,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  Future<int> save(DBDto dto, {DatabaseExecutor? db}) {
    return _databaseExct(db).insert(dto.tableName!, dto.data!);
  }

  Future<void> close({Database? db}) async {
    _database(db).close();
  }

  Future<void> transction(Function queries, {Database? db}) async {
    await _database(db).transaction((txn) async {
      for (Function func in queries(txn)) {
        await func();
      }
    });
  }
}
