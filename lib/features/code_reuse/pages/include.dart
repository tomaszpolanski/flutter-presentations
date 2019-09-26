import 'package:flutter/material.dart';
import 'package:flutter_presentations/shared/animated_slide_in.dart';
import 'package:presentation/presentation.dart';

class IncludeFlutter extends StatefulWidget {
  const IncludeFlutter(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  _IncludeFlutterState createState() => _IncludeFlutterState();
}

enum _Step { init, main, yaml, build, next }

class _IncludeFlutterState extends State<IncludeFlutter>
    with SingleTickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  bool _main = false;
  bool _yaml = false;
  bool _build = false;

  @override
  void initState() {
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.main,
        forward: () => setState(() => _main = true),
        reverse: () => setState(() => _main = false),
      )
      ..add(
        fromStep: _Step.main,
        toStep: _Step.yaml,
        forward: () => setState(() => _yaml = true),
        reverse: () => setState(() => _yaml = false),
      )
      ..add(
        fromStep: _Step.yaml,
        toStep: _Step.build,
        forward: () => setState(() => _build = true),
        reverse: () => setState(() => _build = false),
      )
      ..add(
        fromStep: _Step.build,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..build();
    super.initState();
  }

  @override
  void dispose() {
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 60),
      color: const Color(0xFF2B2B2B),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _OpacitySlideIn(
            visible: _main,
            child: Image.asset('assets/main.png'),
          ),
          _OpacitySlideIn(
            visible: _yaml,
            child: Image.asset('assets/yaml.png'),
          ),
          _OpacitySlideIn(
            visible: _build,
            child: Image.asset('assets/build.png'),
          ),
        ],
      ),
    );
  }
}

class _OpacitySlideIn extends StatelessWidget {
  const _OpacitySlideIn({
    Key key,
    this.visible = false,
    @required this.child,
  }) : super(key: key);

  final bool visible;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: visible ? 1 : 0,
      child: AnimatedSlideIn(
        position: visible ? const Offset(0, 0) : const Offset(-0.2, 0),
        duration: const Duration(milliseconds: 300),
        child: child,
      ),
    );
  }
}
