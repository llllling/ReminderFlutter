class RepeatCycle {
  final String _code;
  final String _name;

  RepeatCycle(this._code, this._name);

  factory RepeatCycle.fromJson(Map<String, Object?> json) =>
      RepeatCycle(json['code'].toString(), json['name'].toString());

  Map<String, Object> toJson() => {'code': _code, 'name': _name};
}
