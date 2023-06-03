import 'package:flutter/material.dart';
import 'package:talk_effort_reuse/src/images.dart';
import 'package:talk_effort_reuse/src/pages/application.dart';
import 'package:talk_effort_reuse/src/pages/ci.dart';
import 'package:talk_effort_reuse/src/pages/composable.dart';
import 'package:talk_effort_reuse/src/pages/declerative_ui.dart';

import 'package:talk_effort_reuse/src/pages/flutter_animations.dart';
import 'package:talk_effort_reuse/src/pages/imitation_fluttery.dart';
import 'package:talk_effort_reuse/src/pages/inception.dart';
import 'package:talk_effort_reuse/src/pages/include.dart';
import 'package:talk_effort_reuse/src/pages/inheritance_vs_composition.dart';
import 'package:talk_effort_reuse/src/pages/intro.dart';
import 'package:talk_effort_reuse/src/pages/matrix.dart';
import 'package:talk_effort_reuse/src/pages/platform_stack.dart';
import 'package:talk_effort_reuse/src/pages/solid.dart';

import 'package:talk_effort_reuse/src/pages/tutorial.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_theme/shared_theme.dart';

class CodeReuse extends StatefulWidget {
  const CodeReuse({super.key});

  static const String title = 'Effort Reuse';
  static const String subtitle = 'with Flutter';

  @override
  _CodeReuseState createState() => _CodeReuseState();
}

class _CodeReuseState extends State<CodeReuse> {
  late PageController controller;
  late PresentationController presentationController;
  late List<ValueGetter<Widget>> pageCreator;

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
            const AnimatedParallaxImage(
              asset: Images.blueprint,
package: Images.package,
              opacity: 0.1,
            ),
            Presentation(
              controller: controller,
              presentationController: presentationController,
              children: [
                const Intro(),
                Solid(presentationController),
                InheritanceVsComposition(presentationController),
                Composable(presentationController),
                EverythingsWidget(presentationController),
                BigWidget(presentationController),
                TutorialGoal(presentationController),
                TutorialResult(presentationController),
                const GrouponApp(),
                Inception(presentationController),
                PlatformStack(presentationController),
                const AnimationSheet(),
                IncludeFlutter(presentationController),
                Tests(presentationController),
                const CI(),
                Matrix(presentationController),
                const DeclarativeUi(),
                const Imitation(),
                const ThatsAll(thanks: 'Multumesc!'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
