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
      (visibility) => TitlePage(),
      (visibility) => PopularityPage(pageVisibility: visibility),
      (visibility) => PlatformsPage(presentationController),
      (visibility) => SectionPage('The Cross-Platform Story'),
      (visibility) => CustomerPage(),
      (visibility) => MerchantPage(),
      (visibility) => PuppyPage(pageVisibility: visibility),
      (visibility) => ImagePage('assets/image20.jpg'),
      (visibility) => SectionPage('Getting Everybody On Board'),
      (visibility) => DesignersPage(),
      (visibility) => UmphPage(),
      (visibility) => ImagePage('assets/image38.jpg'),
      (visibility) => LessTestingPage(),
      (visibility) => DevelopersPage(),
      (visibility) => WorkshopPage(),
      (visibility) => ManagersPage(),
      (visibility) => MergingPage(),
      (visibility) => SectionPage('The Assessment'),
      (visibility) => SurveyPage(),
      (visibility) => CriteriaPage(
            presentationController,
            title: Text(
              'The Criteria',
              textAlign: TextAlign.center,
              style: GTheme.medium.copyWith(color: Colors.white),
            ),
          ),
      (visibility) => DesignersPage(),
      (visibility) => DevDesignPage(),
      (visibility) => GrouponPlus(),
      (visibility) => ImagePage('assets/image38.jpg'),
      (visibility) => AppiumPage(),
      (visibility) => IntegrationTestPage(),
      (visibility) => WidgetTestPage(),
      (visibility) => ManagersPage(),
      (visibility) => DevelopersPage(),
      (visibility) => LearningPage(),
      (visibility) => FlutterDartPage(),
      (visibility) => TeachingPage(),
      (visibility) => LaunchPage(),
      (visibility) => CriteriaPage(
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
      (visibility) => ApplePage(),
      (visibility) => CriteriaPage(
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
      (visibility) => AndroidPage(),
      (visibility) => SummaryPage(
            title: 'For many,',
            subtitle: 'but not everyone.',
            background: GTheme.green,
          ),
      (visibility) => SummaryPage(
            title: 'Integration',
            subtitle: 'adds complexity',
            background: GTheme.green,
          ),
      (visibility) => SummaryPage(
            title: 'Flutter',
            subtitle: ' has potential!',
            background: GTheme.green,
          ),
      (visibility) => SummaryPage(
            title: 'Join the Dart side!',
            subtitle: '',
            background: Colors.black,
          ),
      (visibility) => ThankYouPage(),
    ];

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
            child: PageTransformer(
              pageViewBuilder: (context, visibilityResolver) =>
                  PageView.builder(
                    controller: controller,
                    itemCount: pageCreator.length,
                    itemBuilder: (context, index) {
                      final pageVisibility =
                          visibilityResolver.resolvePageVisibility(index);
                      return pageCreator[index](pageVisibility);
                    },
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
