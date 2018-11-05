import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/page_transformer.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';
import 'package:flutter_presentations/shared/presentation_stepper.dart';
import 'package:flutter_presentations/shared/slide_effects.dart';

class TitlePage extends StatelessWidget {
  final PageVisibility pageVisibility;

  const TitlePage({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: new Stack(
        children: [
          DefaultTextStyle(
            style: GTheme.big,
            child: new Align(
              alignment: Alignment.centerLeft,
              child: new Padding(
                padding: const EdgeInsets.only(left: 80.0),
                child: new Wrap(
                  children: [
                    Text('Convincing your '),
                    Text('company to '),
                    ParallaxWidget(
                      pageVisibility: pageVisibility,
                      child: Row(
                        children: const [
                          Image(
                            image: AssetImage('assets/image4.png'),
                            height: 60.0,
                          ),
                          Text('lutter'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ParallaxWidget(
              pageVisibility: pageVisibility,
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0, bottom: 18.0),
                child: DefaultTextStyle.merge(
                  style: GTheme.smaller.copyWith(color: Colors.white),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Tomek Polański',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'GROUPON',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PopularityPage extends StatelessWidget {
  final PageVisibility pageVisibility;

  const PopularityPage({Key key, @required this.pageVisibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/popularity.png'),
            fit: BoxFit.fitWidth,
            alignment: FractionalOffset(
              0.5 + (pageVisibility.pagePosition),
              0.5,
            ),
          ),
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
      ..add(
        fromStep: _Step.init,
        toStep: _Step.uiq,
        forward: () => _uiq = 1.0,
        reverse: () => _uiq = 0.0,
      )
      ..add(
        fromStep: _Step.uiq,
        toStep: _Step.uiqFade,
        forward: () => _uiq = 0.2,
        reverse: () => _uiq = 1.0,
      )
      ..add(
        fromStep: _Step.uiqFade,
        toStep: _Step.symbian,
        forward: () => _symbian = 1.0,
        reverse: () => _symbian = 0.0,
      )
      ..add(
        fromStep: _Step.symbian,
        toStep: _Step.symbianFade,
        forward: () => _symbian = 0.2,
        reverse: () => _symbian = 1.0,
      )
      ..add(
        fromStep: _Step.symbianFade,
        toStep: _Step.blackBerry,
        forward: () => _blackberry = 1.0,
        reverse: () => _blackberry = 0.0,
      )
      ..add(
        fromStep: _Step.blackBerry,
        toStep: _Step.blackBerryFade,
        forward: () => _blackberry = 0.2,
        reverse: () => _blackberry = 1.0,
      )
      ..add(
        fromStep: _Step.blackBerryFade,
        toStep: _Step.qt,
        forward: () => _qt = 1.0,
        reverse: () => _qt = 0.0,
      )
      ..add(
        fromStep: _Step.qt,
        toStep: _Step.qtFade,
        forward: () => _qt = 0.2,
        reverse: () => _qt = 1.0,
      )
      ..add(
        fromStep: _Step.qtFade,
        toStep: _Step.windows,
        forward: () => _windows = 1.0,
        reverse: () => _windows = 0.0,
      )
      ..add(
        fromStep: _Step.windows,
        toStep: _Step.windowsFade,
        forward: () => _windows = 0.2,
        reverse: () => _windows = 1.0,
      )
      ..add(
        fromStep: _Step.windowsFade,
        toStep: _Step.apple,
        forward: () => _apple = 1.0,
        reverse: () => _apple = 0.0,
      )
      ..add(
        fromStep: _Step.apple,
        toStep: _Step.android,
        forward: () => _android = 1.0,
        reverse: () => _android = 0.0,
      )
      ..add(
        fromStep: _Step.android,
        toStep: _Step.fuchsia,
        forward: () => _fuchsia = 0.02,
        reverse: () => _fuchsia = 0.0,
      )
      ..add(
        fromStep: _Step.fuchsia,
        toStep: _Step.next,
        forward: () => widget.controller.next(),
      )
      ..addListener(() => setState(() {}))
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
        color: Colors.transparent,
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
                    child: Image(
                      image: AssetImage('assets/image8.png'),
                      height: 140.0,
                    ),
                  ),
                  AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: _symbian,
                      child: Image(image: AssetImage('assets/S60.png'))),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: _blackberry,
                    child: Image(
                      image: AssetImage('assets/blackberry.png'),
                      height: 140.0,
                    ),
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
                      child: Image(
                        image: AssetImage('assets/windows.png'),
                        height: 140.0,
                      )),
                  AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: _apple,
                      child: Image(
                        image: AssetImage('assets/apple.png'),
                        height: 140.0,
                      )),
                  AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: _android,
                      child: Image(
                        image: AssetImage('assets/image9.png'),
                        height: 140.0,
                      )),
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
