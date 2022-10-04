import 'package:flutter/material.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/utils/file.dart';
import 'package:memomemo/utils/index.dart';
import 'package:memomemo/widgets/memo_main_view/memo_list.dart';

class MemoMainView extends StatelessWidget {
  const MemoMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메모메모 ५✍(ಠ益ಠ )'),
        actions: [
          IconButton(
              onPressed: () {
                downloadDBFile(showSnack(context));
              },
              icon: const Icon(
                Icons.send_to_mobile,
                color: Colors.white10,
                size: 24.0,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.white,
                size: 24.0,
              )),
          IconButton(
              onPressed: () {
                showAddMemoModal(context, Memo(), 'add');
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 24.0,
              ))
        ],
      ),
      body: const MemoList(),
    );
  }
}
