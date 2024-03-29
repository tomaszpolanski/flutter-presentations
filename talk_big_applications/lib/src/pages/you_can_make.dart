import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class YouCanMake extends StatefulWidget {
  const YouCanMake({
    this.controller,
    super.key,
  });

  final PresentationController? controller;

  @override
  _YouCanMakeState createState() => _YouCanMakeState();
}

enum _Step {
  init,
  flutter,
  next,
}

class _YouCanMakeState extends State<YouCanMake>
    with SingleTickerProviderStateMixin {
  PageStepper<_Step>? _stateController;
  RevolvingState _revolvingState = RevolvingState.showFirst;

  @override
  void initState() {
    super.initState();
    final controller = widget.controller;
    if (controller != null) {
      _stateController = PageStepper<_Step>(
        controller: controller,
        steps: _Step.values,
      )
        ..add(
          fromStep: _Step.init,
          toStep: _Step.flutter,
          forward: () => setState(() {
            _revolvingState = RevolvingState.showSecond;
          }),
          reverse: () => setState(() {
            _revolvingState = RevolvingState.showFirst;
          }),
        )
        ..add(
          fromStep: _Step.flutter,
          toStep: _Step.next,
          forward: controller.nextSlide,
        )
        ..build();
    }
  }

  @override
  void dispose() {
    _stateController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: DefaultTextStyle.merge(
          style: Theme.of(context).textTheme.bodyMedium,
          child: Text.rich(
            TextSpan(
              children: <InlineSpan>[
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild: const Text('Can you'),
                      secondChild: const Text('You can'),
                      state: _revolvingState,
                    ),
                  ),
                ),
                const TextSpan(text: ' make large Flutter apps'),
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild: const Text('?'),
                      secondChild: const Text('!'),
                      state: _revolvingState,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
