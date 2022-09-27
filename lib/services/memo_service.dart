import 'package:remainder_flutter/models/memo.dart';
import 'package:remainder_flutter/repository/db_helpers.dart';

class MemoService {
  late final DBHelper dbHelper = DBHelper();
  final String tableName = 'memo';

  String getDBPath() {
    return dbHelper.dbPath;
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
