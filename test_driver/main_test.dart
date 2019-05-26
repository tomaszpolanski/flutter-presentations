import 'package:args/args.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_presentations/test_driver/src/tests.dart';
import 'package:test/test.dart';

import 'screenshots.dart';

void main(List<String> args) {
  group('Flutter Driver demo', () {
    FlutterDriver driver;
    Screenshot screenshot;
    final ArgResults arguments = testParser.parse(args);

    setUpAll(() async {
      driver = await FlutterDriver.connect(dartVmServiceUrl: arguments[url]);
      screenshot = await Screenshot.create(driver, 'code_reuse');
    });

    tearDownAll(() async {
      await driver?.close();
    });

    test('setup', () async {
      await screenshot.takeScreenshot('setup');
      await driver.tap(find.text('True Effort Reuse'));
    });

    // ignore: avoid_function_literals_in_foreach_calls
    List.generate(60, (step) => step).forEach((step) {
      test('make screenshots for step $step', () async {
        await screenshot.takeScreenshot(step.toString());
        final page = find.byValueKey('presentation');
        await driver.tap(page);
      });
    });
  });
}
