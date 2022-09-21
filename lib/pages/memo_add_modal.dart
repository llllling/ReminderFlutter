import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/providers/memo_list_provider.dart';
import 'package:remainder_flutter/providers/memo_provider.dart';
import 'package:remainder_flutter/widgets/common/modal_button.dart';
import 'package:remainder_flutter/widgets/memo_add_modal/content_text_field.dart';
import 'package:remainder_flutter/widgets/memo_add_modal/date_and_time_picker.dart';
import 'package:remainder_flutter/widgets/memo_add_modal/repeat_cycle_picker.dart';

class MemoAddModal extends StatelessWidget {
  const MemoAddModal(
      {super.key, required this.type, required this.closeModalFunc});
  final Function closeModalFunc;
  final String type;
  void onSave() {}

  @override
  Widget build(BuildContext context) {
    final MemoProvider memoProvider =
        Provider.of<MemoProvider>(context, listen: false);
    final MemoListProvider memoListProvider =
        Provider.of<MemoListProvider>(context, listen: false);
    return Container(
      color: CupertinoColors.white,
      child: Column(
        children: [
          ContentTextField(provider: memoProvider),
          DateAndTimePicker(provider: memoProvider),
          RepeatPicker(
            provider: memoProvider,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(children: [
            Expanded(
                child: ModalButton(
                    buttonText: '저장',
                    onPressed: () => type == 'add'
                        ? memoListProvider.saveMemo(memoProvider.memo)
                        : memoListProvider.modifyMemo(memoProvider.memo))),
            Expanded(
              child: ModalButton(
                buttonText: '취소',
                onPressed: () => closeModalFunc(),
              ),
            )
          ])
        ],
      ),
    );
  }
}
