import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedParallaxImage extends StatefulWidget {
  const AnimatedParallaxImage({
    Key key,
    this.child,
    @required this.asset,
    this.opacity = 1,
  }) : super(key: key);

  final String asset;
  final double opacity;

  final Widget child;

  @override
  _AnimatedParallaxImageState createState() => _AnimatedParallaxImageState();
}

class _AnimatedParallaxImageState extends State<AnimatedParallaxImage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 160),
    ); //..repeat(reverse: true);
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
          widget.asset,
          color: Color.fromRGBO(255, 255, 255, widget.opacity),
          colorBlendMode: BlendMode.modulate,
          fit: BoxFit.fitHeight,
          alignment: FractionalOffset(_controller.value, 0),
        );
      },
    );
  }
}
