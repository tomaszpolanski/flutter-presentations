import 'dart:math' as math;

import 'package:flutter/material.dart';

class BigIntro extends StatelessWidget {
  const BigIntro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Placeholder()),
        Expanded(child: _FlutterProjects()),
      ],
    );
  }
}

class _FlutterProjects extends StatefulWidget {
  const _FlutterProjects({Key key}) : super(key: key);

  @override
  __FlutterProjectsState createState() => __FlutterProjectsState();
}

class __FlutterProjectsState extends State<_FlutterProjects>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<_Circle> _circles;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
    _circles = _createCircles(math.Random()).toList();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _circles = _createCircles(math.Random()).toList();
        });
      },
      child: LayoutBuilder(
        builder: (context, c) {
          print('QQQ1  $c');
          return Stack(
            fit: StackFit.expand,
            children: _circles
                .map((i) => Positioned(
                      left: c.maxWidth * i.x,
                      top: c.maxHeight * i.y,
                      child: LoopTransition(
                        scale: _controller,
                        child: _Bubble(size: i.size),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }

  _Circle _generateCircle(math.Random random, {double min, double max}) {
    return _Circle(
      size: random.nextDouble() * (max - min) + min,
      x: random.nextDouble(),
      y: random.nextDouble(),
    );
  }

  Iterable<_Circle> _createCircles(math.Random random) sync* {
    const minSize = 30;
    const maxSize = 200;

    for (int i = 0; i < 20; i++) {
      yield _createSmallCircle(random);
    }
    for (int i = 0; i < 10; i++) {
      yield _createMediumCircle(random);
    }

    for (int i = 0; i < 2; i++) {
      yield _createLargeCircle(random);
    }
  }

  _Circle _createSmallCircle(math.Random random) {
    const minSize = 30.0;
    const maxSize = 50.0;
    return _generateCircle(random, min: minSize, max: maxSize);
  }

  _Circle _createMediumCircle(math.Random random) {
    const minSize = 50.0;
    const maxSize = 120.0;
    return _generateCircle(random, min: minSize, max: maxSize);
  }

  _Circle _createLargeCircle(math.Random random) {
    const minSize = 180.0;
    const maxSize = 250.0;
    return _generateCircle(random, min: minSize, max: maxSize);
  }
}

class _Circle {
  const _Circle({
    @required this.size,
    @required this.x,
    @required this.y,
  });

  final double size;
  final double x;
  final double y;
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    Key key,
    this.size = 30,
    this.color = Colors.orange,
  }) : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size),
      ),
    );
  }
}

class LoopTransition extends AnimatedWidget {
  const LoopTransition({
    Key key,
    @required Animation<double> scale,
    this.radius = 40,
    this.child,
  })  : assert(scale != null),
        super(key: key, listenable: scale);

  Animation<double> get scale => listenable;

  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final x = radius * math.sin(2 * math.pi * scale.value);
    final y = radius * math.cos(2 * math.pi * scale.value);
    return Transform.translate(
      offset: Offset(x, y),
      child: child,
    );
  }
}
