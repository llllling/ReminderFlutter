import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/providers/memo_list_provider.dart';
import 'package:memomemo/widgets/common/list_view.dart';
import 'package:memomemo/widgets/memo_main_view/memo_list_card.dart';

class MemoList extends StatelessWidget {
  const MemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MemoListProvider>(
        builder: (context, value, child) => ListForm(
            list: value.memoList,
            children: (Memo memo) => MemoListCard(memo,
                onDelete: (Memo memo) => value.removeMemo(memo))));
  }
}
