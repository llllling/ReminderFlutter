import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/models/memo.dart';
import 'package:remainder_flutter/providers/memo_list_provider.dart';
import 'package:remainder_flutter/widgets/common/list_view.dart';
import 'package:remainder_flutter/widgets/memo_main_view/memo_list_card.dart';

class MemoList extends StatelessWidget {
  const MemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MemoListProvider>(
        builder: (context, state, child) => ListForm(
            list: state.memoList,
            children: (Memo memo) =>
                MemoListCard(memo, onDelete: (id) => state.removeMemo(id))));
  }
}
