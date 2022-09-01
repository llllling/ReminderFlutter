import 'package:flutter/material.dart';
import 'package:remainder_flutter/models/memo.dart';
import 'package:remainder_flutter/models/repeat_cycle.dart';
import 'package:remainder_flutter/services/memo_service.dart';

class MemoProvider with ChangeNotifier {
  MemoService service = MemoService();
  final List<Memo> _memoList = [
    Memo.fromJson({
      'content': '내용1',
      'noticeDate': '22/7/30 1:00',
      'reapeat': RepeatCycle('none', '안함')
    }),
  ];
  List<Memo> get memoList => _memoList;

  findMemoList() {
    service.findAll();
    notifyListeners();
  }

  void saveMemo(Memo memo) async {
    await service.save(memo);
    findMemoList();
  }

  void removeMemo(int id) async {
    await service.remove(id);
    findMemoList();
  }

  void modifyMemo(Memo memo) async {
    await service.modify(memo);
    findMemoList();
  }

  void close() {
    service.close();
  }
}
