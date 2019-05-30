import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_presentations/flutter_presentations.dart';
import 'package:flutter_presentations/shared/animation_mode.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  enableFlutterDriverExtension();
  timeDilation = 0.1;
  runApp(
    const AnimationMode(
      enabled: false,
      child: const FlutterPresentations(),
    ),
  );
}
