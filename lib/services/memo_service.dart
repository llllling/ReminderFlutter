import 'package:memomemo/models/memo.dart';
import 'package:memomemo/repository/db_helpers.dart';

class MemoService {
  final DBHelper dbHelper = DBHelper();
  final String tableName = 'memo';

  String getDBPath() {
    return dbHelper.dbPath;
  }

  Future<List<Map<String, Object?>>> findAll({String isRemove = '0'}) async {
    return dbHelper.rawQueryForSelect(DBDto(
        queryString:
            ' SELECT mm.content, mm.id , mm.noticeDate, mm.notifyId, rc.code, rc.name FROM memo mm INNER JOIN repeat_cycle rc ON mm.repeat = rc.code AND mm.isRemove = $isRemove ORDER BY mm.id DESC'));
  }

  Future<int> save(Memo memo) async {
    return dbHelper.save(DBDto(tableName: tableName, data: memo.toJson()));
  }

  Future<void> remove(int id) async {
    return dbHelper.rawQueryExecute(
      DBDto(
          queryString:
              'UPDATE memo SET isRemove = 1, notifyId = null WHERE id = $id'),
    );
  }

  Future<void> removeIsRemoveTrue() async {
    return dbHelper.rawQueryExecute(
      DBDto(queryString: 'DELETE FROM memo WHERE isRemove = "1"'),
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
