import 'package:remainder_flutter/repository/db_helpers.dart';

class RepeatCycleService {
  final DBHelper dbHelper = DBHelper();
  final String tableName = 'repeat_cycle';

  Future<List<Map<String, Object?>>> findAll() async {
    return dbHelper.findAll(DBDto(tableName: tableName));
  }

  void close() {
    dbHelper.close();
  }
}
