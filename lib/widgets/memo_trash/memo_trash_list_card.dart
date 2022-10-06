import 'package:flutter/material.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/widgets/memo_main_view/list_tile_subtitle.dart';

class MemoTrashListCard extends StatelessWidget {
  const MemoTrashListCard(this.memo,
      {Key? key, required this.onRemove, required this.onRestore})
      : super(key: key);
  final Memo memo;
  final Function onRemove;
  final Function onRestore;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: () => onRemove(memo),
        child: Card(
            child: ListTile(
          title: Text(memo.content!),
          subtitle: ListTileSubTitle(memo),
          trailing: TextButton(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                fixedSize: const Size(25, 25)),
            onPressed: () => onRestore(memo),
            child: const Icon(
              Icons.restore_from_trash,
              size: 25,
            ),
          ),
        ))
        // onTap: () {

        // },
        );
  }
}
