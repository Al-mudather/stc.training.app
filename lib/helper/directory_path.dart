import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DirectoryPath {
  getApplicationDocumentsStoragePath() async {
    final Directory tempDir = await getApplicationDocumentsDirectory();
    final filePath = Directory("${tempDir.path}/files");
    if (await filePath.exists()) {
      return filePath.path;
    } else {
      await filePath.create(
        recursive: true,
      );
      return filePath.path;
    }
  }

  getTemporaryPath() async {
    final Directory tempDir = await getTemporaryDirectory();
    final filePath = Directory("${tempDir.path}/files");
    if (await filePath.exists()) {
      return filePath.path;
    } else {
      await filePath.create(
        recursive: true,
      );
      return filePath.path;
    }
  }

  getExternalStoragePath() async {
    final Directory? tempDir = await getExternalStorageDirectory();
    final filePath = Directory("${tempDir!.path}/files");
    if (await filePath.exists()) {
      return filePath.path;
    } else {
      await filePath.create(
        recursive: true,
      );
      return filePath.path;
    }
  }
}
