import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:memomemo/pages/memo_add_modal.dart';
import 'package:memomemo/providers/memo_provider.dart';

Function showSnack(BuildContext context) => (String message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    };

String formatDate(DateTime date) {
  return DateFormat('yyyy-MM-dd (E) kk:mm', 'ko').format(date);
}

DateTime stringToDate([String date = '']) {
  return date.isNotEmpty ? DateTime.parse(date) : DateTime.now();
}

void showAddMemoModal(BuildContext context, dynamic obj, String type) {
  showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return ChangeNotifierProvider<MemoProvider>(
            create: (_) => MemoProvider(obj),
            child: MemoAddModal(
                type: type, closeModalFunc: () => _closeAddMemoModal(context)));
      });
}

void _closeAddMemoModal(BuildContext context) {
  Navigator.pop(context);
}
