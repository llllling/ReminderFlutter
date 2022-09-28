import 'package:flutter/material.dart';
import 'package:memomemo/providers/memo_provider.dart';

class ContentTextField extends StatelessWidget {
  const ContentTextField({super.key, required this.provider});
  final MemoProvider provider;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: provider.memo.content,
      onChanged: (value) {
        provider.setContent(value);
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: '내용 입력',
      ),
    );
  }
}
