import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Inception extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return repeat(_Inception(), 0, 10);
  }

  Widget repeat(Widget child, int current, int max) {
    return current == max
        ? child
        : repeat(_Inception(child: child), current + 1, max);
  }
}

class _Inception extends StatelessWidget {
  const _Inception({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constr) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              left: constr.maxWidth * 0.11,
              top: constr.maxHeight * 0.1,
              child: FittedBox(
                child: SizedBox(
                  height: constr.maxHeight * 0.7,
                  width: constr.maxWidth * 0.6,
                  child: child,
                ),
              ),
            ),
            Image.asset(
              'assets/inception.png',
              fit: BoxFit.fitWidth,
            ),
          ],
        );
      },
    );
  }
}
