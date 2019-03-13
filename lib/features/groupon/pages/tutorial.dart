import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';
import 'package:flutter_presentations/shared/presentation_stepper.dart';
import 'package:mobile_flutter_merchant/features/groupon_dashboard/tutorial/tutorial_sections.dart';
import 'package:mobile_flutter_merchant/generated/i18n.dart';
import 'package:mobile_flutter_merchant/groupon_app.dart';

class TutorialGoal extends StatefulWidget {
  const TutorialGoal({Key key, this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  _TutorialGoalState createState() => _TutorialGoalState();
}

enum _TutorialStep {
  init,
  graph,
  next,
}

class _TutorialGoalState extends State<TutorialGoal>
    with SingleTickerProviderStateMixin {
  PageStepper<_TutorialStep> _stateController;
  AnimationController _controller;
  bool _showGraph = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _stateController = PageStepper<_TutorialStep>(
      controller: widget.controller,
      steps: _TutorialStep.values,
    )
      ..add(
        fromStep: _TutorialStep.init,
        toStep: _TutorialStep.graph,
        forward: () => setState(() => _showGraph = true),
        reverse: () => setState(() => _showGraph = false),
      )
      ..add(
        fromStep: _TutorialStep.graph,
        toStep: _TutorialStep.next,
        forward: () => widget.controller.next(),
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
          child: Center(
            child: Text(
              'Feature Reveal',
              textAlign: TextAlign.center,
              style: GTheme.big.copyWith(color: GTheme.flutter2),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset('assets/dashboard-graph.png'),
              AnimatedOpacity(
                opacity: _showGraph ? 0 : 1,
                duration: Duration(milliseconds: 500),
                child: Image.asset('assets/dashboard.png'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TutorialResult extends StatefulWidget {
  const TutorialResult({Key key, this.controller}) : super(key: key);
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
      duration: Duration(milliseconds: 500),
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
        forward: () => widget.controller.next(),
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
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  opacity: _showImage ? 1 : 0,
                  duration: Duration(milliseconds: 100),
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
                      duration: Duration(milliseconds: 100),
                      child: SizedBox(
                        width: 250,
                        child: applyTranslations(
                            Align(child: PerformanceTutorialDemo())),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
        Transform.translate(
          offset: Offset(0, 80),
          child: Row(
            children: <Widget>[
              Expanded(
                child: AnimatedOpacity(
                  opacity: _showImage ? 1 : 0,
                  duration: Duration(milliseconds: 100),
                  child: Text(
                    'Image',
                    style: TextStyle(color: GTheme.flutter2),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: AnimatedOpacity(
                  opacity: _showGraph ? 1 : 0,
                  duration: Duration(milliseconds: 100),
                  child: Text(
                    'Widget',
                    style: TextStyle(color: GTheme.flutter2),
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

Widget applyTranslations(
  Widget child, {
  Locale locale,
}) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: const [
      SkipDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    locale: locale,
    supportedLocales: S.delegate.supportedLocales,
    localeResolutionCallback: translationResolution(Locale('en', '')),
    home: child,
  );
}

class SkipTranslations extends S {
  const SkipTranslations() : super();

  @override
  String get revamped_tutorial_performance_description => '';

  @override
  String get revamped_tutorial_performance_title => '';
}

class SkipDelegate extends GeneratedLocalizationsDelegate {
  const SkipDelegate() : super();

  @override
  Future<S> load(Locale locale) => Future.value(SkipTranslations());
}
