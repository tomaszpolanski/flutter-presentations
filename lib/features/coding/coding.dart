import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/coding/qr_code.dart';
import 'package:flutter_presentations/shared/themes.dart';
import 'package:presentation/presentation.dart';

class Coding extends StatefulWidget {
  const Coding({Key key}) : super(key: key);

  static const String title = 'Coding in Flutter';
  static const String subtitle = 'WIP';

  @override
  _CodingState createState() => _CodingState();
}

class _CodingState extends State<Coding> {
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
          children: [
            Presentation(
              controller: controller,
              presentationController: presentationController,
              children: const [
                QrCode(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
