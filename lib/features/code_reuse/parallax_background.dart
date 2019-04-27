import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedParallax extends StatefulWidget {
  const AnimatedParallax({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _AnimatedParallaxState createState() => _AnimatedParallaxState();
}

class _AnimatedParallaxState extends State<AnimatedParallax>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 160),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Image.asset(
          'assets/blueprint_wide.jpg',
          color: Color.fromRGBO(255, 255, 255, 0.15),
          colorBlendMode: BlendMode.modulate,
          fit: BoxFit.fitHeight,
          alignment: FractionalOffset(_controller.value, 0),
        );
      },
    );
  }
}
