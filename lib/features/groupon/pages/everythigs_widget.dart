import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';
import 'package:flutter_presentations/shared/presentation_stepper.dart';

class EverythingsWidget extends StatefulWidget {
  const EverythingsWidget({Key key, this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  _EverythingsWidgetState createState() => _EverythingsWidgetState();
}

enum _Step {
  init,
  asteriks,
  next,
}

class _EverythingsWidgetState extends State<EverythingsWidget>
    with SingleTickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.asteriks,
        forward: () => _controller.forward(),
        reverse: () => _controller.reverse(),
      )
      ..add(
        fromStep: _Step.asteriks,
        toStep: _Step.next,
        forward: () => widget.controller.next(),
      )
      ..build();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = _controller.drive(
      CurveTween(curve: Curves.easeOut),
    );
    return DefaultTextStyle.merge(
      style: GTheme.big.copyWith(color: GTheme.flutter2),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Everything's a Widget"),
            AnimatedBuilder(
              animation: animation,
              builder: (_, child) {
                return Transform.rotate(
                  angle: 2 * pi * animation.value / 4,
                  child: Opacity(
                    opacity: animation.value,
                    child: child,
                  ),
                );
              },
              child: Text(
                '✱',
                style: TextStyle(
                  fontSize: 30,
                  color: GTheme.flutter1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
