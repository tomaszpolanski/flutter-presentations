import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/code_reuse/pages/application.dart';
import 'package:flutter_presentations/features/code_reuse/pages/big_widget.dart';
import 'package:flutter_presentations/features/code_reuse/pages/ci.dart';
import 'package:flutter_presentations/features/code_reuse/pages/composable.dart';
import 'package:flutter_presentations/features/code_reuse/pages/declerative_ui.dart';
import 'package:flutter_presentations/features/code_reuse/pages/everythigs_widget.dart';
import 'package:flutter_presentations/features/code_reuse/pages/flutter_animations.dart';
import 'package:flutter_presentations/features/code_reuse/pages/imitation_fluttery.dart';
import 'package:flutter_presentations/features/code_reuse/pages/inception.dart';
import 'package:flutter_presentations/features/code_reuse/pages/include.dart';
import 'package:flutter_presentations/features/code_reuse/pages/inheritance_vs_composition.dart';
import 'package:flutter_presentations/features/code_reuse/pages/intro.dart';
import 'package:flutter_presentations/features/code_reuse/pages/matrix.dart';
import 'package:flutter_presentations/features/code_reuse/pages/platform_stack.dart';
import 'package:flutter_presentations/features/code_reuse/pages/solid.dart';
import 'package:flutter_presentations/features/code_reuse/pages/tests.dart';
import 'package:flutter_presentations/features/code_reuse/pages/thats_all.dart';
import 'package:flutter_presentations/features/code_reuse/pages/tutorial.dart';
import 'package:flutter_presentations/shared/themes.dart';
import 'package:presentation/presentation.dart';

class CodeReuse extends StatefulWidget {
  const CodeReuse({Key key}) : super(key: key);

  static const String title = 'True Effort Reuse';
  static const String subtitle = 'with Flutter';

  @override
  _CodeReuseState createState() => _CodeReuseState();
}

class _CodeReuseState extends State<CodeReuse> {
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
            const AnimatedParallaxImage(
              asset: 'assets/blueprint_wide.jpg',
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
