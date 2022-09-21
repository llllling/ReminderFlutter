import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/providers/memo_provider.dart';
import 'package:remainder_flutter/providers/repeat_cycle_provider.dart';
import 'package:remainder_flutter/widgets/common/add_modal_menu.dart';
import 'package:remainder_flutter/widgets/memo_add_modal/repeat_cycle_list.dart';

class RepeatPicker extends StatelessWidget {
  const RepeatPicker({super.key, required this.provider});
  final MemoProvider provider;

  @override
  Widget build(BuildContext context) {
    return Consumer<RepeatCycleProvider>(
        builder: (context, state, child) => AddModalMenu(
              childWhenClick: RepeatList(
                repeatChange: (value) => {provider.setRepeat(value)},
                repeatCycleList: state.repeatCycleList,
                selected: provider.getRepeat(),
              ),
              children: [
                const Text('반복 주기'),
                Flexible(
                  child: Text(
                    provider.getRepeatName(),
                    style: const TextStyle(color: CupertinoColors.inactiveGray),
                  ),
                ),
              ],
            ));
  }
}
