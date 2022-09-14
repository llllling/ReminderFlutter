import 'dart:io';

import 'package:remainder_flutter/widgets/common/error_snackbar.dart';

Future<String> check(String dbPath) async {
  try {
    Stream<FileSystemEntity> dirList = Directory(dbPath).list();

    await for (final FileSystemEntity f in dirList) {
      print('Found file ${f.path}');
      return f.path;
    }
  } catch (e) {
    print(e.toString());
    // throw ErrorSnackbar(e.toString()); ㅜㅜ좀더생각해보자...
  }
  return '';
}

Future<String> _localFile(String dbPath) async {
  String filePath = await check(dbPath);
  return filePath;
}

Future<String> copyFilePathFor(String copyFilePath) async {
  if ((await _localFile(copyFilePath)).isNotEmpty) {
    File(await _localFile(copyFilePath)).delete();
  }
  return copyFilePath;
}

Future<void> dbExportToDownloadFolder(dbPath) async {
  File originFile = File(await _localFile(dbPath));
  String copyFilePath =
      await copyFilePathFor('/storage/emulated/0/Download/memo.db');
  await originFile.copy(copyFilePath);
}
