import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/providers/memo_list_provider.dart';
import 'package:remainder_flutter/utils/index.dart';
import 'package:remainder_flutter/widgets/memo_main_view/memo_add_modal.dart';
import 'package:remainder_flutter/widgets/memo_main_view/memo_list.dart';

class MemoMainView extends StatelessWidget {
  const MemoMainView({Key? key}) : super(key: key);

  void _showAddMemoModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return const MemoAddModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final MemoListProvider provider = Provider.of<MemoListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('메모메모'),
        actions: [
          IconButton(
              onPressed: () {
                provider.downloadDBFile(showSnack(context));
              },
              icon: const Icon(
                Icons.send_to_mobile,
                color: Colors.white10,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              )),
          IconButton(
              onPressed: () {
                _showAddMemoModal(context);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ))
        ],
      ),
      body: const MemoList(),
    );
  }
}
