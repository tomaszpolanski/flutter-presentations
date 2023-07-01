import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class MoreCodeMoreProblems extends StatefulWidget {
  const MoreCodeMoreProblems(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  State<MoreCodeMoreProblems> createState() => _MoreCodeMoreProblemsState();
}

enum _Step { devs, code, problems, next }

class _MoreCodeMoreProblemsState extends State<MoreCodeMoreProblems>
    with SingleTickerProviderStateMixin {
  late PageStepper<_Step> _stateController;
  bool _showCode = false;
  bool _showProblems = false;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.devs,
        toStep: _Step.code,
        forward: () => setState(() {
          _showCode = true;
        }),
        reverse: () => setState(() {
          _showCode = false;
        }),
      )
      ..add(
        fromStep: _Step.code,
        toStep: _Step.problems,
        forward: () => setState(() {
          _showProblems = true;
        }),
        reverse: () => setState(() {
          _showProblems = false;
        }),
      )
      ..add(
        fromStep: _Step.problems,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..build();
  }

  @override
  void dispose() {
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: GTheme.big.copyWith(fontSize: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const _Stage('Devs', visible: true),
          _Arrow(visible: _showCode),
          _Stage('Code', visible: _showCode),
          _Arrow(visible: _showProblems),
          _Stage('Problems', visible: _showProblems),
        ],
      ),
    );
  }
}

class _Arrow extends StatelessWidget {
  const _Arrow({super.key, required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return _Stage(
      '➡',
      visible: visible,
      style: const TextStyle(color: GTheme.flutter2, fontSize: 30),
    );
  }
}

class _Stage extends StatelessWidget {
  const _Stage(
    this.data, {
    super.key,
    required this.visible,
    this.style,
  });

  final String data;
  final bool visible;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return FadeInVisibility(
      visible: visible,
      child: Text(
        data,
        style: style ?? const TextStyle(color: GTheme.flutter3),
      ),
    );
  }
}
