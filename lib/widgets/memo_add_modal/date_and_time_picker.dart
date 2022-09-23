import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:remainder_flutter/providers/memo_provider.dart';
import 'package:remainder_flutter/widgets/common/add_modal_menu.dart';

class DateAndTimePicker extends StatelessWidget {
  const DateAndTimePicker({super.key, required this.provider});
  final MemoProvider provider;

  @override
  Widget build(BuildContext context) {
    String noticeDate = provider.memo.noticeDate ?? '';

    return AddModalMenu(
      childWhenClick: CupertinoDatePicker(
        backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
        mode: CupertinoDatePickerMode.dateAndTime,
        initialDateTime:
            noticeDate.isNotEmpty ? DateTime.parse(noticeDate) : DateTime.now(),
        onDateTimeChanged: (newDateTime) {
          provider.setNoticeDate(newDateTime.toString());
        },
      ),
      children: [
        const Text('날짜 및 시간'),
        Flexible(
          child: Text(
            noticeDate.isNotEmpty
                ? DateFormat('yyyy-MM-dd kk:mm')
                    .format(DateTime.parse(noticeDate))
                : noticeDate,
            style: const TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ),
      ],
    );
  }
}
