import 'package:flutter/cupertino.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/models/repeat_cycle.dart';

class MemoProvider with ChangeNotifier {
  Memo memo;
  bool isDataAndTimeEnable = false;
  MemoProvider(this.memo) {
    isDataAndTimeEnable = memo.noticeDate!.isNotEmpty;
  }

  void _modifyMemoProperty(String modifyObj, dynamic modifyValue) {
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

  void setIsDataAndTimeEnable() {
    isDataAndTimeEnable = !isDataAndTimeEnable;
    notifyListeners();
  }
}
