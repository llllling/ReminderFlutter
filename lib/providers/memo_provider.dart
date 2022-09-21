import 'package:flutter/cupertino.dart';
import 'package:remainder_flutter/models/memo.dart';

class MemoProvider with ChangeNotifier {
  Memo memo = Memo();

  modifyMemoProperty(String modifyObj, String modifyValue) {
    memo = Memo();
    memo.setMemo(modifyObj, modifyValue);
    notifyListeners();
  }
}
