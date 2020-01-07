import 'package:flutter/material.dart';

class AnimatedSlideIn extends ImplicitlyAnimatedWidget {
  const AnimatedSlideIn({
    Key key,
    this.child,
    @required this.position,
    Curve curve = Curves.linear,
    @required Duration duration,
  }) : super(key: key, curve: curve, duration: duration);

  final Offset position;
  final Widget child;

  @override
  _AnimatedSlideInState createState() => _AnimatedSlideInState();
}

class _AnimatedSlideInState
    extends ImplicitlyAnimatedWidgetState<AnimatedSlideIn> {
  Tween<Offset> _offset = Tween<Offset>(
    begin: const Offset(0, 0),
    end: const Offset(0, 0),
  );
  Animation<Offset> _animation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _offset = visitor(
      _offset,
      widget.position,
      (dynamic value) => Tween<Offset>(
        begin: value,
        end: const Offset(0, 0),
      ),
    );
  }

  @override
  void didUpdateTweens() {
    _animation = animation.drive(_offset);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
