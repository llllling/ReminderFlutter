import 'package:flutter/material.dart';
import 'package:remainder_flutter/models/memo.dart';
import 'package:remainder_flutter/utils/index.dart';

class MemoListCard extends StatelessWidget {
  final Memo data;
  const MemoListCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String subTitle = '${data.repeat!.name!} ';
    if (data.noticeDate!.isNotEmpty) {
      subTitle += formatDate(stringToDate(data.noticeDate!));
    }

    return GestureDetector(
        child: Card(
            child: ListTile(
      title: Text(data.content!),
      subtitle: Text(subTitle),
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
