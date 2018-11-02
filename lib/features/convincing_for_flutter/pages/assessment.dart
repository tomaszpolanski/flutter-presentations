import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/page_transformer.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';
import 'package:flutter_presentations/shared/slide_effects.dart';

class SurveyPage extends StatelessWidget {
  final PageVisibility pageVisibility;

  const SurveyPage({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: ParallaxDecorationImage(
            pageVisibility: pageVisibility,
            image: AssetImage('assets/image19.png'),
          ),
        ),
        child: Align(
            alignment: Alignment.bottomLeft,
            child: ParallaxWidget(
              pageVisibility: pageVisibility,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('Survey', style: TextStyle(color: Colors.black)),
              ),
            )),
      ),
    );
  }
}

class CriteriaPage extends StatefulWidget {
  final PresentationController controller;
  final Color background;
  final Color business;
  final Color technology;
  final Color people;
  final Widget title;

  const CriteriaPage(
    this.controller, {
    @required this.title,
    Key key,
    this.background = GTheme.green,
    this.business = Colors.white,
    this.technology = Colors.white,
    this.people = Colors.white,
  }) : super(key: key);

  @override
  CriteriaPageState createState() {
    return new CriteriaPageState();
  }
}

class CriteriaPageState extends State<CriteriaPage>
    with TickerProviderStateMixin {
  AnimationController _businessController;
  AnimationController _techController;
  AnimationController _peopleController;

  @override
  void initState() {
    super.initState();
    _businessController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _techController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _peopleController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _businessController.dispose();
    _techController.dispose();
    _peopleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const arrowHeight = 140.0;
    return GestureDetector(
      onTap: () {
        if (_businessController.status == AnimationStatus.dismissed) {
          _businessController.forward();
        } else if (_techController.status == AnimationStatus.dismissed) {
          _techController.forward();
        } else if (_peopleController.status == AnimationStatus.dismissed) {
          _peopleController.forward();
        } else {
          widget.controller.next();
        }
      },
      child: Container(
        color: widget.background,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: widget.title,
              ),
            ),
            Transform.translate(
              offset: Offset(0.0, 70.0),
              child: Stack(
                children: [
                  Align(
                    child: Transform.translate(
                      offset: Offset(0.0, -arrowHeight - 20.0),
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity: _businessController.status ==
                                AnimationStatus.completed
                            ? 1.0
                            : 0.0,
                        child: Text('Business',
                            style:
                                GTheme.small.copyWith(color: widget.business)),
                      ),
                    ),
                  ),
                  Align(
                    child: CustomPaint(
                      size: Size(10.0, arrowHeight),
                      painter: ArrowPainter(
                        color: widget.business,
                        opacity: _businessController.value * 1.0,
                        rotation: 0.0,
                      ),
                    ),
                  ),
                  Align(
                    child: Transform.translate(
                      offset: Offset(arrowHeight, arrowHeight - 30.0),
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity:
                            _techController.status == AnimationStatus.completed
                                ? 1.0
                                : 0.0,
                        child: Text('Technology',
                            textAlign: TextAlign.right,
                            style: GTheme.small
                                .copyWith(color: widget.technology)),
                      ),
                    ),
                  ),
                  Align(
                    child: CustomPaint(
                      size: Size(10.0, arrowHeight),
                      painter: ArrowPainter(
                        color: widget.technology,
                        opacity: _techController.value,
                        rotation: 2 * (pi / 3) * _techController.value,
                      ),
                    ),
                  ),
                  Align(
                    child: Transform.translate(
                      offset: Offset(-arrowHeight, arrowHeight - 30.0),
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity: _peopleController.status ==
                                AnimationStatus.completed
                            ? 1.0
                            : 0.0,
                        child: Text('People',
                            textAlign: TextAlign.right,
                            style: GTheme.small.copyWith(color: widget.people)),
                      ),
                    ),
                  ),
                  Align(
                    child: CustomPaint(
                      size: Size(10.0, arrowHeight),
                      painter: ArrowPainter(
                        color: widget.people,
                        opacity: _peopleController.value,
                        rotation: 2 * (pi / 3) * (1 + _peopleController.value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArrowPainter extends CustomPainter {
  final Color color;
  final double opacity;
  final double rotation;

  ArrowPainter({this.color, this.opacity, this.rotation});

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    const edgeHeight = 10.0;
    final edgeWidth = size.width;
    const lineWidth = 3.0;
    print(size);

    Path p = Path()
      ..lineTo(lineWidth / 2, 0.0)
      ..lineTo(lineWidth / 2, height - edgeHeight)
      ..lineTo(edgeWidth / 2, height - edgeHeight)
      ..lineTo(0.0, height)
      ..lineTo(-edgeWidth / 2, height - edgeHeight)
      ..lineTo(-lineWidth / 2, height - edgeHeight)
      ..lineTo(-lineWidth / 2, 0.0)
      ..close();

    Paint line = new Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.fill;

    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(rotation + pi);
    canvas.drawPath(p, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;

  MyPainter(
      {this.lineColor, this.completeColor, this.completePercent, this.width});

  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (completePercent / 100);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DevDesignPage extends StatelessWidget {
  final PageVisibility pageVisibility;

  const DevDesignPage({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Center(
                child: Text(
              'Design by Dev',
              textAlign: TextAlign.center,
            )),
          ),
          Expanded(
            flex: 6,
            child: ParallaxWidget(
              pageVisibility: pageVisibility,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/image17.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GrouponPlus extends StatelessWidget {
  final PageVisibility pageVisibility;

  const GrouponPlus({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        color: GTheme.teal,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Center(
                child: Text(
                  'Groupon+',
                  textAlign: TextAlign.center,
                  style: GTheme.medium.copyWith(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ParallaxWidget(
                pageVisibility: pageVisibility,
                child: Image(
                  image: AssetImage('assets/image21.png'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 4,
              child: ParallaxWidget(pageVisibility: pageVisibility,
                child: Image(image: AssetImage('assets/image16.png'),),),
            ),
          ],
        ),
      ),
    );
  }
}

class AppiumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/image37.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}

class IntegrationTestPage extends StatelessWidget {
  final PageVisibility pageVisibility;

  const IntegrationTestPage({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ParallaxWidget(
                pageVisibility: pageVisibility,
                child: Text(
                  'Integrations Tests',
                  textAlign: TextAlign.center,
                  style: GTheme.medium,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 200.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Expanded(
                      child: Image(image: AssetImage('assets/image28.png'))),
                  Expanded(
                      child: Image(image: AssetImage('assets/image26.png'))),
                  Expanded(
                      child: Image(image: AssetImage('assets/image29.png'))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WidgetTestPage extends StatelessWidget {

  final PageVisibility pageVisibility;

  const WidgetTestPage({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: ParallaxDecorationImage(
            pageVisibility: pageVisibility,
            image: AssetImage('assets/image23.png'),
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: ParallaxWidget(
            pageVisibility: pageVisibility,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'Widget tests to the rescue!',
                style: GTheme.medium.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LearningPage extends StatelessWidget {
  final PageVisibility pageVisibility;

  const LearningPage({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: ParallaxDecorationImage(
            pageVisibility: pageVisibility,
            image: AssetImage('assets/image43.jpg'),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: ParallaxWidget(
            pageVisibility: pageVisibility,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'Learning',
                style: GTheme.big.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FlutterDartPage extends StatelessWidget {
  final PageVisibility pageVisibility;

  const FlutterDartPage({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ParallaxWidget(
              pageVisibility: pageVisibility,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Flutter vs Dart',
                  textAlign: TextAlign.center,
                  style: GTheme.big,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 200.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Expanded(
                      child: Image(image: AssetImage('assets/image4.png'))),
                  Expanded(
                      child: Image(image: AssetImage('assets/image25.png'))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TeachingPage extends StatelessWidget {
  final PageVisibility pageVisibility;

  const TeachingPage({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: ParallaxDecorationImage(
            pageVisibility: pageVisibility,
            image: AssetImage('assets/image45.jpg'),
          ),
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: ParallaxWidget(
            pageVisibility: pageVisibility,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'Teaching',
                style: GTheme.big.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LaunchPage extends StatelessWidget {

  final PageVisibility pageVisibility;

  const LaunchPage({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Container(
        color: Colors.black,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: ParallaxWidget(
                  pageVisibility: pageVisibility,
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Text(
                      'The Launch',
                      style: GTheme.big.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: ParallaxDecorationImage(
                    pageVisibility: pageVisibility,
                    image: AssetImage('assets/image42.jpg'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ApplePage extends StatelessWidget {

  final PageVisibility pageVisibility;

  const ApplePage({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Row(
          children: <Widget>[
            Expanded(child: Image(image: AssetImage('assets/apple.png'))),
            Expanded(
                child: ParallaxWidget(
                  pageVisibility: pageVisibility,
                  child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Container(
                    color: GTheme.flutter1,
                    width: 30.0,
                    height: 120.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Container(
                    color: GTheme.flutter2,
                    width: 30.0,
                    height: 120.0,
                  )
              ],
            ),
                )),
          ],
        ),
      ),
    );
  }
}

class AndroidPage extends StatefulWidget {

  final PageVisibility pageVisibility;

  const AndroidPage({Key key, @required this.pageVisibility}) : super(key: key);

  @override
  AndroidPageState createState() => new AndroidPageState();
}

class AndroidPageState extends State<AndroidPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> first;
  Animation<double> second;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();

    first = new CurvedAnimation(parent: controller, curve: FirstCurve());
    second = new CurvedAnimation(parent: controller, curve: SecondCurve());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideWidget(
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 4, child: Image(image: AssetImage('assets/image9.png'))),
            Expanded(
                flex: 6,
                child: ParallaxWidget(
                  pageVisibility: widget.pageVisibility,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ScaleTransition(
                        scale: first,
                        child: ClipPath(
                          clipper: TriangleClipper(),
                          child: Container(
                            color: GTheme.flutter1,
                            width: 120.0,
                            height: 120.0,
                          ),
                        ),
                      ),
                      ScaleTransition(
                        scale: second,
                        child: ClipPath(
                          clipper: TriangleClipper(),
                          child: Container(
                            color: GTheme.flutter2,
                            width: 120.0,
                            height: 120.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..lineTo(size.width, size.height / 2)
    ..lineTo(0.0, size.height)
    ..close();

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

class FirstCurve extends Curve {
  @override
  double transform(double t) => 0.9 + (sin(t * pi * 2) * 0.02);
}

class SecondCurve extends Curve {
  @override
  double transform(double t) => 0.9 + (cos(t * pi * 2) * 0.02);
}
