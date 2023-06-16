import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class EmbraceChange extends StatefulWidget {
  const EmbraceChange(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  State<EmbraceChange> createState() => _EmbraceChangeState();
}

enum _Step { init, decoded, encoded, next }

class _EmbraceChangeState extends State<EmbraceChange>
    with SingleTickerProviderStateMixin {
  late PageStepper<_Step> _stateController;
  RevolvingState? _revolvingState;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.decoded,
        forward: () => setState(() {
          _revolvingState = RevolvingState.showFirst;
        }),
        reverse: () => setState(() {
          _revolvingState = null;
        }),
      )
      ..add(
        fromStep: _Step.decoded,
        toStep: _Step.encoded,
        forward: () => setState(() {
          _revolvingState = RevolvingState.showSecond;
        }),
        reverse: () => setState(() {
          _revolvingState = RevolvingState.showFirst;
        }),
      )
      ..add(
        fromStep: _Step.encoded,
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
    final state = _revolvingState ?? RevolvingState.showFirst;
    return FadeInVisibility(
      visible: _revolvingState != null,
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: GTheme.flutter3),
        textAlign: TextAlign.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RevolvingWidget(
                alignment: AlignmentDirectional.center,
                firstChild: const Text('7h3 M345UR3'),
                secondChild: const Text('The Measure'),
                state: state,
              ),
              RevolvingWidget(
                alignment: AlignmentDirectional.center,
                firstChild: const Text('0F 1N73LL163NC3'),
                secondChild: const Text('of Intelligence'),
                state: state,
              ),
              RevolvingWidget(
                alignment: AlignmentDirectional.center,
                firstChild: const Text('15 7H3 481L17Y'),
                secondChild: const Text('is the Ability'),
                state: state,
              ),
              RevolvingWidget(
                alignment: AlignmentDirectional.center,
                firstChild: const Text('70 CH4N63'),
                secondChild: const Text('to Change'),
                state: state,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40, top: 50),
                  child: RevolvingWidget(
                    firstChild: const Text(
                      '4L83R7 31N5731N',
                      style: TextStyle(color: GTheme.flutter2),
                    ),
                    secondChild: const Text(
                      'Albert Einstein',
                      style: TextStyle(color: GTheme.flutter2),
                    ),
                    state: state,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
