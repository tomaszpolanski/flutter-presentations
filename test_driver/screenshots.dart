import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

const _dirPath = 'screenshots';

class Screenshot {
  Screenshot._(this.dir, this.driver);

  final String dir;
  final FlutterDriver driver;

  static Future<Screenshot> create(FlutterDriver driver, String group) async {
    final ss = Screenshot._('$_dirPath/$group', driver);
    await ss._setupScreenshots();
    return ss;
  }

  Future<void> takeScreenshot(String name) async {
    final List<int> pixels = await driver.screenshot();
    final File file = File('$dir/$name.png');
    await file.writeAsBytes(pixels);
  }

  Future<Directory> _setupScreenshots() =>
      Directory(dir).create(recursive: true);
}
