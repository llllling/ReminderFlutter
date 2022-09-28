import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/services/memo_service.dart';
import 'package:memomemo/utils/index.dart';

class MemoListProvider with ChangeNotifier {
  final MemoService _service = MemoService();
  List<Memo> _memoList = [];
  List<Memo> get memoList => _memoList;

  MemoListProvider() {
    findMemoList();
  }

  void findMemoList() async {
    List findResult = await _service.findAll();
    _memoList = findResult.map((data) => Memo.fromJson(data)).toList();
    notifyListeners();
  }

  void saveMemo(Memo memo) async {
    if (memo.noticeDate!.isNotEmpty) {
      memo.notifyId = Random().nextInt(10000);
      await notificationCreate(memo);
    }
    await _service.save(memo);
    findMemoList();
  }

  void removeMemo(Memo memo) async {
    await _service.remove(memo.id!);
    if (memo.notifyId != null) {
      await notificationRemove(memo.notifyId!);
    }
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
