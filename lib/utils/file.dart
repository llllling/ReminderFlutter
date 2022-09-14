import 'dart:io';

Future<String> _getFileName(String dbPath) async {
  Stream<FileSystemEntity> dirList = Directory(dbPath).list();
  await for (final FileSystemEntity f in dirList) {
    print('Found file ${f.path}');
    return f.path;
  }
  return '';
}

Future<String> _localFile(String dbPath) async {
  String filePath = await _getFileName(dbPath);
  return filePath;
}

Future<void> _existFileRemove(String filePath) async {
  if ((await File(filePath).exists())) {
    await File(filePath).delete();
  }
}

Future<void> dbExportToDownloadFolder(
    String dbPath, Function errorWidget) async {
  try {
    String copyFilePath = '/storage/emulated/0/Download/memo.db';
    await _existFileRemove('/storage/emulated/0/Download/memo.db');
    String originFilePath = await _localFile(dbPath);
    if (originFilePath.isEmpty) {
      throw 'memo db 존재하지 않습니다.';
    }
    File(originFilePath).copy(copyFilePath);
    _existFileRemove(originFilePath); //db삭제
    _existFileRemove('$originFilePath-journal'); //db삭제
  } catch (err) {
    errorWidget(err);
  }
}
