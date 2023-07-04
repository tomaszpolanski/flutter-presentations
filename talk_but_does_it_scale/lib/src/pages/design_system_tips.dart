import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class DesignSystemTips extends StatefulWidget {
  const DesignSystemTips(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  State<DesignSystemTips> createState() => _DesignSystemTipsState();
}

enum _Step {
  do_not_reinvent_wheel,
  avoid_exceptions,
  keep_it_simple,
  all_aboard,
  next,
}

class _DesignSystemTipsState extends State<DesignSystemTips>
    with SingleTickerProviderStateMixin {
  late PageStepper<_Step> _stateController;

  final _showMap = <_Step, bool>{};

  @override
  void initState() {
    super.initState();

    _showMap[_Step.do_not_reinvent_wheel] = true;

    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.do_not_reinvent_wheel,
        toStep: _Step.avoid_exceptions,
        forward: () => setState(() {
          _showMap[_Step.avoid_exceptions] = true;
        }),
        reverse: () => setState(() {
          _showMap[_Step.avoid_exceptions] = false;
        }),
      )
      ..add(
        fromStep: _Step.avoid_exceptions,
        toStep: _Step.keep_it_simple,
        forward: () => setState(() {
          _showMap[_Step.keep_it_simple] = true;
        }),
        reverse: () => setState(() {
          _showMap[_Step.keep_it_simple] = false;
        }),
      )
      ..add(
        fromStep: _Step.keep_it_simple,
        toStep: _Step.all_aboard,
        forward: () => setState(() {
          _showMap[_Step.all_aboard] = true;
        }),
        reverse: () => setState(() {
          _showMap[_Step.all_aboard] = false;
        }),
      )
      ..add(
        fromStep: _Step.all_aboard,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..build();
  }

  @override
  void dispose() {
    _stateController.dispose();
    _showMap.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: GTheme.big.copyWith(fontSize: 80),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _Stage(
              "🛞 Don't reinvent the wheel",
              visible: _showMap[_Step.do_not_reinvent_wheel] ?? false,
            ),
            _Stage(
              '❗ Avoid exceptions',
              visible: _showMap[_Step.avoid_exceptions] ?? false,
            ),
            _Stage(
              '🤯 Avoid complex components',
              visible: _showMap[_Step.keep_it_simple] ?? false,
            ),
            _Stage(
              '🚂 All aboard!',
              visible: _showMap[_Step.all_aboard] ?? false,
            ),
          ],
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
