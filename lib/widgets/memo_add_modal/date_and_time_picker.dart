import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/providers/memo_provider.dart';
import 'package:remainder_flutter/widgets/common/add_modal_menu.dart';

class DateAndTimePicker extends StatelessWidget {
  const DateAndTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final MemoProvider provider = Provider.of<MemoProvider>(context);
    final DateTime dateTime = provider.memo.noticeDate!.isNotEmpty
        ? DateTime.parse(provider.memo.noticeDate!)
        : DateTime.now();
    return AddModalMenu(
      childWhenClick: CupertinoDatePicker(
        backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
        mode: CupertinoDatePickerMode.dateAndTime,
        initialDateTime: dateTime,
        onDateTimeChanged: (newDateTime) {
          provider.modifyMemoProperty('noticeDate', newDateTime.toString());
        },
      ),
      children: [
        const Text('날짜 및 시간'),
        Flexible(
          child: Text(
            DateFormat('yyyy-MM-dd kk:mm').format(dateTime),
            style: const TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ),
      ],
    );
  }
}
