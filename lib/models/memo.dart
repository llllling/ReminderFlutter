class Memo {
  int? _id;
  String? _content;
  String? _noticeDate;
  String? _repeat;

  int? get id => _id;
  String? get content => _content;
  String? get noticeDate => _noticeDate;
  String? get repeat => _repeat;

  Memo(
      [this._id, this._content = '', this._noticeDate = '', this._repeat = '']);

  factory Memo.fromJson(Map<String, Object?> json) => Memo(
      int.parse(json['id'].toString()),
      json['content'].toString(),
      json['noticeDate'].toString(),
      json['reapeat'].toString());

  Map<String, Object> toJson() => {
        'id': _id!,
        'content': _content!,
        'noticeDate': _noticeDate!,
        'noticeTime': _repeat!,
      };

  setMemo(String propertyName, dynamic value) {
    switch (propertyName) {
      case 'content':
        _content = value;
        return;
      case 'noticeDate':
        _noticeDate = value;
        return;
      case 'repeat':
        _repeat = value;
        return;
    }
  }
}
