import 'package:flutter/cupertino.dart';
import 'package:remainder_flutter/models/memo.dart';

class MemoProvider extends ChangeNotifier {
  final List<Memo> _memoList = [
    Memo('����1', '22/7/30', '1:00'),
    Memo('����2', '22/7/30', '2:00'),
    Memo('����3', '22/7/30', '4:00'),
    Memo('����4', '22/7/30', '5:00'),
    Memo('����5', '22/7/30', '18:00')
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
