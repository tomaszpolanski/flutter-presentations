import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:talk_effort_reuse/src/images.dart';

class Reark extends StatefulWidget {
  const Reark({super.key, required this.controller});

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
  late PageStepper<_Step> _stateController;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.reakt,
        forward: _controller.forward,
        reverse: _controller.reverse,
      )
      ..add(
        fromStep: _Step.reakt,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
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
    final animation = _controller.drive(CurveTween(curve: Curves.ease));
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerRight,
          image: AssetImage(
            Images.reark,
            package: Images.package,
          ),
        ),
      ),
      child: AnimatedBuilder(
        builder: (_, child) {
          return FractionalTranslation(
            translation: Offset(animation.value - 1, 0),
            child: child,
          );
        },
        animation: animation,
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(20),
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
