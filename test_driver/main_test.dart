import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter Driver demo', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('swipe pages', () async {
      await driver.tap(find.text('True Code Reuse'));

      final page = find.byType('PageView');
      await driver.scroll(page, -1000, 0, Duration(milliseconds: 200));
      await driver.scroll(page, -1000, 0, Duration(milliseconds: 200));
      await driver.scroll(page, -1000, 0, Duration(milliseconds: 200));
    });
  });
}
