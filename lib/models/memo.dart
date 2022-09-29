import 'package:memomemo/models/repeat_cycle.dart';

class Memo {
  int? id;
  String? content = '';
  String? noticeDate = '';
  RepeatCycle? repeat;
  int? notifyId;
  Memo();

  factory Memo.fromJson(Map<String, Object?> json) {
    Memo m = Memo();
    m.id = int.parse(json['id'].toString());
    m.content = json['content'] != null ? json['content'].toString() : '';
    m.noticeDate =
        json['noticeDate'] != null ? json['noticeDate'].toString() : '';
    m.repeat = RepeatCycle.fromJson(json);
    if (json['notifyId'] != null) {
      m.notifyId = int.parse(json['notifyId'].toString());
    }
    return m;
  }

  Map<String, Object?> toJson() {
    Map<String, Object?> json = {
      'content': content!,
      'noticeDate': noticeDate!,
      'notifyId': notifyId
    };
    if (id != null) json['id'] = id!;
    if (repeat != null) json['repeat'] = repeat!.code.toString();

    return json;
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
