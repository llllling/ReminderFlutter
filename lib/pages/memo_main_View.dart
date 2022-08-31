import 'package:flutter/material.dart';
import 'package:remainder_flutter/widgets/memo_main_view/memo_list.dart';

class MemoMainView extends StatelessWidget {
  const MemoMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('메모메모')),
      body: const MemoList(),
    );
  }
}