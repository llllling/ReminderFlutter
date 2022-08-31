import 'package:flutter/cupertino.dart';
import 'package:remainder_flutter/models/memo.dart';
import 'package:remainder_flutter/models/repeat_cycle.dart';

class MemoProvider extends ChangeNotifier {
  final List<Memo> _memoList = [
    Memo.fromJson({
      'content': '내용1',
      'noticeDate': '22/7/30 1:00',
      'reapeat': RepeatCycle('none', '안함')
    }),
  ];

  List<Memo> get memoList => _memoList;

  void pushMemo() {
    notifyListeners();
  }

  void removeMemo() {
    notifyListeners();
  }

  void updateMemo() {
    notifyListeners();
  }
}
