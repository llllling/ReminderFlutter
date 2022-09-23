class RepeatCycle {
  final String? code;
  final String? name;

  RepeatCycle({this.code, this.name});

  factory RepeatCycle.fromJson(Map<String, Object?> json) =>
      RepeatCycle(code: json['code'].toString(), name: json['name'].toString());

  Map<String, Object> toJson() => {'code': code!, 'name': name!};
}
