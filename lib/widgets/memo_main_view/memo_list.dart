import 'package:flutter/material.dart';
import 'package:remainder_flutter/widgets/memo_main_view/memo_list_card.dart';
import 'package:remainder_flutter/models/memo.dart';

class MemoList extends StatelessWidget {
  const MemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [].map<Widget>((data) => MemoListCard(data)).toList(),
    );
  }
}
