import 'package:flutter/material.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/providers/memo_list_provider.dart';
import 'package:memomemo/widgets/memo_main_view/memo_list.dart';
import 'package:memomemo/widgets/memo_trash/memo_trash_list_card.dart';

class MemoTrash extends StatelessWidget {
  const MemoTrash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메모메모 쓰렉쓰렉'),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.white,
                size: 24.0,
              )),
        ],
      ),
      body: MemoList(
        children: (Memo memo, MemoListProvider value) => MemoTrashListCard(memo,
            onDelete: (Memo memo) => value.removeMemo(memo)),
      ),
    );
  }
}
