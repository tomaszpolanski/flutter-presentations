import 'dart:math';

import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

enum RevolvingState {
  showFirst,
  showSecond,
}

class RevolvingWidget extends StatefulWidget {
  const RevolvingWidget({
    Key key,
    @required this.firstChild,
    @required this.secondChild,
    @required this.state,
  }) : super(key: key);

  final Widget firstChild;
  final Widget secondChild;
  final RevolvingState state;

  @override
  _RevolvingWidgetState createState() => _RevolvingWidgetState();
}

class _RevolvingWidgetState extends State<RevolvingWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(RevolvingWidget oldWidget) {
    final current = _controller.value == 0
        ? RevolvingState.showFirst
        : RevolvingState.showSecond;
    if (widget.state != current) {
      if (widget.state == RevolvingState.showFirst) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          child: widget.firstChild,
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
          child: widget.secondChild,
        ),
      ],
    );
  }
}
