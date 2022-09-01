import 'package:remainder_flutter/repository/db_helpers.dart';

class RepeatCycleService {
  late final DBHelper dbHelper;
  final String tableName = 'repeat_cycle';

  RepeatCycleService() {
    dbHelper = DBHelper();
  }

  Future<List<Map<String, Object?>>> findAll() async {
    return dbHelper.findAll(DBDto(tableName: tableName));
  }

  void close() {
    dbHelper.close();
  }
}
