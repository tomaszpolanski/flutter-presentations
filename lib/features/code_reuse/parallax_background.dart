import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/shared/animation_mode.dart';

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
    );
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
      _controller.repeat(reverse: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Image.asset(
          widget.asset,
          color: Colors.white.withOpacity(widget.opacity),
          colorBlendMode: BlendMode.modulate,
          fit: BoxFit.fitHeight,
          alignment: FractionalOffset(_controller.value, 0),
        );
      },
    );
  }
}
