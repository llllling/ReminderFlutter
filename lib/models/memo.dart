import 'package:remainder_flutter/models/repeat_cycle.dart';

class Memo {
  int? id;
  String? content;
  String? noticeDate;
  RepeatCycle? repeat;

  Memo({this.id, this.content = '', this.noticeDate = '', this.repeat});

  factory Memo.fromJson(Map<String, Object?> json) => Memo(
      id: int.parse(json['id'].toString()),
      content: json['content'].toString(),
      noticeDate: json['noticeDate'].toString(),
      repeat: RepeatCycle.fromJson(json));

  Map<String, Object> toJson() => {
        'id': id!,
        'content': content!,
        'noticeDate': noticeDate!,
        'noticeTime': repeat!.name,
      };

  setProperty(String propertyName, dynamic value) {
    switch (propertyName) {
      case 'content':
        content = value;
        return;
      case 'noticeDate':
        noticeDate = value;
        return;
      case 'repeat':
        repeat = value;
        return;
    }
  }
}
