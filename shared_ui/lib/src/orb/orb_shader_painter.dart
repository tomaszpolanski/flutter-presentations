// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_ui/src/orb/orb_shader_config.dart';
import 'package:vector_math/vector_math_64.dart' as v64;

class OrbShaderPainter extends CustomPainter {
  OrbShaderPainter(
    this.shader, {
    required this.config,
    required this.time,
    required this.mousePos,
    required this.energy,
  });

  final FragmentShader shader;
  final OrbShaderConfig config;
  final double time;
  final Offset mousePos;
  final double energy;

  @override
  void paint(Canvas canvas, Size size) {
    final fov = v64.mix(pi / 4.3, pi / 2.0, config.zoom.clamp(0.0, 1.0));

    v64.Vector3 colorToVector3(Color c) =>
        v64.Vector3(
          c.red.toDouble(),
          c.green.toDouble(),
          c.blue.toDouble(),
        ) /
        255.0;

    final lightLumP = colorToVector3(config.lightColor).normalized() *
        max(0.0, config.lightBrightness);
    final albedo = colorToVector3(config.materialColor);

    final ambientLight = colorToVector3(config.ambientLightColor) *
        max(0.0, config.ambientLightBrightness);

    shader
      ..setFloat(0, size.width)
      ..setFloat(1, size.height)
      ..setFloat(2, time)
      ..setFloat(3, max(0.0, config.exposure))
      ..setFloat(4, fov)
      ..setFloat(5, config.roughness.clamp(0.0, 1.0))
      ..setFloat(6, config.metalness.clamp(0.0, 1.0))
      ..setFloat(7, config.lightOffsetX)
      ..setFloat(8, config.lightOffsetY)
      ..setFloat(9, config.lightOffsetZ)
      ..setFloat(10, config.lightRadius)
      ..setFloat(11, lightLumP.x)
      ..setFloat(12, lightLumP.y)
      ..setFloat(13, lightLumP.z)
      ..setFloat(14, albedo.x)
      ..setFloat(15, albedo.y)
      ..setFloat(16, albedo.z)
      ..setFloat(17, config.ior.clamp(0.0, 2.0))
      ..setFloat(18, config.lightAttenuation.clamp(0.0, 1.0))
      ..setFloat(19, ambientLight.x)
      ..setFloat(20, ambientLight.y)
      ..setFloat(21, ambientLight.z)
      ..setFloat(22, config.ambientLightDepthFactor.clamp(0.0, 1.0))
      ..setFloat(23, energy);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(covariant OrbShaderPainter oldDelegate) {
    return oldDelegate.shader != shader ||
        oldDelegate.config != config ||
        oldDelegate.time != time ||
        oldDelegate.mousePos != mousePos ||
        oldDelegate.energy != energy;
  }
}
