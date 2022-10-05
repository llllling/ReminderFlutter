import 'package:flutter/material.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/providers/memo_list_provider.dart';
import 'package:memomemo/widgets/memo_main_view/memo_list.dart';
import 'package:memomemo/widgets/memo_trash/memo_trash_list_card.dart';

class MemoTrash extends StatelessWidget {
  const MemoTrash({Key? key, required this.provider}) : super(key: key);
  final MemoListProvider provider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            provider.findMemoList();
            Navigator.of(context).pop();
          },
        ),
        title: const Text('쓰렉쓰렉'),
        actions: [
          IconButton(
              onPressed: () {
                provider.removeAllMemo();
              },
              icon: const Icon(
                Icons.cached,
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
