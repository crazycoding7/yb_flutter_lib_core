import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileUtil {
  static Future<File> _getLocalFile(String fileName) async {
    // 获取文档目录的路径
    Directory? appDocDir = await getExternalStorageDirectory();
    appDocDir ??= await getApplicationDocumentsDirectory();
    String dir = appDocDir.path;
    final file = File('$dir/crash.txt');
    return file;
  }

  static void saveValue(String fileName, String content) async {
    try {
      File f = await _getLocalFile(fileName);
      IOSink slink = f.openWrite(mode: FileMode.append);
      slink.write(content);

      slink.close();
    } catch (e) {}
  }
}
