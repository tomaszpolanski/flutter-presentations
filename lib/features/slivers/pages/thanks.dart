import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class Thanks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Thank you!',
                style: Theme.of(context).textTheme.display3.copyWith(
                      color: const Color(0xFF6AA84F),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              new DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .copyWith(fontWeight: FontWeight.bold),
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('...questions'),
                    new Shake(
                      duration: const Duration(milliseconds: 1000),
                      child: const Text('?'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        new Align(
          alignment: Alignment.bottomRight,
          child: new Padding(
            padding: const EdgeInsets.only(right: 18.0, bottom: 18.0),
            child: new Text(
              '@tpolansk',
              style: Theme.of(context).textTheme.title.copyWith(
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
    controller = new AnimationController(
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
      new Transform.rotate(angle: angle, child: widget.child);
}
