import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';
import 'package:flutter_presentations/shared/presentation_stepper.dart';

class Reark extends StatefulWidget {
  const Reark({Key key, this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  _RearkState createState() => _RearkState();
}

enum _Step {
  init,
  reakt,
  next,
}

class _RearkState extends State<Reark> with SingleTickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.reakt,
        forward: () => _controller.forward(),
        reverse: () => _controller.reverse(),
      )
      ..add(
        fromStep: _Step.reakt,
        toStep: _Step.next,
        forward: () => widget.controller.next(),
      )
      ..build();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = _controller.drive(CurveTween(curve: Curves.bounceIn));
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerRight,
          image: AssetImage('assets/reark.png'),
        ),
      ),
      child: AnimatedBuilder(
        builder: (_, child) {
          return Transform.translate(
            offset: Offset((animation.value - 1) * 300, 0),
            child: child,
          );
        },
        animation: animation,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Reark',
              style: TextStyle(color: GTheme.flutter3),
            ),
          ),
        ),
      ),
    );
  }
}
