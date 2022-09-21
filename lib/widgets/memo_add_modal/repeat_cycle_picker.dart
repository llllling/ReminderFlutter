import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/providers/memo_provider.dart';
import 'package:remainder_flutter/providers/repeat_cycle_provider.dart';
import 'package:remainder_flutter/widgets/common/add_modal_menu.dart';
import 'package:remainder_flutter/widgets/memo_add_modal/repeat_cycle_list.dart';

class RepeatPicker extends StatelessWidget {
  const RepeatPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final MemoProvider provider = Provider.of<MemoProvider>(context);
    final String repeatName = '안함';

    return AddModalMenu(
      childWhenClick: ChangeNotifierProvider(
        create: (_) => RepeatCycleProvider(),
        child: const RepeatList(
          selected: 'none',
        ),
      ),
      children: [
        const Text('반복 주기'),
        Flexible(
          child: Text(
            repeatName,
            style: const TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ),
      ],
    );
  }
}
