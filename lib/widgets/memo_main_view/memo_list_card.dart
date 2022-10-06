import 'package:flutter/material.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/utils/index.dart';
import 'package:memomemo/widgets/memo_main_view/list_tile_subtitle.dart';

class MemoListCard extends StatelessWidget {
  const MemoListCard(this.memo,
      {Key? key, required this.onRemove, required this.onChange})
      : super(key: key);
  final Memo memo;
  final Function onRemove;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onChange(memo.id, isTrue: false),
        onDoubleTap: () => onRemove(memo),
        child: Card(
            child: ListTile(
          tileColor:
              memo.isDateBeforeNow ? Colors.deepOrange[50] : Colors.white,
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
