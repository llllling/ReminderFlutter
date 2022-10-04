import 'package:flutter/cupertino.dart';
import 'package:memomemo/providers/memo_provider.dart';
import 'package:memomemo/widgets/common/add_modal_menu.dart';

class DateAndTimeUseButton extends StatelessWidget {
  const DateAndTimeUseButton({super.key, required this.provider});
  final MemoProvider provider;

  @override
  Widget build(BuildContext context) {
    return AddModalMenu(
      onTab: () {
        FocusScope.of(context).unfocus();
        provider.setIsDataAndTimeEnable();
      },
      children: [
        const Text('날짜 사용 여부'),
        Flexible(
          child: Text(
            provider.isDataAndTimeEnable ? '사용' : '안함',
            style: const TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ),
      ],
    );
  }
}
