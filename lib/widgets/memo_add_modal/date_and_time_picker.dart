import 'package:flutter/cupertino.dart';
import 'package:remainder_flutter/providers/memo_provider.dart';
import 'package:remainder_flutter/utils/index.dart';
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
        initialDateTime: stringToDate(noticeDate),
        onDateTimeChanged: (newDateTime) {
          provider.setNoticeDate(newDateTime.toString());
        },
      ),
      children: [
        const Text('날짜 및 시간'),
        Flexible(
          child: Text(
            noticeDate.isNotEmpty
                ? formatDate(stringToDate(noticeDate))
                : noticeDate,
            style: const TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ),
      ],
    );
  }
}
