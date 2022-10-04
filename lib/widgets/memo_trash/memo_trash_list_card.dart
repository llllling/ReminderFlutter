import 'package:flutter/material.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/widgets/memo_main_view/list_tile_subtitle.dart';

class MemoTrashListCard extends StatelessWidget {
  const MemoTrashListCard(this.memo, {Key? key, required this.onDelete})
      : super(key: key);
  final Memo memo;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: () => onDelete(memo),
        child: Card(
            child: ListTile(
          title: Text(memo.content!),
          subtitle: ListTileSubTitle(memo),
        ))
        // onTap: () {

        // },
        );
  }
}
