import 'package:flutter/cupertino.dart';
import 'package:memomemo/providers/memo_provider.dart';
import 'package:memomemo/utils/index.dart';
import 'package:memomemo/widgets/common/add_modal_menu.dart';

class DateAndTimePicker extends StatelessWidget {
  const DateAndTimePicker({super.key, required this.provider});
  final MemoProvider provider;

  @override
  Widget build(BuildContext context) {
    String noticeDate = provider.memo.noticeDate ?? '';

    return provider.isDataAndTimeEnable
        ? AddModalMenu(
            onTabModal: CupertinoDatePicker(
              minimumDate: stringToDate(noticeDate),
              backgroundColor:
                  CupertinoColors.systemBackground.resolveFrom(context),
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
          )
        : const SizedBox.shrink();
  }
}
