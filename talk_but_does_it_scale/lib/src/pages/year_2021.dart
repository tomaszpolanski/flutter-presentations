import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class Year2021 extends StatefulWidget {
  const Year2021(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  State<Year2021> createState() => _Year2021State();
}

enum _Step { devs, files, tests, next }

class _Year2021State extends State<Year2021>
    with SingleTickerProviderStateMixin {
  late PageStepper<_Step> _stateController;
  bool _showDartFiles = false;
  bool _showTestFiles = false;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.devs,
        toStep: _Step.files,
        forward: () => setState(() {
          _showDartFiles = true;
        }),
        reverse: () => setState(() {
          _showDartFiles = false;
        }),
      )
      ..add(
        fromStep: _Step.files,
        toStep: _Step.tests,
        forward: () => setState(() {
          _showTestFiles = true;
        }),
        reverse: () => setState(() {
          _showTestFiles = false;
        }),
      )
      ..add(
        fromStep: _Step.tests,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const _Stage('4 👨‍💻', visible: true),
          _Stage('430 dart files', visible: _showDartFiles),
          _Stage('14 test files', visible: _showTestFiles),
        ],
      ),
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
