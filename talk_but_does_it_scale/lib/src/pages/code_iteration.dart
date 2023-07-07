import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class CodeIteration extends StatefulWidget {
  const CodeIteration(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  State<CodeIteration> createState() => _CodeIterationState();
}

enum _Step { init, bash, dart, next }

class _CodeIterationState extends State<CodeIteration>
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
        toStep: _Step.bash,
        forward: () => setState(() {
          _revolvingState = RevolvingState.showFirst;
        }),
        reverse: () => setState(() {
          _revolvingState = null;
        }),
      )
      ..add(
        fromStep: _Step.bash,
        toStep: _Step.dart,
        forward: () => setState(() {
          _revolvingState = RevolvingState.showSecond;
        }),
        reverse: () => setState(() {
          _revolvingState = RevolvingState.showFirst;
        }),
      )
      ..add(
        fromStep: _Step.dart,
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
      title: const Text('Bash vs Dart'),
      child: FadeInVisibility(
        visible: _revolvingState != null,
        child: DefaultTextStyle.merge(
          style: const TextStyle(
            color: GTheme.flutter3,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.left,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RevolvingWidget(
                  alignment: AlignmentDirectional.centerStart,
                  firstChild: const Text('# Bash'),
                  secondChild: const Text('// Dart'),
                  state: state,
                ),
                RevolvingWidget(
                  alignment: AlignmentDirectional.centerStart,
                  firstChild: const Text(
                    r'for t in $TEXTS; do        ',
                  ),
                  secondChild: const Text(r'for (final t in texts) {'),
                  state: state,
                ),
                RevolvingWidget(
                  alignment: AlignmentDirectional.centerStart,
                  firstChild: const Text(r'  echo "Text is $t"'),
                  secondChild: const Text(r"  print('Text is $t');"),
                  state: state,
                ),
                RevolvingWidget(
                  alignment: AlignmentDirectional.centerStart,
                  firstChild: const Text('done'),
                  secondChild: const Text('}'),
                  state: state,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
