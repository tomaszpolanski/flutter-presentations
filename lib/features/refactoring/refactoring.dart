import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/big_applications/pages/big_intro.dart';
import 'package:flutter_presentations/features/code_reuse/pages/big_widget.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/features/refactoring/pages/bad_slivers.dart';
import 'package:flutter_presentations/features/refactoring/pages/container.dart';
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
      data: blueLight(),
      child: Scaffold(
        body: Builder(
          builder: (_) {
            final children = [
              const BigIntro(),
              // Refactoring tools:
              // - change name to body to child and then you can remove
              ...[
                // Size
                const SectionPage('Size Matters'),
                BigWidget(presentationController),
                const SummaryPage(
                  title: 'Widgets',
                  subtitle: 'As small As possible',
                ),
                // do not do
                //  final child = ...
                //   final header = ...
                //   return Column(...)

                // StefanText vs buildThemedText - widgets vs methods
                // widgets are transparent

                const SummaryPage(
                  title: 'What about',
                  subtitle: 'Slivers?',
                ),
                const BadSlivers(),
                // slivers can be a stateless widgets
              ],
              ...[
                const SummaryPage(
                  title: 'Context',
                  subtitle: 'a.k.a Element',
                ),
                // explain context
                //
                // as close as possible
              ],
              ...[
                const SummaryPage(
                  title: 'Container',
                  subtitle: "Don't user for everything",
                ),
                FlutterContainer(presentationController),
                // explain context
                //
                // as close as possible
              ],
              ...[
                const SummaryPage(
                  title: "Don't always use Function",
                  subtitle: 'basic_types.dart',
                ),
              ],
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
