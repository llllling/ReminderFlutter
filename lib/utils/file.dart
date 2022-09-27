import 'dart:io';

import 'package:sqflite/sqflite.dart';

Future<String> _getFileName(String dbPath) async {
  final directory = Directory(dbPath);
  await for (final f in directory.list()) {
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
    // _existFileRemove(originFilePath); //db삭제
    // _existFileRemove('$originFilePath-journal'); //db삭제
  } catch (err) {
    errorWidget(err);
  }
}

void downloadDBFile(Function errorWidget) async {
  String dbPath = await getDatabasesPath();
  dbExportToDownloadFolder(dbPath, errorWidget);
}
