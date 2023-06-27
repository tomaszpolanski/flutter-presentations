// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'orb_shader_config.dart';
import 'orb_shader_widget.dart';

/// Shameless copy pasta from https://github.com/flutter/codelabs/tree/main/next-gen-ui
/// because shaders are hard ;)
class Orb extends StatefulWidget {
  const Orb({super.key});

  @override
  State<Orb> createState() => _OrbState();
}

class _OrbState extends State<Orb> with SingleTickerProviderStateMixin {
  /// Internal
  var _mousePos = Offset.zero;

  Color get _emitColor => Color(0xFF40CCE7);

  Color get _orbColor => Color(0xFF00C1F5);

  double _minOrbEnergy = 0;

  late final _pulseEffect = AnimationController(
    vsync: this,
    duration: _getRndPulseDuration(),
    lowerBound: -1,
    upperBound: 1,
  );

  Duration _getRndPulseDuration() => 100.ms + 200.ms * Random().nextDouble();

  @override
  void initState() {
    super.initState();
    _pulseEffect.forward();
    _pulseEffect.addListener(_handlePulseEffectUpdate);
  }

  void _handlePulseEffectUpdate() {
    if (_pulseEffect.status == AnimationStatus.completed) {
      _pulseEffect.reverse();
      _pulseEffect.duration = _getRndPulseDuration();
    } else if (_pulseEffect.status == AnimationStatus.dismissed) {
      _pulseEffect.duration = _getRndPulseDuration();
      _pulseEffect.forward();
    }
  }

  /// Update mouse position so the orbWidget can use it, doing it here prevents
  /// btns from blocking the mouse-move events in the widget itself.
  void _handleMouseMove(PointerHoverEvent e) {
    setState(() {
      _mousePos = e.localPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _handleMouseMove,
      child: _AnimatedColors(
        orbColor: _orbColor,
        emitColor: _emitColor,
        builder: (_, orbColor, emitColor) {
          return OrbShaderWidget(
            mousePos: _mousePos,
            minEnergy: _minOrbEnergy,
            config: OrbShaderConfig(
              ambientLightColor: orbColor,
              materialColor: orbColor,
              lightColor: orbColor,
            ),
          );
        },
      ),
    );
  }
}

class _AnimatedColors extends StatelessWidget {
  const _AnimatedColors({
    required this.emitColor,
    required this.orbColor,
    required this.builder,
  });

  final Color emitColor;
  final Color orbColor;

  final Widget Function(
    BuildContext context,
    Color orbColor,
    Color emitColor,
  ) builder;

  @override
  Widget build(BuildContext context) {
    final duration = 0.5.seconds;
    return TweenAnimationBuilder(
      tween: ColorTween(begin: emitColor, end: emitColor),
      duration: duration,
      builder: (_, emitColor, __) {
        return TweenAnimationBuilder(
          tween: ColorTween(begin: orbColor, end: orbColor),
          duration: duration,
          builder: (context, orbColor, __) =>
              builder(context, orbColor!, emitColor!),
        );
      },
    );
  }
}
