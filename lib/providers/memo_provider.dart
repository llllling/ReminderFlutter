import 'package:flutter/material.dart';
import 'package:remainder_flutter/models/memo.dart';
import 'package:remainder_flutter/services/memo_service.dart';

class MemoProvider with ChangeNotifier {
  final MemoService _service = MemoService();
  List<Memo> _memoList = [];
  List<Memo> get memoList => _memoList;

  findMemoList() {
    _service.findAll();
    notifyListeners();
  }

  void saveMemo(Memo memo) async {
    await _service.save(memo);
    findMemoList();
  }

  void removeMemo(int id) async {
    await _service.remove(id);
    findMemoList();
  }

  void modifyMemo(Memo memo) async {
    await _service.modify(memo);
    findMemoList();
  }

  void close() {
    _service.close();
  }
}
