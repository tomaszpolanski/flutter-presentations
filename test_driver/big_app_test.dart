import 'dart:convert';

import 'package:fast_flutter_driver/tool.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'generic/test_configuration.dart';
import 'screenshots.dart';

void main(List<String> args) {
  group('Big App', () {
    FlutterDriver driver;
    Screenshot screenshot;
    final properties = TestProperties(args);

    setUpAll(() async {
      driver = await FlutterDriver.connect(dartVmServiceUrl: properties.vmUrl);
      screenshot = await Screenshot.create(
        driver,
        'big_app',
        enabled: properties.arguments['screenshots'],
      );
    });

    tearDownAll(() async {
      await driver?.close();
    });

    setUpAll(() async {
      await driver.requestData(
        json.encode(
          TestConfiguration(
            resolution: properties.resolution,
          ),
        ),
      );
    });

    test('main page', () async {
      await screenshot.takeScreenshot('setup');
      await driver.tap(find.text('Big Applications'));
    });

    // ignore: avoid_function_literals_in_foreach_calls
    List.generate(70, (step) => step).forEach((step) {
      test('make screenshots for step $step', () async {
        await screenshot.takeScreenshot(step.toString());
        final page = find.byValueKey('presentation');
        await driver.tap(page);
        await Future<void>.delayed(const Duration(milliseconds: 300));
      });
    });
  });
}
