import 'dart:math';

import 'package:flutter/material.dart';
import 'package:presentation/effects.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:talk_convincing_to_flutter/pages/images.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImagePage(
      'assets/image19.png',
      package: Images.package,
      alignment: AlignmentDirectional.bottomStart,
      child: Text(
        'Survey',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class CriteriaPage extends StatefulWidget {
  const CriteriaPage(
    this.controller, {
    required this.title,
    super.key,
    this.background = GTheme.green,
    this.business = Colors.white,
    this.technology = Colors.white,
    this.people = Colors.white,
  });

  final PresentationController controller;
  final Color background;
  final Color business;
  final Color technology;
  final Color people;
  final Widget title;

  @override
  CriteriaPageState createState() => CriteriaPageState();
}

class CriteriaPageState extends State<CriteriaPage>
    with TickerProviderStateMixin {
  late AnimationController _businessController;
  late AnimationController _techController;
  late AnimationController _peopleController;

  @override
  void initState() {
    super.initState();
    _businessController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _techController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _peopleController = AnimationController(
      duration: const Duration(milliseconds: 500),
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
          widget.controller.nextSlide();
        }
      },
      child: ColoredBox(
        color: widget.background,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: widget.title,
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 70),
              child: Stack(
                children: [
                  Align(
                    child: Transform.translate(
                      offset: const Offset(0, -arrowHeight - 20),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _businessController.status ==
                                AnimationStatus.completed
                            ? 1.0
                            : 0.0,
                        child: Text(
                          'Business',
                          style: GTheme.small.copyWith(color: widget.business),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: CustomPaint(
                      size: const Size(10, arrowHeight),
                      painter: ArrowPainter(
                        color: widget.business,
                        opacity: _businessController.value * 1.0,
                        rotation: 0,
                      ),
                    ),
                  ),
                  Align(
                    child: Transform.translate(
                      offset: const Offset(arrowHeight, arrowHeight - 30.0),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity:
                            _techController.status == AnimationStatus.completed
                                ? 1.0
                                : 0.0,
                        child: Text(
                          'Technology',
                          textAlign: TextAlign.right,
                          style:
                              GTheme.small.copyWith(color: widget.technology),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: CustomPaint(
                      size: const Size(10, arrowHeight),
                      painter: ArrowPainter(
                        color: widget.technology,
                        opacity: _techController.value,
                        rotation: 2 * (pi / 3) * _techController.value,
                      ),
                    ),
                  ),
                  Align(
                    child: Transform.translate(
                      offset: const Offset(-arrowHeight, arrowHeight - 30.0),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _peopleController.status ==
                                AnimationStatus.completed
                            ? 1.0
                            : 0.0,
                        child: Text(
                          'People',
                          textAlign: TextAlign.right,
                          style: GTheme.small.copyWith(color: widget.people),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: CustomPaint(
                      size: const Size(10, arrowHeight),
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
  const ArrowPainter({
    required this.color,
    required this.opacity,
    required this.rotation,
  });

  final Color color;
  final double opacity;
  final double rotation;

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    const edgeHeight = 10.0;
    final edgeWidth = size.width;
    const lineWidth = 3.0;

    final p = Path()
      ..lineTo(lineWidth / 2, 0)
      ..lineTo(lineWidth / 2, height - edgeHeight)
      ..lineTo(edgeWidth / 2, height - edgeHeight)
      ..lineTo(0, height)
      ..lineTo(-edgeWidth / 2, height - edgeHeight)
      ..lineTo(-lineWidth / 2, height - edgeHeight)
      ..lineTo(-lineWidth / 2, 0)
      ..close();

    final line = Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.fill;

    canvas
      ..translate(size.width / 2, size.height / 2)
      ..rotate(rotation + pi)
      ..drawPath(p, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MyPainter extends CustomPainter {
  const MyPainter({
    this.lineColor,
    this.completeColor,
    this.completePercent,
    this.width,
  });

  final Color? lineColor;
  final Color? completeColor;
  final double? completePercent;
  final double? width;

  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..color = lineColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width!;
    final complete = Paint()
      ..color = completeColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width!;
    final center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    final arcAngle = 2 * pi * (completePercent! / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      complete,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DevDesignPage extends StatelessWidget {
  const DevDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          flex: 4,
          child: Center(
            child: Text(
              'Design by Dev',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: ParallaxWidget(
            child: Image.asset(
              'assets/image17.png',
              package: Images.package,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}

class GrouponPlus extends StatelessWidget {
  const GrouponPlus({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
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
              child: Image.asset(
                'assets/image21.png',
                package: Images.package,
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Expanded(
            flex: 4,
            child: ParallaxWidget(
              child: Image.asset(
                'assets/image16.png',
                package: Images.package,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppiumPage extends StatelessWidget {
  const AppiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ParallaxWidget(
      child: Image.asset(
        'assets/image37.png',
        package: Images.package,
      ),
    );
  }
}

class IntegrationTestPage extends StatelessWidget {
  const IntegrationTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(18),
            child: ParallaxWidget(
              child: Text(
                'Integrations Tests',
                textAlign: TextAlign.center,
                style: GTheme.medium,
              ),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            height: 200,
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/image28.png',
                    package: Images.package,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/image26.png',
                    package: Images.package,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/image29.png',
                    package: Images.package,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class WidgetTestPage extends StatelessWidget {
  const WidgetTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ImagePage(
      'assets/image23.png',
      package: Images.package,
      alignment: AlignmentDirectional.topStart,
      child: Text(
        'Widget tests to the rescue!',
        style: GTheme.medium.copyWith(color: Colors.white),
      ),
    );
  }
}

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ImagePage(
      'assets/image43.jpg',
      package: Images.package,
      alignment: AlignmentDirectional.bottomEnd,
      child: Text(
        'Learning',
        style: GTheme.big.copyWith(color: Colors.white),
      ),
    );
  }
}

class FlutterDartPage extends StatelessWidget {
  const FlutterDartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: Alignment.topCenter,
          child: ParallaxWidget(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                'Flutter vs Dart',
                textAlign: TextAlign.center,
                style: GTheme.big,
              ),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            height: 200,
            child: Row(
              children: [
                const Expanded(child: FlutterLogo()),
                Expanded(
                  child: Image.asset(
                    'assets/image25.png',
                    package: Images.package,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TeachingPage extends StatelessWidget {
  const TeachingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ImagePage(
      'assets/image45.jpg',
      package: Images.package,
      alignment: AlignmentDirectional.topEnd,
      child: Text(
        'Teaching',
        style: GTheme.big.copyWith(color: Colors.white),
      ),
    );
  }
}

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: ParallaxWidget(
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Text(
                    'The Launch',
                    style: GTheme.big.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ParallaxWidget(
              child: Image.asset(
                'assets/image42.jpg',
                package: Images.package,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ApplePage extends StatelessWidget {
  const ApplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Image.asset(
              'assets/apple.png',
              package: Images.package,
            ),
          ),
          Expanded(
            child: ParallaxWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: GTheme.flutter1,
                    width: 30,
                    height: 120,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    color: GTheme.flutter2,
                    width: 30,
                    height: 120,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AndroidPage extends StatefulWidget {
  const AndroidPage({super.key});

  @override
  AndroidPageState createState() => AndroidPageState();
}

class AndroidPageState extends State<AndroidPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> first;
  late Animation<double> second;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat();

    first = CurvedAnimation(parent: controller, curve: FirstCurve());
    second = CurvedAnimation(parent: controller, curve: SecondCurve());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Image.asset(
              'assets/image9.png',
              package: Images.package,
            ),
          ),
          Expanded(
            flex: 6,
            child: ParallaxWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ScaleTransition(
                    scale: first,
                    child: ClipPath(
                      clipper: TriangleClipper(),
                      child: Container(
                        color: GTheme.flutter1,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  ScaleTransition(
                    scale: second,
                    child: ClipPath(
                      clipper: TriangleClipper(),
                      child: Container(
                        color: GTheme.flutter2,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..lineTo(size.width, size.height / 2)
    ..lineTo(0, size.height)
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
