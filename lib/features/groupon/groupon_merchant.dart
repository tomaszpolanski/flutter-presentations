import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/groupon/pages/application.dart';
import 'package:flutter_presentations/features/groupon/pages/everythigs_widget.dart';
import 'package:flutter_presentations/features/groupon/pages/inheritance_vs_composition.dart';
import 'package:flutter_presentations/features/groupon/pages/intro.dart';
import 'package:flutter_presentations/features/groupon/pages/reark.dart';
import 'package:flutter_presentations/features/groupon/pages/reusege.dart';
import 'package:flutter_presentations/features/groupon/pages/solid.dart';
import 'package:flutter_presentations/features/groupon/pages/thats_all.dart';
import 'package:flutter_presentations/features/groupon/pages/tutorial.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';
import 'package:flutter_presentations/shared/presentation_page.dart';

class GrouponMerchant extends StatefulWidget {
  static const String title = 'Groupon Merchant';
  static const String subtitle = 'the app';

  @override
  GrouponMerchantState createState() => GrouponMerchantState();
}

class GrouponMerchantState extends State<GrouponMerchant> {
  PageController controller;
  PresentationController presentationController;
  List<ValueGetter<Widget>> pageCreator;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    presentationController = PresentationController(controller: controller);
    pageCreator = <ValueGetter<Widget>>[
      () => Intro(),
      () => Solid(controller: presentationController),
      () => InheritanceVsComposition(controller: presentationController),
      () => EverythingsWidget(controller: presentationController),
      () => Reusage(controller: presentationController),
      () => TutorialGoal(controller: presentationController),
      () => TutorialResult(controller: presentationController),
      () => Reark(controller: presentationController),
      () => GrouponApp(),
      () => ThatsAll(),
    ];
  }

  @override
  void dispose() {
    presentationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Presentation(
      pageCreator: pageCreator,
      controller: controller,
      presentationController: presentationController,
      enableParallax: false,
    );
  }
}
