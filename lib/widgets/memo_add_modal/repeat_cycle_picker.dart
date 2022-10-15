import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:memomemo/providers/memo_provider.dart';
import 'package:memomemo/providers/repeat_cycle_provider.dart';
import 'package:memomemo/widgets/common/add_modal_menu.dart';
import 'package:memomemo/widgets/memo_add_modal/repeat_cycle_list.dart';

class RepeatPicker extends StatelessWidget {
  const RepeatPicker({super.key, required this.provider});
  final MemoProvider provider;

  @override
  Widget build(BuildContext context) {
    return provider.isDataAndTimeEnable
        ? AddModalMenu(
            onTabModal: ChangeNotifierProvider<RepeatCycleProvider>(
                create: (_) => RepeatCycleProvider(),
                child: RepeatList(
                  selected: provider.memo.repeat,
                  repeatChange: (value) => {provider.setRepeat(value)},
                )),
            children: [
              const Text('반복 주기'),
              Flexible(
                child: Text(
                  provider.memo.repeat?.name ?? '',
                  style: const TextStyle(color: CupertinoColors.inactiveGray),
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
