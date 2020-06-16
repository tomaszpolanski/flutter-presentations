import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:presentation/effects.dart';
import 'package:presentation/presentation.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTextStyle(
          style: GTheme.big,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Wrap(
                children: [
                  const Text('Convincing your '),
                  const Text('company to '),
                  ParallaxWidget(
                    child: Row(
                      children: const [
                        Image(
                          image: AssetImage('assets/image4.png'),
                          height: 60,
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
            child: Padding(
              padding: const EdgeInsets.only(right: 18, bottom: 18),
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
    );
  }
}

class PopularityPage extends StatelessWidget {
  const PopularityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/popularity.png',
      fit: BoxFit.fitWidth,
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
  const PlatformsPage(this.controller, {Key key}) : super(key: key);

  final PresentationController controller;

  @override
  _PlatformsPageState createState() => _PlatformsPageState();
}

class _PlatformsPageState extends State<PlatformsPage>
    with TickerProviderStateMixin {
  PageStepper<_Step> stateController;

  double _uiq = 0;
  double _symbian = 0;
  double _blackberry = 0;
  double _qt = 0;
  double _windows = 0;
  double _apple = 0;
  double _android = 0;
  double _fuchsia = 0;

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
        forward: () => widget.controller.nextSlide(),
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
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _uiq,
                    child: const Image(
                      image: AssetImage('assets/image8.png'),
                      height: 140,
                    ),
                  ),
                  AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _symbian,
                      child: const Image(image: AssetImage('assets/S60.png'))),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _blackberry,
                    child: const Image(
                      image: AssetImage('assets/blackberry.png'),
                      height: 140,
                    ),
                  ),
                  AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _qt,
                      child: const Image(image: AssetImage('assets/qt.png'))),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _windows,
                      child: const Image(
                        image: AssetImage('assets/windows.png'),
                        height: 140,
                      )),
                  AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _apple,
                      child: const Image(
                        image: AssetImage('assets/apple.png'),
                        height: 140,
                      )),
                  AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _android,
                      child: const Image(
                        image: AssetImage('assets/image9.png'),
                        height: 140,
                      )),
                  AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _fuchsia,
                      child: const Image(
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
