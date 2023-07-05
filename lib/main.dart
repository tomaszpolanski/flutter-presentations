import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/flutter_presentations.dart';
import 'package:presentation/presentation.dart' show AnimationMode;
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    await WindowManager.instance.ensureInitialized();
  }

  runApp(
    const AnimationMode(
      enabled: true,
      child: FlutterPresentations(),
    ),
  );
}
