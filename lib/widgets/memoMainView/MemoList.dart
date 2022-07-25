import 'package:flutter/material.dart';
import 'package:remainder_flutter/widgets/memoMainView/MemoListCard.dart';

class MemoList extends StatelessWidget {
  const MemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List listData = [
      {'content': '내용1', 'noticeDate': '22/7/30', 'noticeTime': '1:00'},
      {'content': '내용2', 'noticeDate': '22/7/30', 'noticeTime': '2:00'},
      {'content': '내용4', 'noticeDate': '22/7/30', 'noticeTime': '4:00'},
      {'content': '내용5', 'noticeDate': '22/7/30', 'noticeTime': '5:00'},
      {'content': '내용6', 'noticeDate': '22/7/30', 'noticeTime': '18:00'},
    ];
    return ListView(
      children: listData.map<Widget>((data) => MemoListCard(data)).toList(),
    );
  }
}
