import 'package:flutter/material.dart';
import 'package:remainder_flutter/widgets/memoMainView/MemoList.dart';

class MemoMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('mi�� �˸�')),
      body: MemoList(),
    );
  }
}
