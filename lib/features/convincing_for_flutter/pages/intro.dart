import 'package:flutter/material.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';
import 'package:flutter_presentations/shared/presentation_stepper.dart';

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        new Align(
          alignment: Alignment.centerLeft,
          child: new Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'Convincing your company to Flutter',
                  style: Theme.of(context).textTheme.display2.copyWith(
                      color: const Color(0xFF6AA84F),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        new Align(
          alignment: Alignment.bottomRight,
          child: new Padding(
            padding: const EdgeInsets.only(right: 18.0, bottom: 18.0),
            child: new DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text(
                    'Tomek Polański',
                    style: new TextStyle(color: Colors.black),
                  ),
                  new Text(
                    'GROUPON',
                    style: new TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PopularityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/popularity.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

enum _Step {
  init,
  uiq,
  uiqFade,
  symbian,
  symbianFade,
  blackBerry,
  blackBerryFade,
  qt,
  qtFade,
  windows,
  windowsFade,
  apple,
  android,
  fuchsia,
  next,
}

class PlatformsPage extends StatefulWidget {
  final PresentationController controller;

  const PlatformsPage(this.controller, {Key key}) : super(key: key);

  @override
  _PlatformsPageState createState() => _PlatformsPageState();
}

class _PlatformsPageState extends State<PlatformsPage>
    with TickerProviderStateMixin {
  PageStepper<_Step> stateController;

  double _uiq = 0.0;
  double _symbian = 0.0;
  double _blackberry = 0.0;
  double _qt = 0.0;
  double _windows = 0.0;
  double _apple = 0.0;
  double _android = 0.0;
  double _fuchsia = 0.0;

  @override
  void initState() {
    super.initState();
    stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..addStep(_Step.init, _Step.uiq, () => setState(() => _uiq = 1.0))
      ..addStep(_Step.uiq, _Step.uiqFade, () => setState(() => _uiq = 0.2))
      ..addStep(
          _Step.uiqFade, _Step.symbian, () => setState(() => _symbian = 1.0))
      ..addStep(_Step.symbian, _Step.symbianFade,
          () => setState(() => _symbian = 0.2))
      ..addStep(_Step.symbianFade, _Step.blackBerry,
          () => setState(() => _blackberry = 1.0))
      ..addStep(_Step.blackBerry, _Step.blackBerryFade,
          () => setState(() => _blackberry = 0.2))
      ..addStep(_Step.blackBerryFade, _Step.qt, () => setState(() => _qt = 1.0))
      ..addStep(_Step.qt, _Step.qtFade, () => setState(() => _qt = 0.2))
      ..addStep(
          _Step.qtFade, _Step.windows, () => setState(() => _windows = 1.0))
      ..addStep(_Step.windows, _Step.windowsFade,
          () => setState(() => _windows = 0.2))
      ..addStep(
          _Step.windowsFade, _Step.apple, () => setState(() => _apple = 1.0))
      ..addStep(
          _Step.apple, _Step.android, () => setState(() => _android = 1.0))
      ..addStep(
          _Step.android, _Step.fuchsia, () => setState(() => _fuchsia = 0.02))
      ..addStep(_Step.fuchsia, _Step.next, () => widget.controller.next())
      ..build();
  }

  @override
  void dispose() {
    stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: stateController.next,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: _uiq,
                    child: Image(image: AssetImage('assets/Uiq-logo.png')),
                  ),
                  AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: _symbian,
                      child: Image(image: AssetImage('assets/S60.png'))),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: _blackberry,
                    child: Image(image: AssetImage('assets/blackberry.png')),
                  ),
                  AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: _qt,
                      child: Image(image: AssetImage('assets/qt.png'))),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: _windows,
                      child: Image(image: AssetImage('assets/windows.png'))),
                  AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: _apple,
                      child: Image(image: AssetImage('assets/apple.png'))),
                  AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: _android,
                      child: Image(image: AssetImage('assets/android.png'))),
                  AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: _fuchsia,
                      child: Image(
                        color: Colors.grey,
                        image: AssetImage('assets/fusia.png'),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
