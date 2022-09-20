import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/providers/memo_provider.dart';

class ContentTextField extends StatelessWidget {
  const ContentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final MemoProvider provider = Provider.of<MemoProvider>(context);
    return TextField(
      onChanged: (value) {
        provider.modifyMemoProperty('content', value);
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: '내용 입력',
      ),
    );
  }
}
