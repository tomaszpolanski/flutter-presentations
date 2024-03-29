import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class WidgetIsFunction extends StatefulWidget {
  const WidgetIsFunction(
    this.controller, {
    super.key,
  });
  final PresentationController controller;

  @override
  _WidgetIsFunctionState createState() => _WidgetIsFunctionState();
}

enum _Step {
  init,
  flutter,
  next,
}

class _WidgetIsFunctionState extends State<WidgetIsFunction>
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: DefaultTextStyle.merge(
          style: Theme.of(context).textTheme.bodyMedium,
          child: Text.rich(
            TextSpan(
              children: <InlineSpan>[
                const TextSpan(text: 'A '),
                WidgetSpan(
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: GTheme.flutter3),
                    child: RevolvingWidget(
                      firstChild: const Text('function'),
                      secondChild: const Text(
                        ' widget',
                      ),
                      state: _revolvingState,
                    ),
                  ),
                ),
                const TextSpan(
                  text: ' should do one thing, \nit should do it well,'
                      '\nand it should do it only.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
