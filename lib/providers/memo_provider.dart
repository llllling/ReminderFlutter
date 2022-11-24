import 'package:flutter/cupertino.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/models/repeat_cycle.dart';

class MemoProvider with ChangeNotifier {
  Memo memo;
  bool isDataAndTimeEnable = false;
  FocusNode contetnFous = FocusNode();
  MemoProvider(this.memo) {
    isDataAndTimeEnable = memo.noticeDate!.isNotEmpty;
  }
  @override
  void dispose() {
    contetnFous.dispose();
    super.dispose();
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

  void setRepeat([RepeatCycle? newValue]) {
    _modifyMemoProperty('repeat', newValue);
  }

  void setIsDataAndTimeEnable() {
    isDataAndTimeEnable = !isDataAndTimeEnable;
    if (!isDataAndTimeEnable) {
      setNoticeDate('');
      setRepeat();
      return;
    }
    notifyListeners();
  }

  bool validationCheck(BuildContext context) {
    if (memo.noticeDate != "" &&
        DateTime.parse(memo.noticeDate!).isBefore(DateTime.now())) {
      memo.noticeDate = '';
    }
    if (memo.content!.isNotEmpty) {
      return true;
    }
    FocusScope.of(context).requestFocus(contetnFous);
    return false;
  }
}
