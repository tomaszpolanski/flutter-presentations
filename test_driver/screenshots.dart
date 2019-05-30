import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

const _dirPath = 'screenshots';

class Screenshot {
  Screenshot._(
    this.dir,
    this.driver, {
    this.enabled,
  });

  final String dir;
  final FlutterDriver driver;
  final bool enabled;

  static Future<Screenshot> create(
    FlutterDriver driver,
    String group, {
    bool enabled,
  }) async {
    final ss = Screenshot._(
      '$_dirPath/$group',
      driver,
      enabled: enabled,
    );
    if (ss.enabled) {
      await ss._setupScreenshots();
    }
    return ss;
  }

  Future<void> takeScreenshot(String name) async {
    if (enabled) {
      final List<int> pixels = await driver.screenshot();
      final File file = File('$dir/$name.png');
      await file.writeAsBytes(pixels);
    }
  }

  Future<Directory> _setupScreenshots() =>
      Directory(dir).create(recursive: true);
}
