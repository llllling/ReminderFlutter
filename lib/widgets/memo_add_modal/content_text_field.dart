import 'package:flutter/material.dart';
import 'package:remainder_flutter/providers/memo_provider.dart';

class ContentTextField extends StatelessWidget {
  const ContentTextField({super.key, required this.provider});
  final MemoProvider provider;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
