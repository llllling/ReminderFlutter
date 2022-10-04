import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/models/notify.dart';
import 'package:memomemo/services/memo_service.dart';

class MemoListProvider with ChangeNotifier {
  final MemoService _service = MemoService();
  final Notify notify = Notify();
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

  Future<void> findMemoTrashList() async {
    List findResult = await _service.findAll(isRemove: '1');
    _memoList = findResult.map((data) => Memo.fromJson(data)).toList();
    notifyListeners();
  }

  Future<void> _notifyRemove(int? id) async {
    if (id == null) return;
    await notify.remove(id);
  }

  Future<void> _notifyCreateNdbSaveModify(Memo memo, Function dbExec) async {
    if (memo.noticeDate!.isNotEmpty) {
      memo.notifyId = Random().nextInt(10000);
      await dbExec(memo);
      await notify.create(memo);
    } else {
      memo.notifyId = null;
      await dbExec(memo);
    }
  }

  void saveMemo(Memo memo) async {
    await _notifyCreateNdbSaveModify(memo, _service.save);
    findMemoList();
  }

  void removeMemo(Memo memo) async {
    await _service.remove(memo.id!);
    await _notifyRemove(memo.notifyId);
    findMemoList();
  }

  //스레기통 비우기까지 해야함

  void modifyMemo(Memo memo) async {
    await _notifyRemove(memo.notifyId);
    await _notifyCreateNdbSaveModify(memo, _service.modify);
    findMemoList();
  }

  void close() {
    _service.close();
  }
}
