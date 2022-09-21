import 'package:flutter/cupertino.dart';
import 'package:remainder_flutter/widgets/common/modal_button.dart';
import 'package:remainder_flutter/widgets/memo_add_modal/content_text_field.dart';
import 'package:remainder_flutter/widgets/memo_add_modal/date_and_time_picker.dart';
import 'package:remainder_flutter/widgets/memo_add_modal/repeat_cycle_picker.dart';

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
          const RepeatPicker(),
          const SizedBox(
            height: 30,
          ),
          Row(children: [
            Expanded(
                child: ModalButton(buttonText: '저장', onPressed: () => onSave)),
            Expanded(
              child: ModalButton(
                buttonText: '취소',
                onPressed: () => onCancle,
              ),
            )
          ])
        ],
      ),
    );
  }
}
