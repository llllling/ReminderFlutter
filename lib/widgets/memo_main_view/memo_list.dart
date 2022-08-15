import 'package:flutter/material.dart';
import 'package:remainder_flutter/widgets/memo_main_view/memo_list_card.dart';
import 'package:remainder_flutter/models/memo.dart';

class MemoList extends StatelessWidget {
  const MemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Memo> listData = [
      Memo('내용1', '22/7/30', '1:00'),
      Memo('내용2', '22/7/30', '2:00'),
      Memo('내용3', '22/7/30', '4:00'),
      Memo('내용4', '22/7/30', '5:00'),
      Memo('내용5', '22/7/30', '18:00')
    ];
    return ListView(
      children: listData.map<Widget>((data) => MemoListCard(data)).toList(),
    );
  }
}
