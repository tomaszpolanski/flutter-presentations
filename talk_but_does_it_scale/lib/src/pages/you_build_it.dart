import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class YouBuildIt extends StatefulWidget {
  const YouBuildIt(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  State<YouBuildIt> createState() => _YouBuildItState();
}

enum _Step { init, test_and_deploy, next }

class _YouBuildItState extends State<YouBuildIt>
    with SingleTickerProviderStateMixin {
  late PageStepper<_Step> _stateController;
  bool _showTestAndDeploy = false;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.test_and_deploy,
        forward: () => setState(() {
          _showTestAndDeploy = true;
        }),
        reverse: () => setState(() {
          _showTestAndDeploy = false;
        }),
      )
      ..add(
        fromStep: _Step.test_and_deploy,
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
      title: const Text('"You Build It, you run it"'),
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
                  'you test it, you deploy it',
                  visible: _showTestAndDeploy,
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
