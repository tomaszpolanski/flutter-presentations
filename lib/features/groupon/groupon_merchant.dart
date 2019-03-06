import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/groupon_intro.dart';
import 'package:flutter_presentations/features/groupon/pages/application.dart';
import 'package:flutter_presentations/features/groupon/pages/inheritance_vs_composition.dart';
import 'package:flutter_presentations/features/groupon/pages/languages.dart';
import 'package:flutter_presentations/features/groupon/pages/thats_all.dart';
import 'package:flutter_presentations/features/groupon/stats.dart';
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
      () => InheritanceVsComposition(),
      //() => Reusage(controller: presentationController),
      () => MerchantPage(),
      () => Languages(
            lineCount: javaLineCount,
            image: 'assets/java.png',
            subtitle: 'Since 2014',
          ),
      () => Languages(
            lineCount: kotlinLineCount,
            image: 'assets/kotlin.png',
            subtitle: 'Since 2016',
          ),
      () => Languages(
            lineCount: dartLineCount,
            image: 'assets/dart.png',
            subtitle: 'Since 2018',
          ),
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
