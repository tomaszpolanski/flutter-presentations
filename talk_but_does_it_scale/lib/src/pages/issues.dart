import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class Issues extends StatefulWidget {
  const Issues(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  State<Issues> createState() => _IssuesState();
}

enum _Step { init, issues, next }

class _IssuesState extends State<Issues> with SingleTickerProviderStateMixin {
  late PageStepper<_Step> _stateController;
  bool _showIssues = false;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.issues,
        forward: () => setState(() {
          _showIssues = true;
        }),
        reverse: () => setState(() {
          _showIssues = false;
        }),
      )
      ..add(
        fromStep: _Step.issues,
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
    return TitledPage(
      title: const Text('Issues'),
      child: FadeInVisibility(
        visible: true,
        child: DefaultTextStyle.merge(
          style: const TextStyle(color: GTheme.flutter3),
          textAlign: TextAlign.center,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Stage(
                  'Analyzer',
                  visible: _showIssues,
                ),
              ],
            ),
          ),
        ),
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
