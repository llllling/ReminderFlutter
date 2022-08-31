class Memo {
  String _content;
  String _noticeDate;
  String _repeat;

  String get content => _content;
  String get noticeDate => _noticeDate;
  String get repeat => _repeat;

  Memo(this._content, this._noticeDate, this._repeat);

  factory Memo.fromJson(Map<String, Object?> json) => Memo(
      json['content'].toString(),
      json['noticeDate'].toString(),
      json['reapeat'].toString());

  Map<String, Object> toJson() => {
        'content': _content,
        'noticeDate': _noticeDate,
        'noticeTime': _repeat,
      };
}
