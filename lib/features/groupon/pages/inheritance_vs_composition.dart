import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';
import 'package:flutter_presentations/shared/presentation_stepper.dart';

const size = 100.0;

class InheritanceVsComposition extends StatefulWidget {
  const InheritanceVsComposition({Key key, this.controller}) : super(key: key);

  final PresentationController controller;

  @override
  _InheritanceVsCompositionState createState() =>
      _InheritanceVsCompositionState();
}

enum _Step {
  init,
  inheritance,
  composition,
  next,
}

class _InheritanceVsCompositionState extends State<InheritanceVsComposition> {
  PageStepper<_Step> _stateController;
  _Controller _inheritanceController;
  _Controller _compositionController;

  @override
  void initState() {
    super.initState();
    _inheritanceController = _Controller();
    _compositionController = _Controller();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.inheritance,
        forward: () => _inheritanceController.forward(),
        reverse: () => _inheritanceController.reverse(),
      )
      ..add(
        fromStep: _Step.inheritance,
        toStep: _Step.composition,
        forward: () => _compositionController.forward(),
        reverse: () => _compositionController.reverse(),
      )
      ..add(
        fromStep: _Step.composition,
        toStep: _Step.next,
        forward: () => widget.controller.next(),
      )
      ..build();
  }

  @override
  void dispose() {
    _stateController.dispose();
    _compositionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Text(
              'Inheritance vs Composition',
              style: GTheme.big.copyWith(color: GTheme.flutter3),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: _Inheritance(
                controller: _inheritanceController,
              ),
            ),
            Expanded(
              child: _Composition(
                controller: _compositionController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Inheritance extends StatefulWidget {
  const _Inheritance({Key key, this.controller}) : super(key: key);
  final _Controller controller;

  @override
  __InheritanceState createState() => __InheritanceState();
}

class __InheritanceState extends State<_Inheritance>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    widget.controller.addListeners(
      () => _controller.forward(),
      () => _controller.reverse(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: _AnimatedInheritance(
        animation: CurvedAnimation(
          parent: _controller,
          curve: Interval(0.0, 0.3, curve: Curves.ease),
        ),
        child: Container(
          width: size * 5,
          height: size * 4,
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: Colors.black),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: _AnimatedInheritance(
              animation: CurvedAnimation(
                parent: _controller,
                curve: Interval(0.3, 0.6, curve: Curves.ease),
              ),
              child: Container(
                width: size * 4,
                height: size * 4,
                margin: EdgeInsets.all(size * 0.2),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.black),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: _AnimatedInheritance(
                    animation: CurvedAnimation(
                      parent: _controller,
                      curve: Interval(0.6, 1, curve: Curves.ease),
                    ),
                    child: Container(
                      width: size * 3,
                      height: size * 3,
                      margin: EdgeInsets.all(size * 0.2),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedInheritance extends StatelessWidget {
  const _AnimatedInheritance({Key key, this.animation, this.child})
      : super(key: key);
  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}

class _Composition extends StatefulWidget {
  const _Composition({Key key, this.controller}) : super(key: key);
  final _Controller controller;

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
      duration: Duration(seconds: 2),
    );
    widget.controller.addListeners(
      () => _controller.forward(),
      () => _controller.reverse(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size * 5,
        height: size * 4,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              child: _AnimatedPosition(
                animation: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.7, 1, curve: Curves.ease),
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
                  curve: Interval(0.6, 0.9, curve: Curves.ease),
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
                  curve: Interval(0.5, 0.8, curve: Curves.ease),
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
                  curve: Interval(0.3, 0.7, curve: Curves.ease),
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
                  curve: Interval(0.0, 0.4, curve: Curves.ease),
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
        return FadeTransition(
          opacity: animation,
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

class _Controller {
  VoidCallback _forward;
  VoidCallback _reverse;

  void addListeners(VoidCallback forward, VoidCallback reverse) {
    _forward = forward;
    _reverse = reverse;
  }

  void dispose() {
    _forward = null;
    _reverse = null;
  }

  void forward() => _forward();

  void reverse() => _reverse();
}
