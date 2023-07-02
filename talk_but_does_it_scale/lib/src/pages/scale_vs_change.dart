import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class ScaleVsChange extends StatefulWidget {
  const ScaleVsChange(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  State<ScaleVsChange> createState() => _ScaleVsChangeState();
}

enum _Step { scale, change, next }

class _ScaleVsChangeState extends State<ScaleVsChange>
    with SingleTickerProviderStateMixin {
  late PageStepper<_Step> _stateController;
  RevolvingState _revolvingState = RevolvingState.showFirst;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.scale,
        toStep: _Step.change,
        forward: () => setState(() {
          _revolvingState = RevolvingState.showSecond;
        }),
        reverse: () => setState(() {
          _revolvingState = RevolvingState.showFirst;
        }),
      )
      ..add(
        fromStep: _Step.change,
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
    final revolving = _revolvingState;
    return Stack(
      fit: StackFit.expand,
      children: [
        Center(
          child: DefaultTextStyle.merge(
            style: GTheme.big.copyWith(fontSize: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DefaultTextStyle.merge(
                  style: const TextStyle(color: GTheme.flutter3),
                  child: RevolvingWidget(
                    firstChild: const Stack(
                      children: [
                        Text('Scale'),
                        Opacity(
                          opacity: 0,
                          child: Text('Change'),
                        ),
                      ],
                    ),
                    secondChild: const Text('Change'),
                    state: revolving,
                  ),
                ),
                const Text(
                  'All',
                  style: TextStyle(color: GTheme.flutter2),
                ),
              ],
            ),
          ),
        ),
        FadeInWidget(
          child: Center(
            child: _Rotate(
              first: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text('!'),
              ),
              second: const Text('='),
              state: revolving,
            ),
          ),
        ),
      ],
    );
  }
}

class _Rotate extends StatelessWidget {
  const _Rotate({
    super.key,
    required this.state,
    required this.first,
    required this.second,
  });

  final Widget first;
  final Widget second;
  final RevolvingState state;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: const TextStyle(color: GTheme.flutter3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultTextStyle.merge(
            style: const TextStyle(color: GTheme.flutter3),
            child: RevolvingWidget(
              firstChild: Stack(
                children: [
                  first,
                  Opacity(
                    opacity: 0,
                    child: second,
                  ),
                ],
              ),
              secondChild: second,
              state: state,
            ),
          ),
          DefaultTextStyle.merge(
            style: const TextStyle(color: GTheme.flutter2),
            child: second,
          ),
        ],
      ),
    );
  }
}
