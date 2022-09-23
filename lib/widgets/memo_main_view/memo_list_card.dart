import 'package:flutter/material.dart';
import 'package:remainder_flutter/models/memo.dart';

class MemoListCard extends StatelessWidget {
  final Memo data;
  const MemoListCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
            child: ListTile(
      title: Text(data.content!),
      subtitle: Text('${data.noticeDate} ${data.repeat!.name}'),
      trailing: ElevatedButton(
        onPressed: () {},
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
