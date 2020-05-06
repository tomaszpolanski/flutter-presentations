import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/shared/clippers.dart';
import 'package:presentation/effects.dart';
import 'package:presentation/presentation.dart';

class TutorialGoal extends StatefulWidget {
  const TutorialGoal(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  _TutorialGoalState createState() => _TutorialGoalState();
}

enum _TutorialStep {
  init,
  graph,
  tutorial,
  next,
}

class _TutorialGoalState extends State<TutorialGoal>
    with SingleTickerProviderStateMixin {
  PageStepper<_TutorialStep> _stateController;
  AnimationController _controller;
  bool _showTutorial = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _stateController = PageStepper<_TutorialStep>(
      controller: widget.controller,
      steps: _TutorialStep.values,
    )
      ..add(
        fromStep: _TutorialStep.init,
        toStep: _TutorialStep.graph,
        forward: _controller.forward,
        reverse: _controller.reverse,
      )
      ..add(
        fromStep: _TutorialStep.graph,
        toStep: _TutorialStep.tutorial,
        forward: () => setState(() => _showTutorial = true),
        reverse: () => setState(() => _showTutorial = false),
      )
      ..add(
        fromStep: _TutorialStep.tutorial,
        toStep: _TutorialStep.next,
        forward: widget.controller.nextSlide,
      )
      ..build();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ParallaxWidget(
            child: Center(
              child: _showTutorial
                  ? Image.asset('assets/new.png')
                  : Text(
                      'Feature Reveal',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6,
                    ),
            ),
          ),
        ),
        Expanded(
          child: WrappedAnimatedBuilder<Rect>(
            animation: RectTween(
              begin: const Rect.fromLTRB(0, 0, 1, 1),
              end: const Rect.fromLTRB(0, 0.31, 1, 0.61),
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: Curves.easeOut,
            )),
            builder: (_, animation, child) {
              return ClipRect(
                clipper: ClipperRect(animation.value),
                child: child,
              );
            },
            child: Image.asset('assets/dashboard.png'),
          ),
        ),
      ],
    );
  }
}

class TutorialResult extends StatefulWidget {
  const TutorialResult(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  _TutorialResultState createState() => _TutorialResultState();
}

enum _Step {
  init,
  image,
  graph,
  next,
}

class _TutorialResultState extends State<TutorialResult>
    with SingleTickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  AnimationController _controller;
  bool _showImage = false;
  bool _showGraph = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.image,
        forward: () => setState(() => _showImage = true),
        reverse: () => setState(() => _showImage = false),
      )
      ..add(
        fromStep: _Step.image,
        toStep: _Step.graph,
        forward: () => setState(() => _showGraph = true),
        reverse: () => setState(() => _showGraph = false),
      )
      ..add(
        fromStep: _Step.graph,
        toStep: _Step.next,
        forward: () => widget.controller.nextSlide(),
      )
      ..build();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Align(
                child: AnimatedOpacity(
                  opacity: _showImage ? 1 : 0,
                  duration: const Duration(milliseconds: 100),
                  child: Image.asset(
                    'assets/performance.png',
                    width: 245,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _showGraph
                  ? AnimatedOpacity(
                      opacity: _showGraph ? 1 : 0,
                      duration: const Duration(milliseconds: 100),
                      child: const SizedBox(
                        width: 250,
                        child: Placeholder(),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
        Transform.translate(
          offset: const Offset(0, 80),
          child: Row(
            children: [
              Expanded(
                child: AnimatedOpacity(
                  opacity: _showImage ? 1 : 0,
                  duration: const Duration(milliseconds: 100),
                  child: Text(
                    'Image',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: AnimatedOpacity(
                  opacity: _showGraph ? 1 : 0,
                  duration: const Duration(milliseconds: 100),
                  child: Text(
                    'Widget',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
