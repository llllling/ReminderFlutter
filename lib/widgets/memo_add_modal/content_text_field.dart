import 'package:flutter/material.dart';
import 'package:memomemo/providers/memo_provider.dart';

class ContentTextField extends StatelessWidget {
  const ContentTextField(
      {super.key, required this.provider, required this.isFocus});
  final MemoProvider provider;
  final bool isFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: isFocus,
      focusNode: provider.contetnFous,
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
