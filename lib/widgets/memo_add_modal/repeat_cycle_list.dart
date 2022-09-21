import 'package:flutter/material.dart';
import 'package:remainder_flutter/models/repeat_cycle.dart';
import 'package:remainder_flutter/widgets/common/list_view.dart';

class RepeatList extends StatelessWidget {
  const RepeatList(
      {Key? key,
      required this.repeatCycleList,
      this.selected,
      required this.repeatChange})
      : super(key: key);
  final List<RepeatCycle> repeatCycleList;
  final RepeatCycle? selected;
  final Function repeatChange;

  @override
  Widget build(BuildContext context) {
    return ListForm(
        list: repeatCycleList,
        children: (RepeatCycle data) => OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor:
                  data.code == selected?.code ? Colors.blueGrey : Colors.white,
              foregroundColor:
                  data.code == selected?.code ? Colors.white : Colors.blueGrey,
            ),
            onPressed: () {
              repeatChange(data);
              Navigator.pop(context);
            },
            child: Text(data.name)));
  }
}
