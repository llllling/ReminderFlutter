class Memo {
  String _content;
  String _noticeDate;
  String _noticeTime;

  Memo({required this.content, required this.noticeDate, required  this.noticeTime});

  factory Memo.fromJson(Map<String, dynamic> json) => new Memo({
    content: json['content'],
    noticeDate: json['noticeDate'],
    noticeTime: json['noticeTime'],
  })

  toJson() => {
    'content' : content,
    'noticeDate' : noticeDate,
    'noticeTime' : noticeTime,
  }
}
