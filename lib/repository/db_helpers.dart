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

//처음엔 값이 없으니까 생성, 두번째부턴 cache에 있으므로 생성된 거 반환
  factory DBHelper({Function? init}) {
    return _cache.putIfAbsent('singleton', () => DBHelper._internal(init!));
  }

  DBHelper._internal(Function init) {
    _open(init);
  }

  Future<void> _open(Function onCreate) async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'memo_database.db'),
    );
  }

  Function rawQueryExecute(DBDto dto) => (Database db) async {
        await db.execute(dto.queryString!);
      };

  Future<List<Map<String, Object?>>> findAll(DBDto dto) async {
    return db.query(dto.tableName!);
  }

  Future<List<Map<String, Object?>>> find(DBDto dto) async {
    return db.query(dto.tableName!,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  Future<int> modify(DBDto dto) {
    return db.update(dto.tableName!, dto.data!,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  Future<int> remove(DBDto dto) {
    return db.delete(dto.tableName!,
        where: dto.where?.reduce((value, element) => value += '$element = ? '),
        whereArgs: dto.whereArgs);
  }

  Future<int> save(DBDto dto) {
    return db.insert(dto.tableName!, dto.data!);
  }

  Future<void> close() async => db.close();

  Future<void> transction(Function queries) async {
    await db.transaction((txn) async {
      for (Function func in queries()) {
        await func(db);
      }
    });
  }
}
