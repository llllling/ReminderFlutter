import 'package:flutter/material.dart';
import 'package:memomemo/models/memo.dart';
import 'package:provider/provider.dart';
import 'package:memomemo/providers/memo_list_provider.dart';
import 'package:memomemo/widgets/common/list_view.dart';

class MemoList extends StatelessWidget {
  const MemoList({Key? key, required this.children}) : super(key: key);
  final Function children;
  @override
  Widget build(BuildContext context) {
    return Consumer<MemoListProvider>(
        builder: (context, value, child) => ListForm(
            list: value.memoList,
            children: (Memo memo) => children(memo, value)));
  }
}
