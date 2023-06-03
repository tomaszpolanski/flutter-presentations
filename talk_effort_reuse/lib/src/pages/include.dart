import 'package:flutter/material.dart';

import 'package:presentation/presentation.dart';
import 'package:shared_ui/shared_ui.dart';
import 'package:talk_effort_reuse/src/images.dart';

class IncludeFlutter extends StatefulWidget {
  const IncludeFlutter(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  _IncludeFlutterState createState() => _IncludeFlutterState();
}

enum _Step { init, main, yaml, build, next }

class _IncludeFlutterState extends State<IncludeFlutter>
    with SingleTickerProviderStateMixin {
  late PageStepper<_Step> _stateController;
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
            child: Image.asset(
              Images.main,
              package: Images.package,
            ),
          ),
          _OpacitySlideIn(
            visible: _yaml,
            child: Image.asset(
              Images.yaml,
              package: Images.package,
            ),
          ),
          _OpacitySlideIn(
            visible: _build,
            child: Image.asset(
              Images.build,
              package: Images.package,
            ),
          ),
        ],
      ),
    );
  }
}

class _OpacitySlideIn extends StatelessWidget {
  const _OpacitySlideIn({
    super.key,
    this.visible = false,
    required this.child,
  });

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
