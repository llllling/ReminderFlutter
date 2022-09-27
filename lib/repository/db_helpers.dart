import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'init_query.dart';

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
  bool isDBOpen = false;
  static final DBHelper _dbHelper = DBHelper._internal();
  late String dbPath;

//처음엔 값이 없으니까 생성, 두번째부턴 cache에 있으므로 생성된 거 반환
  factory DBHelper() => _dbHelper;
  DBHelper._internal();

  Future<Database> _open() async {
    if (isDBOpen) return db;

    dbPath = await getDatabasesPath();
    db = await openDatabase(join(dbPath, DBConfig.dbFileName), version: 1,
        onCreate: (Database d, int version) async {
      await create(d);
    });
    isDBOpen = db.isOpen;
    return db;
  }

  Future<T> _database<T>(T? execDB) async {
    return execDB ?? (await _open()) as T;
  }

  create(Database dbInstance) {
    transction(
        (txn) => DBConfig.initQuery.map((query) =>
            () => rawQueryExecute(DBDto(queryString: query), db: txn)),
        db: dbInstance);
  }

  Future rawQueryExecute(DBDto dto, {DatabaseExecutor? db}) async {
    await (await _database<DatabaseExecutor>(db)).execute(dto.queryString!);
  }

  Future<List<Map<String, Object?>>> rawQueryForSelect(DBDto dto,
      {DatabaseExecutor? db}) async {
    return await (await _database<DatabaseExecutor>(db))
        .rawQuery(dto.queryString!);
  }

  Future<List<Map<String, Object?>>> findAll(DBDto dto,
      {DatabaseExecutor? db}) async {
    return await (await _database<DatabaseExecutor>(db)).query(dto.tableName!);
  }

  Future<List<Map<String, Object?>>> find(DBDto dto,
      {DatabaseExecutor? db}) async {
    return await (await _database<DatabaseExecutor>(db)).query(dto.tableName!,
        where: dto.where
            ?.fold('', (value, element) => value = '$value $element = ? '),
        whereArgs: dto.whereArgs);
  }

  Future<int> modify(DBDto dto, {DatabaseExecutor? db}) async {
    return await (await _database<DatabaseExecutor>(db)).update(
        dto.tableName!, dto.data!,
        where: dto.where
            ?.fold('', (value, element) => value = '$value $element = ? '),
        whereArgs: dto.whereArgs);
  }

  Future<int> remove(DBDto dto, {DatabaseExecutor? db}) async {
    return await (await _database<DatabaseExecutor>(db)).delete(dto.tableName!,
        where: dto.where
            ?.fold('', (value, element) => value = '$value $element = ? '),
        whereArgs: dto.whereArgs);
  }

  Future<int> save(DBDto dto, {DatabaseExecutor? db}) async {
    return await (await _database<DatabaseExecutor>(db))
        .insert(dto.tableName!, dto.data!);
  }

  Future<void> close({Database? db}) async {
    await (await _database<Database>(db)).close();
  }

  Future<void> transction(Function queries, {Database? db}) async {
    await (await _database<Database>(db)).transaction((txn) async {
      for (Function func in queries(txn)) {
        await func();
      }
    });
  }
}
