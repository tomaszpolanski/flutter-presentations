import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'screenshots.dart';

void main() {
  group('Flutter Driver demo', () {
    FlutterDriver driver;
    Screenshot screenshot;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      screenshot = await Screenshot.create(driver, 'code_reuse');
    });

    tearDownAll(() async {
      await driver?.close();
    });

    test('setup', () async {
      await screenshot.takeScreenshot('setup');
      await driver.tap(find.text('True Effort Reuse'));
    });

    test('make screenshots', () async {
      final page = find.byValueKey('presentation');
      var index = 0;
      while (index < 35) {
        await screenshot.takeScreenshot(index.toString());
        await driver.tap(page);
        index += 1;
      }
    }, timeout: Timeout.factor(10));
  });
}
