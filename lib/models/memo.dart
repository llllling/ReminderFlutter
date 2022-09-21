class Memo {
  int? id;
  String? content;
  String? noticeDate;
  String? repeat;

  Memo([this.id, this.content, this.noticeDate, this.repeat]);

  Memo.saveForm(
      {required this.content, required this.noticeDate, required this.repeat});

  factory Memo.fromJson(Map<String, Object?> json) => Memo(
      int.parse(json['id'].toString()),
      json['content'].toString(),
      json['noticeDate'].toString(),
      json['reapeat'].toString());

  Map<String, Object> toJson() => {
        'id': id!,
        'content': content!,
        'noticeDate': noticeDate!,
        'noticeTime': repeat!,
      };

  setMemo(String propertyName, dynamic value) {
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
