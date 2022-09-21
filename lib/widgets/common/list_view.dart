import 'package:flutter/material.dart';

class ListForm extends StatelessWidget {
  const ListForm({Key? key, required this.list, required this.children})
      : super(key: key);
  final List list;
  final Function children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: list.map<Widget>((data) => children(data)).toList(),
    );
  }
}
