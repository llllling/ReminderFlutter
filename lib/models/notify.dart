import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'memo.dart';

class Notify {
  late final AndroidInitializationSettings _initializationSettingsAndroid;
  late final InitializationSettings _initializationSettings;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final Notify _notify = Notify._internal();
  factory Notify() => _notify;
  Notify._internal() {
    _initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    _initializationSettings =
        InitializationSettings(android: _initializationSettingsAndroid);
    _flutterLocalNotificationsPlugin.initialize(
      _initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse r) {},
    );
    tz.initializeTimeZones();
  }

  DateTimeComponents? _dateTimeRepeat(String? repeatCode) {
    switch (repeatCode) {
      case 'day':
        return DateTimeComponents.time;
      case 'week':
        return DateTimeComponents.dayOfWeekAndTime;
      case 'month':
        return DateTimeComponents.dayOfMonthAndTime;
      default:
        return null;
    }
  }

  Future<void> create(Memo memo) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
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
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: _dateTimeRepeat(memo.repeat?.code));
  }

  Future<void> remove(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}
