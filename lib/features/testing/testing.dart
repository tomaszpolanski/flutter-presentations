import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/testing/pages/speed_comparison.dart';
import 'package:flutter_presentations/shared/themes.dart';
import 'package:presentation/presentation.dart';

class Testing extends StatefulWidget {
  const Testing({Key key}) : super(key: key);

  static const String title = 'Flutter testing';
  static const String subtitle = 'is awesome';

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  PageController controller;
  PresentationController presentationController;
  List<ValueGetter<Widget>> pageCreator;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    presentationController = PresentationController(controller: controller);
  }

  @override
  void dispose() {
    presentationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: blueLight(),
      child: Material(
        color: Colors.white,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const AnimatedParallaxImage(
              asset: 'assets/blueprint_wide.jpg',
              opacity: 0.1,
            ),
            Presentation(
              controller: controller,
              presentationController: presentationController,
              children: [
                SpeedComparison(
                  presentationController,
                  driverTest:
                      r'cd C:\Users\tpolanski\Documents\GitHub\flutter-presentations '
                      r'&& dart lib\test_driver\test_runner.dart -f test_driver\main_test.dart',
                  unitTest:
                      r'cd C:\Users\tpolanski\Documents\GitHub\flutter-presentations '
                      r'&& flutter test test\main_test.dart',
                ),
                SpeedComparison(
                  presentationController,
                  driverTest:
                      r'cd c:\Users\tpolanski\Documents\GitHub\flutter-desktop-embedding\mobile-flutter-merchant '
                      r'&& dart lib\test_driver\runner.dart -f test_driver\inbox_test.dart',
                  unitTest:
                      r'cd c:\Users\tpolanski\Documents\GitHub\flutter-desktop-embedding\mobile-flutter-merchant '
                      r'&& flutter test test\features\case_management\inbox_integration_test.dart',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
