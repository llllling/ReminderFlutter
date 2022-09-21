import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/models/memo.dart';
import 'package:remainder_flutter/pages/memo_add_modal.dart';
import 'package:remainder_flutter/providers/memo_list_provider.dart';
import 'package:remainder_flutter/providers/memo_provider.dart';
import 'package:remainder_flutter/providers/repeat_cycle_provider.dart';
import 'package:remainder_flutter/utils/index.dart';
import 'package:remainder_flutter/widgets/memo_main_view/memo_list.dart';

class MemoMainView extends StatelessWidget {
  const MemoMainView({Key? key}) : super(key: key);

  void _showAddMemoModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider<RepeatCycleProvider>(
                create: (_) => RepeatCycleProvider(),
              ),
              ChangeNotifierProxyProvider<RepeatCycleProvider, MemoProvider>(
                create: (context) => MemoProvider(Memo()),
                update: (context, repeatProvider, previous) {
                  final repeat = repeatProvider.repeatCycleList.isNotEmpty
                      ? repeatProvider.repeatCycleList[0]
                      : null;
                  return MemoProvider(Memo(
                      noticeDate: DateTime.now().toString(), repeat: repeat));
                },
              ),
            ],
            builder: (context, child) {
              return MemoAddModal(
                  type: 'add',
                  closeModalFunc: () => _closeAddMemoModal(context));
            });
      },
    );
  }

  _closeAddMemoModal(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final MemoListProvider provider =
        Provider.of<MemoListProvider>(context, listen: false);
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
              )),
          IconButton(
              onPressed: () {
                _showAddMemoModal(context);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 24.0,
              ))
        ],
      ),
      body: const MemoList(),
    );
  }
}
