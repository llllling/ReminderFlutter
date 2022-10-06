import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/models/notify.dart';
import 'package:memomemo/services/memo_service.dart';

class MemoListProvider with ChangeNotifier {
  final MemoService _service = MemoService();
  late final Notify notify;
  List<Memo> memoList = [];

  MemoListProvider() {
    findMemoList();
    notify = Notify(_setTrueIsDateBeforeNow);
  }

  void findMemoList() async {
    List findResult = await _service.findAll();
    memoList = findResult.map((data) => Memo.fromJson(data)).toList();
    notifyListeners();
  }

  Future<void> findMemoTrashList() async {
    List findResult = await _service.findAll(isRemove: '1');
    memoList = findResult.map((data) => Memo.fromJson(data)).toList();
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
    await _service.updateIsRemoveTrue(memo.id!);
    await _notifyRemove(memo.notifyId);
    findMemoList();
  }

  void restoreMemo(Memo memo) async {
    await _service.restore(memo.id!);
    findMemoTrashList();
  }

  void removeTrash(Memo memo) async {
    await _service.remove(memo.id!);
    findMemoTrashList();
  }

  void removeAllTrash() async {
    await _service.removeAll();
    findMemoTrashList();
  }

  void modifyMemo(Memo memo) async {
    await _notifyRemove(memo.notifyId);
    await _notifyCreateNdbSaveModify(memo, _service.modify);
    findMemoList();
  }

  void _setTrueIsDateBeforeNow(String notifyId) {
    memoList.any((memo) {
      if (memo.notifyId.toString() == notifyId) {
        memo.isDateBeforeNow = true;
      }
      return memo.notifyId.toString() == notifyId;
    });
    notifyListeners();
  }

  void close() {
    _service.close();
  }
}
