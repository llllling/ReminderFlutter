import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:memomemo/models/memo.dart';
import 'package:memomemo/pages/memo_add_modal.dart';
import 'package:memomemo/providers/memo_provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

showSnack(BuildContext context) => (String message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    };

String formatDate(DateTime date) {
  return DateFormat('yyyy-MM-dd kk:mm').format(date);
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

_closeAddMemoModal(BuildContext context) {
  Navigator.pop(context);
}

Future<void> notificationCreate(Memo memo) async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  InitializationSettings initializationSettings =
      const InitializationSettings(android: initializationSettingsAndroid);
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.initialize(initializationSettings);
  tz.initializeTimeZones();

  await flutterLocalNotificationsPlugin.zonedSchedule(
      memo.notifyId!,
      '메모메모 알림왔숑 (๑•᎑<๑)ｰ☆',
      memo.content,
      tz.TZDateTime.from(DateTime.parse(memo.noticeDate!), tz.local),
      const NotificationDetails(
          android: AndroidNotificationDetails(
              'your channel id', 'your channel name',
              channelDescription: 'your channel description')),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime);
}

notificationRemove(int id) async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.cancel(id);
}
