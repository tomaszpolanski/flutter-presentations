import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    Key key,
    this.fraction,
    this.color,
  }) : super(key: key);
  final double fraction;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.shortestSide;
    return Center(
      child: Container(
        height: size * fraction,
        width: size * fraction,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Color(0xFFdc5921),
              Color(0xFFdc5921),
              color,
              Color(0xFF35051f),
              Colors.black,
            ],
            stops: const [0, 0.7, 0.8, 0.98, 1],
          ),
        ),
      ),
    );
  }
}

class ThatsAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
          scale: 2,
          child: Stack(
            children: const [
              const GradientContainer(
                fraction: 1,
                color: Color(0xFF570923),
              ),
              const GradientContainer(
                fraction: 0.7,
                color: Color(0xFF670625),
              ),
              const GradientContainer(
                fraction: 0.7 * 0.7,
                color: Color(0xFF670625),
              ),
              const GradientContainer(
                fraction: 0.7 * 0.7 * 0.7,
                color: Color(0xFF670625),
              ),
            ],
          ),
        ),
        Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: test("That's All Folks!".split('')).toList()),
        )
      ],
    );
  }

  Iterable<Widget> test(List<String> letters) sync* {
    int i = 0;
    for (final letter in letters) {
      yield Transform.translate(
        offset: Offset(0, 1 / 8 * pow(2 * i - letters.length, 2)),
        child: Transform.rotate(
          angle: pi / 180 * (i - letters.length * 0.5) * 2,
          child: Text(
            letter,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      i += 1;
    }
  }
}
