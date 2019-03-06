import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InheritanceVsComposition extends StatefulWidget {
  @override
  _InheritanceVsCompositionState createState() =>
      _InheritanceVsCompositionState();
}

class _InheritanceVsCompositionState extends State<InheritanceVsComposition> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: SizedBox()),
        Expanded(child: _Composition()),
      ],
    );
  }
}

class _Composition extends StatefulWidget {
  @override
  __CompositionState createState() => __CompositionState();
}

class __CompositionState extends State<_Composition>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const size = 50.0;
    return GestureDetector(
      onTap: () {
        _controller.forward(from: 0);
      },
      child: Container(
        color: Colors.transparent,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              child: _AnimatedPosition(
                animation: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.4, 0.6, curve: Curves.ease),
                ),
                child: _CompositionItem(
                  width: size * 4,
                  height: size,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              left: size * 4,
              child: _AnimatedPosition(
                animation: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.3, 0.5, curve: Curves.ease),
                ),
                child: _CompositionItem(
                  width: size,
                  height: size * 4,
                  color: Colors.blue,
                ),
              ),
            ),
            Positioned(
              left: size * 3,
              top: size,
              child: _AnimatedPosition(
                animation: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.2, 0.4, curve: Curves.ease),
                ),
                child: _CompositionItem(
                  width: size,
                  height: size * 3,
                  color: Colors.green,
                ),
              ),
            ),
            Positioned(
              top: size,
              child: _AnimatedPosition(
                animation: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.1, 0.3, curve: Curves.ease),
                ),
                child: _CompositionItem(
                  width: size * 3,
                  height: size * 2,
                  color: Colors.yellow,
                ),
              ),
            ),
            Positioned(
              top: size * 3,
              child: _AnimatedPosition(
                animation: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.0, 0.2, curve: Curves.ease),
                ),
                child: _CompositionItem(
                  width: size * 3,
                  height: size,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedPosition extends StatelessWidget {
  const _AnimatedPosition({Key key, this.animation, this.child})
      : super(key: key);
  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: Offset(0, animation.value * 500),
            child: child,
          ),
        );
      },
      child: Transform.translate(
        offset: Offset(0, -500),
        child: child,
      ),
    );
  }
}

class _CompositionItem extends StatelessWidget {
  const _CompositionItem({
    Key key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: color,
      ),
    );
  }
}
