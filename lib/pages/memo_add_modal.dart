import 'package:flutter/cupertino.dart';
import 'package:memomemo/widgets/memo_add_modal/data_and_time_use_button.dart';
import 'package:provider/provider.dart';
import 'package:memomemo/providers/memo_list_provider.dart';
import 'package:memomemo/providers/memo_provider.dart';
import 'package:memomemo/widgets/common/modal_button.dart';
import 'package:memomemo/widgets/memo_add_modal/content_text_field.dart';
import 'package:memomemo/widgets/memo_add_modal/date_and_time_picker.dart';
import 'package:memomemo/widgets/memo_add_modal/repeat_cycle_picker.dart';

class MemoAddModal extends StatelessWidget {
  const MemoAddModal(
      {super.key, required this.type, required this.closeModalFunc});
  final Function closeModalFunc;
  final String type;

  void onSave(BuildContext context, MemoProvider memoProvider,
      MemoListProvider memoListProvider) {
    if (!memoProvider.validationCheck(context)) {
      return;
    }

    type == 'add'
        ? memoListProvider.saveMemo(memoProvider.memo)
        : memoListProvider.modifyMemo(memoProvider.memo);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final MemoProvider memoProvider = Provider.of<MemoProvider>(context);
    final MemoListProvider memoListProvider =
        Provider.of<MemoListProvider>(context, listen: false);
    return Container(
      color: CupertinoColors.white,
      child: Column(
        children: [
          ContentTextField(provider: memoProvider, isFocus: type == 'add'),
          DateAndTimeUseButton(provider: memoProvider),
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
                    onPressed: () =>
                        onSave(context, memoProvider, memoListProvider))),
            Expanded(
              child: ModalButton(
                buttonText: '취소',
                onPressed: () => closeModalFunc(),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
