import 'package:remainder_flutter/models/memo.dart';
import 'package:remainder_flutter/repository/db_helpers.dart';

class MemoService {
  late final DBHelper dbHelper;
  final String tableName = 'memo';

  MemoService() {
    dbHelper = DBHelper(init: init);
  }

  String getDBPath() {
    return dbHelper.dbPath;
  }

  Future<void> init(database) async {
    dbHelper.transction(
        (txn) => [
              () => dbHelper.rawQueryExecute(
                  DBDto(
                      queryString:
                          'CREATE TABLE repeat_cycle (code TEXT PRIMARY KEY, name TEXT)'),
                  db: txn),
              () => dbHelper.rawQueryExecute(
                  DBDto(
                      queryString:
                          "INSERT INTO repeat_cycle(code, name) VALUES('none', '안함'), ('day', '매일'), ('week', '매주'), ('month', '매월')"),
                  db: txn),
              () => dbHelper.rawQueryExecute(
                  DBDto(
                      queryString:
                          'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, noticeDate TEXT, repeat TEXT DEFAULT "none" NOT NULL,  FOREIGN KEY(repeat) REFERENCES repeat_cycle(code) )'),
                  db: txn)
            ],
        db: database);
  }

  Future<List<Map<String, Object?>>> findAll() async {
    return dbHelper.rawQueryForSelect(DBDto(
        queryString:
            ' SELECT mm.content, mm.id , mm.noticeDate, rc.code, rc.name FROM memo mm INNER JOIN repeat_cycle rc ON mm.repeat = rc.code AND mm.is_remove = 0'));
  }

  Future<int> save(Memo memo) async {
    return dbHelper.save(DBDto(tableName: tableName, data: memo.toSaveJson()));
  }

  Future<void> remove(int id) async {
    return dbHelper.rawQueryExecute(
      DBDto(queryString: 'UPDATE memo SET is_remove = 1 WHERE id = $id'),
    );
  }

  Future<int> modify(Memo memo) async {
    return dbHelper.modify(DBDto(
        tableName: tableName,
        data: memo.toJson(),
        where: ['id'],
        whereArgs: [memo.id!]));
  }

  void close() {
    dbHelper.close();
  }
}
