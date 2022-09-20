import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/models/repeat_cycle.dart';
import 'package:remainder_flutter/providers/repeat_cycle_provider.dart';
import 'package:remainder_flutter/widgets/common/list_view.dart';

class RepeatList extends StatelessWidget {
  const RepeatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RepeatCycleProvider>(
        builder: (context, state, child) => ListForm(
            list: state.repeatCycleList,
            children: (RepeatCycle data) => Text(data.name)));
  }
}
