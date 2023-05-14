import 'dart:math' as math;

import 'package:flutter/material.dart';

class Thanks extends StatelessWidget {
  const Thanks({super.key});
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
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: const Color(0xFF6AA84F),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
  const Shake({super.key, this.duration, this.child});
  final Widget? child;
  final Duration? duration;

  @override
  ShakeState createState() => ShakeState();
}

class ShakeState extends State<Shake> with TickerProviderStateMixin {
  late AnimationController controller;

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
