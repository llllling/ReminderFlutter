import './repeat_cycle.dart';

class Memo {
  String _content;
  String _noticeDate;
  RepeatCycle? _repeat;

  Memo(this._content, this._noticeDate, this._repeat);

  factory Memo.fromJson(Map<String, dynamic> json) =>
      Memo(json['content'], json['noticeDate'], json['reapeat']);

  Map<String, dynamic> toJson() => {
        'content': _content,
        'noticeDate': _noticeDate,
        'noticeTime': _repeat,
      };
}
