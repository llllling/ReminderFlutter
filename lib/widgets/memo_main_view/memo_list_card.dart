import 'package:flutter/material.dart';
import 'package:remainder_flutter/models/memo.dart';
import 'package:remainder_flutter/utils/index.dart';
import 'package:remainder_flutter/widgets/memo_main_view/list_tile_subtitle.dart';

class MemoListCard extends StatelessWidget {
  const MemoListCard(this.memo, {Key? key, required this.onDelete})
      : super(key: key);
  final Memo memo;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: () => onDelete(memo.id),
        child: Card(
            child: ListTile(
          selectedTileColor: Colors.blueGrey,
          title: Text(memo.content!),
          subtitle: ListTileSubTitle(memo),
          trailing: TextButton(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                fixedSize: const Size(25, 25)),
            onPressed: () {
              showAddMemoModal(context, memo, 'modify');
            },
            child: const Icon(
              Icons.edit_note,
              size: 25,
            ),
          ),
        ))
        // onTap: () {

        // },
        );
  }
}
