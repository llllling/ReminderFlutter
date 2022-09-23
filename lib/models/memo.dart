import 'package:remainder_flutter/models/repeat_cycle.dart';

class Memo {
  int? id;
  String? content = '';
  String? noticeDate = '';
  RepeatCycle? repeat;
  Memo();

  factory Memo.fromJson(Map<String, Object?> json) {
    Memo m = Memo();
    m.id = int.parse(json['id'].toString());
    m.content = json['content'] != null ? json['content'].toString() : '';
    m.noticeDate =
        json['noticeDate'] != null ? json['noticeDate'].toString() : '';
    m.repeat = RepeatCycle.fromJson(json);
    return m;
  }

  Map<String, Object> toJson() => {
        'id': id!,
        'content': content!,
        'noticeDate': noticeDate!,
        'repeat': repeat!.code.toString(),
      };

  Map<String, Object> toSaveJson() {
    Map<String, Object> save = {
      'content': content!,
      'noticeDate': noticeDate!,
    };
    if (repeat != null) save['repeat'] = repeat!.code.toString();
    return save;
  }

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
