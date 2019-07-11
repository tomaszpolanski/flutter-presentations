import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/presentation.dart';

class Inception extends StatefulWidget {
  const Inception(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  _InceptionState createState() => _InceptionState();
}

class _InceptionState extends State<Inception> {
  PageStepper<int> _stateController;
  int _current = 1;

  @override
  void initState() {
    super.initState();
    final steps = List.generate(10, (i) => i + 1);
    _stateController = PageStepper<int>(
      controller: widget.controller,
      steps: steps,
    );
    for (final step in steps) {
      _stateController.add(
        fromStep: step,
        toStep: step + 1,
        forward: () => setState(() => _current = step + 1),
        reverse: () => setState(() => _current = step),
      );
    }

    _stateController
      ..add(
        fromStep: steps.length - 2,
        toStep: steps.length - 2,
        forward: widget.controller.nextSlide,
      )
      ..addListener(() => setState(() {}))
      ..build();
  }

  @override
  void dispose() {
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return repeat(const FlutterLogo(), 0, _current);
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
              left: constr.maxWidth * 0.10,
              top: constr.maxHeight * 0.18,
              child: FittedBox(
                child: SizedBox(
                  height: constr.maxHeight * 0.6,
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
