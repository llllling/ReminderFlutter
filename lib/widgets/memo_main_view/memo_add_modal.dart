import 'package:flutter/material.dart';
import 'package:remainder_flutter/widgets/memo_main_view/content_text_field.dart';

class MemoAddModal extends StatelessWidget {
  const MemoAddModal({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).viewInsets.bottom + 300;
    print(height);
    return SizedBox(
      height: height,
      child: Column(
        children: const [ContentTextField()],
      ),
    );
  }
}
