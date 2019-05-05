import 'package:flutter/material.dart';
import 'package:flutter_presentations/shared/animation_builder.dart';

class RevealEffect extends StatefulWidget {
  const RevealEffect({
    Key key,
    this.child,
    this.offset = const Offset(0, 0),
  }) : super(key: key);

  final Widget child;
  final Offset offset;

  @override
  _RevealEffectState createState() => _RevealEffectState();
}

class _RevealEffectState extends State<RevealEffect>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationBuilder<double>(
      animation: _controller,
      builder: (_, animation, child) {
        return ClipOval(
          clipper: _CircleRect(animation.value, offset: widget.offset),
          child: child,
        );
      },
      child: Align(
        alignment: Alignment.center,
        child: widget.child,
      ),
    );
  }
}

class _CircleRect extends CustomClipper<Rect> {
  const _CircleRect(
    this.factor, {
    this.offset,
  });

  final double factor;
  final Offset offset;

  @override
  Rect getClip(Size size) {
    final newSize = size.longestSide * 2 * factor * 1.3;
    return Rect.fromCenter(
      center: Offset(size.width * offset.dx, size.height * offset.dy),
      width: newSize,
      height: newSize,
    );
  }

  @override
  bool shouldReclip(_CircleRect oldClipper) => true;
}
