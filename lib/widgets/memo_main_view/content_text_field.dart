import 'package:flutter/material.dart';

class ContentTextField extends StatelessWidget {
  const ContentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: '내용 입력',
      ),
    );
  }
}
