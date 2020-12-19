import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/big_applications/pages/big_intro.dart';
import 'package:flutter_presentations/shared/themes.dart';
import 'package:presentation/presentation.dart';

class Refactoring extends StatefulWidget {
  const Refactoring({Key? key}) : super(key: key);

  static const String title = 'Refactoring';
  static const String subtitle = 'legacy Code';

  @override
  _RefactoringState createState() => _RefactoringState();
}

class _RefactoringState extends State<Refactoring> {
  late PageController controller;
  late PresentationController presentationController;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    presentationController = PresentationController(
      controller: controller,
      animationDuration: const Duration(milliseconds: 600),
    );
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
      data: blueDark(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (_) {
            final children = [
              const BigIntro(),
            ];
            return Presentation(
              controller: controller,
              presentationController: presentationController,
              children: children,
            );
          },
        ),
      ),
    );
  }
}
