import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter_presentations/flutter_presentations.dart';
import 'package:presentation/presentation.dart' show AnimationMode;

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(
    const AnimationMode(
      enabled: true,
      child: FlutterPresentations(),
    ),
  );
}
