import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/assessment.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/convince_team.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/groupon_intro.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/intro.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/summary.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/page_transformer.dart';
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
    final pageCreator = [
      () => TitlePage(),
      () => PopularityPage(),
      () => PlatformsPage(presentationController),
      () => SectionPage('The Cross-Platform Story'),
      () => CustomerPage(),
      () => MerchantPage(),
      () => PuppyPage(),
      () => ImagePage('assets/image20.jpg'),
      () => SectionPage('Getting Everybody On Board'),
      () => DesignersPage(),
      () => UmphPage(),
      () => ImagePage('assets/image38.jpg'),
      () => ImagePage(
            'assets/image31.jpg',
            child: Text('Less Testing'),
          ),
      () => DevelopersPage(),
      () => WorkshopPage(),
      () => ManagersPage(),
      () => MergingPage(),
      () => SectionPage('The Assessment'),
      () => SurveyPage(),
      () => CriteriaPage(
            presentationController,
            title: Text(
              'The Criteria',
              textAlign: TextAlign.center,
              style: GTheme.medium.copyWith(color: Colors.white),
            ),
          ),
      () => DesignersPage(),
      () => DevDesignPage(),
      () => GrouponPlus(),
      () => ImagePage('assets/image38.jpg'),
      () => AppiumPage(),
      () => IntegrationTestPage(),
      () => WidgetTestPage(),
      () => ManagersPage(),
      () => DevelopersPage(),
      () => LearningPage(),
      () => FlutterDartPage(),
      () => TeachingPage(),
      () => LaunchPage(),
      () => CriteriaPage(
            presentationController,
            business: GTheme.green,
            background: Colors.white,
            technology: Colors.red,
            people: Colors.red,
            title: Text(
              'iOS',
              textAlign: TextAlign.center,
              style: GTheme.medium,
            ),
          ),
      () => ApplePage(),
      () => CriteriaPage(
            presentationController,
            business: GTheme.green,
            background: Colors.white,
            technology: GTheme.green,
            people: GTheme.green,
            title: Text(
              'Android',
              textAlign: TextAlign.center,
              style: GTheme.medium,
            ),
          ),
      () => AndroidPage(),
      () => SummaryPage(
            title: 'For many,',
            subtitle: 'but not everyone.',
            background: GTheme.green,
          ),
      () => SummaryPage(
            title: 'Integration',
            subtitle: 'adds complexity',
            background: GTheme.green,
          ),
      () => SummaryPage(
            title: 'Flutter',
            subtitle: ' has potential!',
            background: GTheme.green,
          ),
      () => SummaryPage(
            title: 'Join the Dart side!',
            subtitle: '',
            background: Colors.black,
          ),
      () => ThankYouPage(),
    ];

    return new Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
            ],
        body: PresentationSettings(
          controller: presentationController,
          child: DefaultTextStyle(
            style: GTheme.big,
            child: PageTransformer(
              pageViewBuilder: (context, visibilityResolver) =>
                  PageView.builder(
                    controller: controller,
                    itemCount: pageCreator.length,
                    itemBuilder: (context, index) {
                      final pageVisibility =
                          visibilityResolver.resolvePageVisibility(index);
                      return ParallaxSettings(
                        pageVisibility: pageVisibility,
                        child: pageCreator[index](),
                      );
                    },
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
