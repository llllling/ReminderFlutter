import 'dart:io';

import 'package:remainder_flutter/widgets/common/error_snackbar.dart';

check(String dbPath) async {
  try {
    Stream<FileSystemEntity> dirList = Directory(dbPath).list();

    await for (final FileSystemEntity f in dirList) {
      print('Found file ${f.path}');
      return f.path;
    }
  } catch (e) {
    print(e.toString());
    // throw ErrorSnackbar(e.toString());
  }
}

Future<File> _localFile(String dbPath) async {
  String filePath = await check(dbPath);
  return File(filePath);
}

Future<void> dbExportToDownloadFolder(dbPath) async {
  File originFile = await _localFile(dbPath);
  await originFile.copy('/storage/emulated/0/Download/memo.db');
}
