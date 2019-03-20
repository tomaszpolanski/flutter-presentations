import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';
import 'package:flutter_presentations/shared/presentation_stepper.dart';

class Solid extends StatefulWidget {
  const Solid({Key key, this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  _SolidState createState() => _SolidState();
}

const _principles = [
  'Single Responsibility Principle',
  'Open/Closed Principle',
  'Liskov Substitution Principle',
  'Interface Segregation Principle',
  'Dependency Inversion',
];

enum _Step {
  init,
  solid,
  openClosed,
  next,
}

class _SolidState extends State<Solid> with TickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  AnimationController _controller;
  bool _showOnlyOpenClosed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.solid,
        forward: () => _controller.forward(),
        reverse: () => _controller.reverse(),
      )
      ..add(
          fromStep: _Step.solid,
          toStep: _Step.openClosed,
          forward: () => setState(() => _showOnlyOpenClosed = true),
          reverse: () => setState(() => _showOnlyOpenClosed = false))
      ..add(
        fromStep: _Step.openClosed,
        toStep: _Step.next,
        forward: () => widget.controller.next(),
      )
      ..addListener(() => setState(() {}))
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
    const height = 140.0;
    const offset = 130.0;
    final translateAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.3, curve: Curves.ease),
    );

    return DefaultTextStyle.merge(
      style: TextStyle(fontSize: height),
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: _showOnlyOpenClosed ? 0 : 1,
            duration: Duration(milliseconds: 300),
            child: _AnimatedLine(
              index: 0,
              animation: _controller,
            ),
          ),
          Positioned(
            left: offset,
            child: AnimatedBuilder(
              animation: translateAnimation,
              builder: (_, child) {
                return Transform.translate(
                  offset: Offset(0, translateAnimation.value * height * 1),
                  child: child,
                );
              },
              child: _AnimatedLine(
                index: 1,
                animation: _controller,
              ),
            ),
          ),
          Positioned(
            left: offset * 2,
            child: AnimatedOpacity(
              opacity: _showOnlyOpenClosed ? 0 : 1,
              duration: Duration(milliseconds: 300),
              child: AnimatedBuilder(
                animation: translateAnimation,
                builder: (_, child) {
                  return Transform.translate(
                    offset: Offset(0, translateAnimation.value * height * 2),
                    child: child,
                  );
                },
                child: _AnimatedLine(
                  index: 2,
                  animation: _controller,
                ),
              ),
            ),
          ),
          Positioned(
            left: offset * 3,
            child: AnimatedOpacity(
              opacity: _showOnlyOpenClosed ? 0 : 1,
              duration: Duration(milliseconds: 300),
              child: AnimatedBuilder(
                animation: translateAnimation,
                builder: (_, child) {
                  return Transform.translate(
                    offset: Offset(0, translateAnimation.value * height * 3),
                    child: child,
                  );
                },
                child: _AnimatedLine(
                  index: 3,
                  animation: _controller,
                ),
              ),
            ),
          ),
          Positioned(
            left: offset * 3.5,
            child: AnimatedOpacity(
              opacity: _showOnlyOpenClosed ? 0 : 1,
              duration: Duration(milliseconds: 300),
              child: AnimatedBuilder(
                animation: translateAnimation,
                builder: (_, child) {
                  return Transform.translate(
                    offset: Offset(0, translateAnimation.value * height * 4),
                    child: child,
                  );
                },
                child: _AnimatedLine(
                  index: 4,
                  animation: _controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedLine extends StatelessWidget {
  const _AnimatedLine({
    Key key,
    @required this.animation,
    @required this.index,
  }) : super(key: key);

  final int index;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    const revealStart = 0.2;
    final step = (1 - 0.2) / _principles.length.toDouble();
    final start = revealStart + index * step;
    return _Letter(
      _principles[index],
      animation: CurvedAnimation(
        parent: animation,
        curve: Interval(
          start,
          start + step,
          curve: Curves.ease,
        ),
      ),
    );
  }
}

class _Letter extends StatelessWidget {
  const _Letter(
    this.text, {
    Key key,
    this.animation,
  }) : super(key: key);
  final String text;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          text[0],
          style: TextStyle(color: GTheme.flutter3),
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (_, child) {
            return Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(0),
                    Colors.white,
                    Colors.white,
                  ],
                  stops: [0.0, animation.value, animation.value, 1.0],
                ),
              ),
              child: child,
            );
          },
          child: Text(
            text.substring(1, text.length),
            style: TextStyle(fontSize: 40, color: GTheme.flutter2),
          ),
        ),
      ],
    );
  }
}
