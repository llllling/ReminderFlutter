import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/providers/memo_provider.dart';
import 'package:remainder_flutter/widgets/memo_main_view/memo_list_card.dart';

class MemoList extends StatelessWidget {
  const MemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MemoProvider>(
        builder: (context, state, child) => ListView(
              children: state.memoList
                  .map<Widget>((data) => MemoListCard(data))
                  .toList(),
            ));
  }
}
