import 'package:flutter/material.dart';
import 'package:remainder_flutter/widgets/memo_main_view/content_text_field.dart';

class MemoAddModal extends StatelessWidget {
  const MemoAddModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: const [
          ContentTextField(),
        ],
      ),
    );
  }
}
