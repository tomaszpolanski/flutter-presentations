// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/services.dart';

class AssetPaths {
  static const package = 'shared_ui';

  static const String _shaders = 'assets/shaders';
  static const String orbShader =
      'packages/$package/assets/shaders/orb_shader.frag';
  static const String uiShader =
      'packages/$package/assets/shaders/ui_glitch.frag';
}

typedef FragmentPrograms = ({FragmentProgram orb, FragmentProgram ui});

Future<FragmentPrograms> loadFragmentPrograms() async {
  final result = (
    orb: (await _loadFragmentProgram(AssetPaths.orbShader)),
    ui: (await _loadFragmentProgram(AssetPaths.uiShader)),
  );
  return result;
}

Future<FragmentProgram> _loadFragmentProgram(String path) async {
  return (await FragmentProgram.fromAsset(path));
}
