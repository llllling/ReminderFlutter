import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/models/repeat_cycle.dart';
import 'package:remainder_flutter/providers/repeat_cycle_provider.dart';
import 'package:remainder_flutter/widgets/common/list_view.dart';

class RepeatList extends StatelessWidget {
  const RepeatList({Key? key, this.selected, required this.repeatChange})
      : super(key: key);
  final RepeatCycle? selected;
  final Function repeatChange;

  @override
  Widget build(BuildContext context) {
    return Consumer<RepeatCycleProvider>(
        builder: (context, state, child) => ListForm(
            list: state.repeatCycleList,
            children: (RepeatCycle data) => OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor:
                      data.code == selected?.code ? Colors.lime : Colors.white,
                  foregroundColor:
                      data.code == selected?.code ? Colors.white : Colors.lime,
                ),
                onPressed: () {
                  repeatChange(data);
                  Navigator.pop(context);
                },
                child: Text(
                  data.name.toString(),
                  style: const TextStyle(color: Colors.black),
                ))));
  }
}
