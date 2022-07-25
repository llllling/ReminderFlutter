import 'package:flutter/material.dart';

class MemoListCard extends StatelessWidget {
  final Map<String, String> data;
  const MemoListCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(data['content'] as String),
          subtitle: Text(
              '${data['noticeDate'] as String} ${data['noticeTime'] as String}')),
    );
  }
}
