import 'package:flutter/material.dart';
import 'package:remainder_flutter/models/memo.dart';
import 'package:remainder_flutter/models/repeat_cycle.dart';
import 'package:remainder_flutter/services/db_helpers.dart';

class MemoProvider with ChangeNotifier {
  DBHelper dbHelper = DBHelper.fromJson(DBType.sqlite);

  final List<Memo> _memoList = [
    Memo.fromJson({
      'content': '내용1',
      'noticeDate': '22/7/30 1:00',
      'reapeat': RepeatCycle('none', '안함')
    }),
  ];

  List<Memo> get memoList => _memoList;
  MemoProvider() {
    dbHelper.open();
  }

  Future<void> create() async {
    await dbHelper
        .create('CREATE TABLE repeat_cycle (code TEXT PRIMARY KEY, name TEXT)');
    await dbHelper.rawInsert(
        'INSERT INTO repeat_cycle(code, name) VALUES("none", "안함"), ("day", "매일"), ("week", "매주"), ("month", "매월")');
    await dbHelper.create(
        'CREATE TABLE memo (id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, noticeDate TEXT, repeat TEXT,  FOREIGN KEY(repeat) REFERENCES repeat_cycle(code) )');
  }

  findMemoList() {}

  void saveMemo() {
    notifyListeners();
  }

  void removeMemo() {
    notifyListeners();
  }

  void modifyMemo() {
    notifyListeners();
  }
}
