import 'package:flutter/material.dart';
import 'package:talk_refactoring/src/pages/architecture.dart';
import 'package:talk_refactoring/src/pages/bad_slivers.dart';
import 'package:talk_refactoring/src/pages/container.dart';
import 'package:talk_refactoring/src/pages/context.dart';
import 'package:talk_refactoring/src/pages/null_safety.dart';
import 'package:talk_refactoring/src/pages/refactoring_title.dart';
import 'package:talk_refactoring/src/pages/refactoring_widget.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_theme/shared_theme.dart';

class Refactoring extends StatefulWidget {
  const Refactoring({super.key});

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
      data: blueLight(),
      child: Scaffold(
        body: Presentation(
          controller: controller,
          presentationController: presentationController,
          children: [
            const RefactoringTitle(),
            const RefactoringWidget(),
            ...[
              // Size
              const SectionPage("📏 Widget's Size, Matters"),
              BigWidget(presentationController),
              const RefactoringWidget(),
            ],
            ...[
              // Container
              const SummaryPage(
                title: '📦 Container',
                subtitle: "Don't user for everything",
              ),
              FlutterContainer(presentationController),
              const RefactoringWidget(),
            ],
            ...[
              const SummaryPage(
                title: 'Widgets',
                subtitle: 'vs Methods',
              ),
              const RefactoringWidget(),
            ],
            ...[
              const SummaryPage(
                title: 'Context, Widgets, Elements',
                subtitle: 'and InheritedWidgets',
              ),
              const Context(),
            ],
            ...[
              const SummaryPage(
                title: 'What about',
                subtitle: 'Slivers?',
              ),
              const SliverRefactoring(),
            ],
            ...[
              const SectionPage('Reusable Architecture 🏗️'),
              const Architecture(),
            ],
            ...[
              const NullSafety(),
            ],
            const ThatsAll(thanks: 'Thank you!'),
          ],
        ),
      ),
    );
  }
}
