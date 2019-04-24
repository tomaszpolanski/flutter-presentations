import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/shared/animation_builder.dart';
import 'package:presentation/parallax_effect.dart';
import 'package:presentation/presentation_controller.dart';
import 'package:presentation/presentation_stepper.dart';

class Composable extends StatefulWidget {
  const Composable({Key key, this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  _ComposableState createState() => _ComposableState();
}

enum _Step {
  init,
  flutter,
  next,
}

class _ComposableState extends State<Composable>
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
        toStep: _Step.flutter,
        forward: _controller.forward,
        reverse: _controller.reverse,
      )
      ..add(
        fromStep: _Step.flutter,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
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
    return DefaultTextStyle.merge(
      style: GTheme.big.copyWith(color: GTheme.flutter1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ParallaxWidget(child: Text('composable')),
          Text('+'),
          ParallaxWidget(child: Text('small chunks')),
          Text('='),
          ParallaxWidget(
            child: Stack(
              children: [
                AnimationBuilder<double>(
                  animation: _controller,
                  builder: (_, animation, child) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..rotateX(animation.value * pi / 2)
                        ..translate(0.0, animation.value * (-50.0)),
                      child: child,
                    );
                  },
                  child: Text('reusable'),
                ),
                AnimationBuilder<double>(
                  animation: _controller,
                  builder: (_, animation, child) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..translate(0.0, (1 - animation.value) * (50.0))
                        ..rotateX((1 - animation.value) * (pi / 2)),
                      child: animation.value == 0 ? SizedBox() : child,
                    );
                  },
                  child: Text('Flutter'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
