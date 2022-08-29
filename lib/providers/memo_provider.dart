import 'package:flutter/cupertino.dart';
import 'package:remainder_flutter/models/memo.dart';

class MemoProvider extends ChangeNotifier {
  final List<Memo> _memoList = [
    Memo('내용1', '22/7/30', '1:00'),
    Memo('내용2', '22/7/30', '2:00'),
    Memo('내용3', '22/7/30', '4:00'),
    Memo('내용4', '22/7/30', '5:00'),
    Memo('내용5', '22/7/30', '18:00')
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
