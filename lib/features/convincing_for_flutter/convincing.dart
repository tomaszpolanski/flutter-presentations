import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/assessment.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/convince_team.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/groupon_intro.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/intro.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';

class Convincing extends StatefulWidget {
  static const String title = 'Convincing your company to Flutter';
  static const String subtitle = '(Groupon)';

  @override
  ConvincingState createState() {
    return new ConvincingState();
  }
}

class ConvincingState extends State<Convincing> {
  PageController controller;
  PresentationController presentationController;

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
    return new Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
            ],
        body: PresentationSettings(
          controller: presentationController,
          child: DefaultTextStyle(
            style: GTheme.big,
            child: new PageView(
              controller: controller,
              children: [
                TitlePage(),
                PopularityPage(),
                PlatformsPage(presentationController),
                SectionPage('The Cross-Platform Story'),
                PuppyPage(),
                CustomerPage(),
                MerchantPage(),
                ImagePage('assets/image20.jpg'),
                SectionPage('Getting Everybody On Board'),
                DesignersPage(),
                UmphPage(),
                ImagePage('assets/image38.jpg'),
                LessTestingPage(),
                DevelopersPage(),
                WorkshopPage(),
                ManagersPage(),
                MergingPage(),
                SectionPage('The Assessment'),
                SurveyPage(),
                CriteriaPage(),
                DesignersPage(),
                DevDesignPage(),
                GrouponPlus(),
                ImagePage('assets/image38.jpg'),
                AppiumPage(),
                IntegrationTestPage(),
                WidgetTestPage(),
                ManagersPage(),
                DevelopersPage(),
                LearningPage(),
                FlutterDartPage(),
                TeachingPage(),
                LaunchPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
