import 'package:flutter/cupertino.dart';
import 'package:remainder_flutter/models/memo.dart';
import 'package:remainder_flutter/models/repeat_cycle.dart';

class MemoProvider with ChangeNotifier {
  Memo memo;
  MemoProvider(this.memo);

  _modifyMemoProperty(String modifyObj, dynamic modifyValue) {
    memo.setProperty(modifyObj, modifyValue);
    notifyListeners();
  }

  void setContent(String newValue) {
    _modifyMemoProperty('content', newValue);
  }

  void setNoticeDate(String newValue) {
    _modifyMemoProperty('noticeDate', newValue);
  }

  void setRepeat(RepeatCycle newValue) {
    _modifyMemoProperty('repeat', newValue);
  }
}
