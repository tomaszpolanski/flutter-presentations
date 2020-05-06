import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class Thanks extends StatelessWidget {
  const Thanks({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Thank you!',
                style: Theme.of(context).textTheme.headline2.copyWith(
                      color: const Color(0xFF6AA84F),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('...questions'),
                    Shake(
                      duration: Duration(milliseconds: 1000),
                      child: Text('?'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 18, bottom: 18),
            child: Text(
              '@tpolansk',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        )
      ],
    );
  }
}

class Shake extends StatefulWidget {
  const Shake({Key key, this.duration, this.child}) : super(key: key);
  final Widget child;
  final Duration duration;

  @override
  ShakeState createState() => ShakeState();
}

class ShakeState extends State<Shake> with TickerProviderStateMixin {
  AnimationController controller;

  double get angle => math.sin(controller.value * math.pi * 2) * 0.5;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )
      ..addListener(() => setState(() {}))
      ..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Transform.rotate(angle: angle, child: widget.child);
}
