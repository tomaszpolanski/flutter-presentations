import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class SpeakersIntro extends StatefulWidget {
  const SpeakersIntro(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  State<SpeakersIntro> createState() => _SpeakersIntroState();
}

enum _Step { init, tomek, pawel, notEqual, greaterOrEqual, next }

class _SpeakersIntroState extends State<SpeakersIntro>
    with SingleTickerProviderStateMixin {
  late PageStepper<_Step> _stateController;
  RevolvingState? _revolvingState;
  bool _showTomek = false;
  bool _showPawel = false;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.tomek,
        forward: () => setState(() {
          _showTomek = true;
        }),
        reverse: () => setState(() {
          _showTomek = false;
        }),
      )
      ..add(
        fromStep: _Step.tomek,
        toStep: _Step.pawel,
        forward: () => setState(() {
          _showPawel = true;
        }),
        reverse: () => setState(() {
          _showPawel = false;
        }),
      )
      ..add(
        fromStep: _Step.pawel,
        toStep: _Step.notEqual,
        forward: () => setState(() {
          _revolvingState = RevolvingState.showFirst;
        }),
        reverse: () => setState(() {
          _revolvingState = null;
        }),
      )
      ..add(
        fromStep: _Step.notEqual,
        toStep: _Step.greaterOrEqual,
        forward: () => setState(() {
          _revolvingState = RevolvingState.showSecond;
        }),
        reverse: () => setState(() {
          _revolvingState = RevolvingState.showFirst;
        }),
      )
      ..add(
        fromStep: _Step.greaterOrEqual,
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
                FadeInVisibility(
                  visible: _showTomek,
                  child: const Text(
                    'Tomek',
                    style: TextStyle(color: GTheme.flutter3),
                  ),
                ),
                FadeInVisibility(
                  visible: _showPawel,
                  child: const Text(
                    'Paweł',
                    style: TextStyle(color: GTheme.flutter2),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (revolving != null)
          FadeInWidget(
            child: Center(
              child: _Equality(
                state: revolving,
              ),
            ),
          ),
      ],
    );
  }
}

class _Equality extends StatelessWidget {
  const _Equality({
    super.key,
    required this.state,
  });

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
              firstChild: const Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('!'),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Text('>'),
                  ),
                ],
              ),
              secondChild: const Text('>'),
              state: state,
            ),
          ),
          const Text('=', style: TextStyle(color: GTheme.flutter2)),
        ],
      ),
    );
  }
}
