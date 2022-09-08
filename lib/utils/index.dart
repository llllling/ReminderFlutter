import 'dart:io';

Future<void> check(String dbPath) async {
  int d = dbPath.indexOf('memo');
  final dir = Directory(dbPath.substring(dbPath.indexOf('memo')));

  ///여기 오류남 ! 확인해라

  try {
    var dirList = dir.list();
    await for (final FileSystemEntity f in dirList) {
      if (f is File) {
        print('Found file ${f.path}');
      } else if (f is Directory) {
        print('Found dir ${f.path}');
      }
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<File> _localFile(String dbPath) async {
  await check(dbPath);
  return File(dbPath);
}

Future<void> dbExportToDownloadFolder(dbPath) async {
  String newPath = '/storage/emulated/0/Download';

  File originFile = await _localFile(dbPath);

  await originFile.copy(newPath);
}
