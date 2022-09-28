import 'package:flutter/material.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/utils/index.dart';

class ListTileSubTitle extends StatelessWidget {
  const ListTileSubTitle(
    this.memo, {
    super.key,
  });
  final Memo memo;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      noticeDateWidget(memo.noticeDate!),
      repeatWidget(memo.repeat!.name!),
    ]);
  }
}

Widget noticeDateWidget(String noticeDate) {
  return noticeDate.isNotEmpty
      ? Row(children: [
          Text(formatDate(stringToDate(noticeDate))),
          const SizedBox(
            width: 10,
          )
        ])
      : const SizedBox.shrink();
}

Widget repeatWidget(String repeatName) {
  return Row(children: [
    const Icon(
      Icons.autorenew_sharp,
      size: 12,
    ),
    Text(repeatName)
  ]);
}
