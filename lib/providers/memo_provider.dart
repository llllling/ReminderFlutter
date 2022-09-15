import 'package:flutter/cupertino.dart';
import 'package:remainder_flutter/models/memo.dart';

class MemoProvider with ChangeNotifier {
  late Memo _memo;
  Memo get memo => _memo;
}
