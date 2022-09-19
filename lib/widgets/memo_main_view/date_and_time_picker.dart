// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/providers/memo_provider.dart';

class DateAndTimePicker extends StatelessWidget {
  final DateTime dateTime = DateTime.now();

  DateAndTimePicker({super.key});

  void _showDemoPicker({
    required BuildContext context,
    required Widget child,
  }) {
    final themeData = CupertinoTheme.of(context);
    final dialogBody = CupertinoTheme(
      data: themeData,
      child: child,
    );

    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => dialogBody,
    );
  }

  @override
  Widget build(BuildContext context) {
    final MemoProvider provider = Provider.of<MemoProvider>(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _showDemoPicker(
            context: context,
            child: _BottomPicker(
              child: CupertinoDatePicker(
                backgroundColor:
                    CupertinoColors.systemBackground.resolveFrom(context),
                mode: CupertinoDatePickerMode.dateAndTime,
                initialDateTime: dateTime,
                onDateTimeChanged: (newDateTime) {
                  provider.modifyMemoProperty(
                      'noticeDate', newDateTime.toString());
                },
              ),
            ),
          );
        },
        child: _Menu(
          children: [
            const Text('날짜 및 시간'),
            Flexible(
              child: Text(
                DateFormat.yMMMd().add_jm().format(dateTime),
                style: const TextStyle(color: CupertinoColors.inactiveGray),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomPicker extends StatelessWidget {
  const _BottomPicker({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22,
        ),
        child: GestureDetector(
          onTap: () {},
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
          bottom: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
        ),
      ),
      height: 44,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
