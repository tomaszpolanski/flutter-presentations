import 'dart:convert';

import 'package:fast_flutter_driver/driver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_presentations/flutter_presentations.dart';
import 'package:presentation/presentation.dart';

import 'test_configuration.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  timeDilation = 0.1;
  enableFlutterDriverExtension(
    handler: (playload) => configureTest(
      TestConfiguration.fromJson(json.decode(playload)),
    ),
  );

  runApp(
    RestartWidget<TestConfiguration>(
      builder: (_, config) => const AnimationMode(
        enabled: false,
        child: FlutterPresentations(),
      ),
    ),
  );
}
