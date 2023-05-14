import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:presentation/presentation.dart';

class BigIntro extends StatelessWidget {
  const BigIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children:  [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 30),
            child: _Title(),
          ),
        ),
        Expanded(child: FlutterProjects()),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: Theme.of(context).textTheme.headlineSmall,
        children: <InlineSpan>[
          const TextSpan(text: 'Large '),
          WidgetSpan(
            child: Image.asset(
              'assets/image4.png',
              height: 130,
            ),
          ),
          const TextSpan(text: 'Applications'),
        ],
      ),
    );
  }
}

class FlutterProjects extends StatefulWidget {
  const FlutterProjects({super.key});

  @override
  _FlutterProjectsState createState() => _FlutterProjectsState();
}

const minSize = 10.0;
const maxSize = 290.0;

class _FlutterProjectsState extends State<FlutterProjects>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Circle> _circles;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _circles = _createCircles(math.Random()).toList();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (AnimationMode.of(context)) {
      _controller.repeat();
    }
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
          return Stack(
            fit: StackFit.expand,
            children: _circles
                .map((i) => Positioned(
                      left: c.maxWidth * i.x,
                      top: c.maxHeight * i.y,
                      child: LoopTransition(
                        seed: math.Random().nextDouble(),
                        scale: _controller,
                        radius: 400 / i.size,
                        child: _Bubble(
                          size: i.size,
                          color: Color.lerp(
                            Colors.lightBlueAccent,
                            GTheme.flutter3,
                            i.size / maxSize,
                          ),
                        ),
                      ),
                    ),)
                .toList(),
          );
        },
      ),
    );
  }

  _Circle _generateCircle(math.Random random,
      {required double min, required double max,}) {
    return _Circle(
      size: random.nextDouble() * (max - min) + min,
      x: random.nextDouble(),
      y: random.nextDouble(),
    );
  }

  Iterable<_Circle> _createCircles(math.Random random) sync* {
    for (var i = 0; i < 2; i++) {
      yield _createLargeCircle(random);
    }
    for (var i = 0; i < 10; i++) {
      yield _createMediumCircle(random);
    }
    for (var i = 0; i < 200; i++) {
      yield _createSmallCircle(random);
    }
  }

  _Circle _createSmallCircle(math.Random random) {
    return _generateCircle(random, min: minSize, max: 50);
  }

  _Circle _createMediumCircle(math.Random random) {
    return _generateCircle(random, min: 50, max: 120);
  }

  _Circle _createLargeCircle(math.Random random) {
    return _generateCircle(random, min: 200, max: maxSize);
  }
}

class _Circle {
  const _Circle({
    required this.size,
    required this.x,
    required this.y,
  });

  final double size;
  final double x;
  final double y;
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    super.key,
    this.size = 30,
    this.color = Colors.orange,
  });

  final double size;
  final Color? color;

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
    super.key,
    required Animation<double> scale,
    this.radius = 40,
    required this.seed,
    this.child,
  }) : super(listenable: scale);

  // ignore: avoid_as
  Animation<double> get scale => listenable as Animation<double>;

  final Widget? child;
  final double radius;
  final double seed;

  @override
  Widget build(BuildContext context) {
    final x =
        radius * math.sin((2 * math.pi * scale.value) + 2 * math.pi * seed);
    final y = radius * math.cos(2 * math.pi * scale.value + 2 * math.pi * seed);
    return Transform.translate(
      offset: Offset(x, y),
      child: child,
    );
  }
}
