import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/code_reuse/pages/application.dart';
import 'package:flutter_presentations/features/code_reuse/pages/big_widget.dart';
import 'package:flutter_presentations/features/code_reuse/pages/composable.dart';
import 'package:flutter_presentations/features/code_reuse/pages/conversation.dart';
import 'package:flutter_presentations/features/code_reuse/pages/everythigs_widget.dart';
import 'package:flutter_presentations/features/code_reuse/pages/inheritance_vs_composition.dart';
import 'package:flutter_presentations/features/code_reuse/pages/intro.dart';
import 'package:flutter_presentations/features/code_reuse/pages/reark.dart';
import 'package:flutter_presentations/features/code_reuse/pages/solid.dart';
import 'package:flutter_presentations/features/code_reuse/pages/thats_all.dart';
import 'package:flutter_presentations/features/code_reuse/pages/tutorial.dart';
import 'package:flutter_presentations/features/code_reuse/parallax_background.dart';
import 'package:flutter_presentations/shared/themes.dart';
import 'package:presentation/presentation_controller.dart';
import 'package:presentation/presentation_page.dart';

class CodeReuse extends StatefulWidget {
  static const String title = 'True Code Reuse';
  static const String subtitle = 'with Flutter';

  @override
  CodeReuseState createState() => CodeReuseState();
}

class CodeReuseState extends State<CodeReuse> {
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
      child: Container(
        color: Colors.white,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            AnimatedParallax(),
            Presentation(
              controller: controller,
              presentationController: presentationController,
              children: [
                Intro(),
                Solid(controller: presentationController),
                InheritanceVsComposition(controller: presentationController),
                Composable(controller: presentationController),
                EverythingsWidget(controller: presentationController),
                BigWidget(controller: presentationController),
                TutorialGoal(controller: presentationController),
                TutorialResult(controller: presentationController),
                Reark(controller: presentationController),
                Conversation(controller: presentationController),
                GrouponApp(),
                ThatsAll(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
