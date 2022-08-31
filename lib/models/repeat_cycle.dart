class RepeatCycle {
  final String _repeatCode;
  final String _repeatName;

  RepeatCycle(this._repeatCode, this._repeatName);

  Map<String, dynamic> toJson() =>
      {'repeatCode': _repeatCode, 'repeatName': _repeatName};
}
