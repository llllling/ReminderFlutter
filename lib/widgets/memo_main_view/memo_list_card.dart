import 'package:flutter/material.dart';
import 'package:remainder_flutter/models/memo.dart';
import 'package:remainder_flutter/utils/index.dart';
import 'package:remainder_flutter/widgets/memo_main_view/list_tile_subtitle.dart';

class MemoListCard extends StatelessWidget {
  const MemoListCard(this.memo, {Key? key}) : super(key: key);
  final Memo memo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
            child: ListTile(
      title: Text(memo.content!),
      subtitle: ListTileSubTitle(memo),
      trailing: ElevatedButton(
        // style: ElevatedButton.styleFrom(fixedSize: Size(3, 3)),
        onPressed: () {
          showAddMemoModal(context, memo, 'modify');
        },
        child: const Icon(
          Icons.edit_note,
        ),
      ),
    ))
        // onTap: () {

        // },
        );
  }
}
