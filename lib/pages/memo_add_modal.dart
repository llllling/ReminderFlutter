import 'package:flutter/cupertino.dart';
import 'package:remainder_flutter/widgets/common/modal_button.dart';
import 'package:remainder_flutter/widgets/memo_add_modal/content_text_field.dart';
import 'package:remainder_flutter/widgets/memo_add_modal/date_and_time_picker.dart';

class MemoAddModal extends StatelessWidget {
  const MemoAddModal({super.key, required this.closeModalFunc});
  final Function closeModalFunc;
  void onSave() {}

  void onCancle() {
    closeModalFunc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      child: Column(
        children: [
          const ContentTextField(),
          const DateAndTimePicker(),
          Row(children: [
            ModalButton(buttonText: '저장', onPressed: onSave),
            ModalButton(
                buttonText: '취소',
                onPressed: onCancle,
                disabledColor: CupertinoColors.quaternaryLabel),
          ])
        ],
      ),
    );
  }
}
