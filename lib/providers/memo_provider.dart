import 'package:flutter/cupertino.dart';
import 'package:remainder_flutter/models/memo.dart';

class MemoProvider with ChangeNotifier {
  late Memo _memo = Memo();
  Memo get memo => _memo;

  set setMemo(Memo memo) {
    _memo = memo;
  }

  modifyMemoProperty(String modifyObj, String modifyValue) {
    _memo.setMemo(modifyObj, modifyValue);
  }
}
