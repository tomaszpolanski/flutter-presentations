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

            children: <Widget>[
              new Text(
                "Thank you!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display3.copyWith(
                      color: const Color(0xFF6AA84F),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              new Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text(
                    "...questions",
                    style: Theme.of(context).textTheme.headline.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  new Shake(
                    duration: const Duration(milliseconds: 1000),
                    child: new Text(
                      "?",
                      style: Theme.of(context).textTheme.headline.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ],

              mainAxisSize: MainAxisSize.min
          ),
        ),
        new Align(
          alignment: Alignment.bottomRight,
          child: new Padding(
            padding: const EdgeInsets.only(right: 18.0, bottom: 18.0),
            child: new Text(
              '@tpolansk',
              style: Theme.of(context).textTheme.title.copyWith(
                  color: Colors.blueAccent, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class Shake extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const Shake({Key key, this.duration, this.child}) : super(key: key);

  @override
  ShakeState createState() {
    return new ShakeState();
  }
}

class ShakeState extends State<Shake> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      duration: widget.duration,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    controller.repeat();
  }

  double _angle() => math.sin(controller.value * math.pi * 2) * 0.5;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Transform.rotate(
      angle: _angle(),
      child: widget.child,
    );
  }
}
