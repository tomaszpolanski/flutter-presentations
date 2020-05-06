import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/effects.dart';
import 'package:presentation/presentation.dart';

class Composable extends StatefulWidget {
  const Composable(
    this.controller, {
    Key key,
  }) : super(key: key);
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
      duration: const Duration(milliseconds: 500),
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
      style: Theme.of(context).textTheme.bodyText2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const ParallaxWidget(child: Text('composable')),
          const Text('+'),
          const ParallaxWidget(child: Text('small chunks')),
          const Text('='),
          ParallaxWidget(
            child: Stack(
              children: [
                WrappedAnimatedBuilder<double>(
                  animation: _controller,
                  builder: (_, animation, child) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..rotateX(animation.value * pi / 2)
                        ..translate(0.0, animation.value * (-50.0)),
                      child: child,
                    );
                  },
                  child: const Text('reusable'),
                ),
                WrappedAnimatedBuilder<double>(
                  animation: _controller,
                  builder: (_, animation, child) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..translate(0.0, (1 - animation.value) * (50.0))
                        ..rotateX((1 - animation.value) * (pi / 2)),
                      child: animation.value == 0 ? const SizedBox() : child,
                    );
                  },
                  child: const Text('Flutter'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
