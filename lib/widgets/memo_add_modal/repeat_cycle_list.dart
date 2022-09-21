import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/models/repeat_cycle.dart';
import 'package:remainder_flutter/providers/repeat_cycle_provider.dart';
import 'package:remainder_flutter/widgets/common/list_view.dart';

class RepeatList extends StatelessWidget {
  const RepeatList({Key? key, required this.selected}) : super(key: key);
  final String selected;
  @override
  Widget build(BuildContext context) {
    return Consumer<RepeatCycleProvider>(
        builder: (context, state, child) => ListForm(
            list: state.repeatCycleList,
            children: (RepeatCycle data) => OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor:
                      data.code == selected ? Colors.blueGrey : Colors.white,
                  foregroundColor:
                      data.code == selected ? Colors.white : Colors.blueGrey,
                ),
                onPressed: () {},
                child: Text(data.name))));
  }
}
