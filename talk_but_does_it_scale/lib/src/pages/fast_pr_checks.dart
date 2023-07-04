import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class FastPrChecks extends StatefulWidget {
  const FastPrChecks(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  State<FastPrChecks> createState() => _FastPrChecksState();
}

enum _Step { init, hidden, revealed, next }

class _FastPrChecksState extends State<FastPrChecks>
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
        toStep: _Step.hidden,
        forward: () => setState(() {
          _revolvingState = RevolvingState.showFirst;
        }),
        reverse: () => setState(() {
          _revolvingState = null;
        }),
      )
      ..add(
        fromStep: _Step.hidden,
        toStep: _Step.revealed,
        forward: () => setState(() {
          _revolvingState = RevolvingState.showSecond;
        }),
        reverse: () => setState(() {
          _revolvingState = RevolvingState.showFirst;
        }),
      )
      ..add(
        fromStep: _Step.revealed,
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
    return TitledPage(
      title: const Text('Fast PR Checks'),
      child: FadeInVisibility(
        visible: _revolvingState != null,
        child: DefaultTextStyle.merge(
          style: const TextStyle(color: GTheme.flutter2),
          textAlign: TextAlign.center,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('under '),
                RevolvingWidget(
                  alignment: AlignmentDirectional.center,
                  firstChild: const Text('X'),
                  secondChild: const Text(
                    '5',
                    style: TextStyle(color: GTheme.flutter3),
                  ),
                  state: state,
                ),
                const Text(' minutes'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
