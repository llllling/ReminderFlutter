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

  getContent() => memo.content;
  getNoticeDate() => memo.noticeDate;
  getRepeat() => memo.repeat;
  getRepeatName() => memo.repeat?.name ?? '';
  getRepeatCode() => memo.repeat?.code;

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
