import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class CiTricks extends StatefulWidget {
  const CiTricks(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  State<CiTricks> createState() => _CiTricksState();
}

enum _Step { init, selective_build, shards, next }

class _CiTricksState extends State<CiTricks>
    with SingleTickerProviderStateMixin {
  late PageStepper<_Step> _stateController;
  bool _showSelectiveBuild = false;
  bool _showSharding = false;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.selective_build,
        forward: () => setState(() {
          _showSelectiveBuild = true;
        }),
        reverse: () => setState(() {
          _showSelectiveBuild = false;
        }),
      )
      ..add(
        fromStep: _Step.selective_build,
        toStep: _Step.shards,
        forward: () => setState(() {
          _showSharding = true;
        }),
        reverse: () => setState(() {
          _showSharding = false;
        }),
      )
      ..add(
        fromStep: _Step.shards,
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
    return FadeInVisibility(
      visible: true,
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: GTheme.flutter3),
        textAlign: TextAlign.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _Stage(
                'Selective builds',
                visible: _showSelectiveBuild,
              ),
              _Stage(
                'Sharding',
                visible: _showSharding,
              ),
            ],
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
