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
      (visibility) => TitlePage(pageVisibility: visibility),
      (visibility) => PopularityPage(pageVisibility: visibility),
      (visibility) => PlatformsPage(presentationController),
      (visibility) => SectionPage(
            'The Cross-Platform Story',
            pageVisibility: visibility,
          ),
      (visibility) => CustomerPage(pageVisibility: visibility),
      (visibility) => MerchantPage(pageVisibility: visibility),
      (visibility) => PuppyPage(pageVisibility: visibility),
      (visibility) => ImagePage(
            'assets/image20.jpg',
            pageVisibility: visibility,
          ),
      (visibility) => SectionPage(
            'Getting Everybody On Board',
            pageVisibility: visibility,
          ),
      (visibility) => DesignersPage(pageVisibility: visibility),
      (visibility) => UmphPage(pageVisibility: visibility),
      (visibility) => ImagePage(
            'assets/image38.jpg',
            pageVisibility: visibility,
          ),
      (visibility) => ImagePage(
            'assets/image31.jpg',
            pageVisibility: visibility,
            child: Text('Less Testing'),
          ),
      (visibility) => DevelopersPage(pageVisibility: visibility),
      (visibility) => WorkshopPage(pageVisibility: visibility),
      (visibility) => ManagersPage(pageVisibility: visibility),
      (visibility) => MergingPage(pageVisibility: visibility),
      (visibility) => SectionPage(
            'The Assessment',
            pageVisibility: visibility,
          ),
      (visibility) => SurveyPage(pageVisibility: visibility),
      (visibility) => CriteriaPage(
            presentationController,
            title: Text(
              'The Criteria',
              textAlign: TextAlign.center,
              style: GTheme.medium.copyWith(color: Colors.white),
            ),
          ),
      (visibility) => DesignersPage(pageVisibility: visibility),
      (visibility) => DevDesignPage(pageVisibility: visibility),
      (visibility) => GrouponPlus(pageVisibility: visibility),
      (visibility) => ImagePage(
            'assets/image38.jpg',
            pageVisibility: visibility,
          ),
      (visibility) => AppiumPage(),
      (visibility) => IntegrationTestPage(pageVisibility: visibility),
      (visibility) => WidgetTestPage(pageVisibility: visibility),
      (visibility) => ManagersPage(pageVisibility: visibility),
      (visibility) => DevelopersPage(pageVisibility: visibility),
      (visibility) => LearningPage(pageVisibility: visibility),
      (visibility) => FlutterDartPage(pageVisibility: visibility),
      (visibility) => TeachingPage(pageVisibility: visibility),
      (visibility) => LaunchPage(pageVisibility: visibility),
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
      (visibility) => ApplePage(pageVisibility: visibility),
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
      (visibility) => AndroidPage(pageVisibility: visibility),
      (visibility) => SummaryPage(
            title: 'For many,',
            subtitle: 'but not everyone.',
            background: GTheme.green,
            pageVisibility: visibility,
          ),
      (visibility) => SummaryPage(
            title: 'Integration',
            subtitle: 'adds complexity',
            background: GTheme.green,
            pageVisibility: visibility,
          ),
      (visibility) => SummaryPage(
            title: 'Flutter',
            subtitle: ' has potential!',
            background: GTheme.green,
            pageVisibility: visibility,
          ),
      (visibility) => SummaryPage(
            title: 'Join the Dart side!',
            subtitle: '',
            background: Colors.black,
            pageVisibility: visibility,
          ),
      (visibility) => ThankYouPage(pageVisibility: visibility),
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
