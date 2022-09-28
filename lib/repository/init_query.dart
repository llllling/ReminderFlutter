class DBConfig {
  static String dbFileName = 'memo_database.db';
  static List<String> initQuery = [
    "CREATE TABLE repeat_cycle (code TEXT PRIMARY KEY, name TEXT)",
    "INSERT INTO repeat_cycle(code, name) VALUES('none', '안함'), ('day', '매일'), ('week', '매주'), ('month', '매월')",
    "CREATE TABLE memo (id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, noticeDate TEXT, repeat TEXT DEFAULT 'none' NOT NULL, notifyId INTEGER, isRemove INTEGER DEFAULT 0 NOT NULL,  FOREIGN KEY(repeat) REFERENCES repeat_cycle(code))"
  ];
}
