import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/assessment.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/convince_team.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/groupon_intro.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/intro.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/pages/summary.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/themes.dart';
import 'package:presentation/presentation.dart';

class Convincing extends StatefulWidget {
  const Convincing({Key key}) : super(key: key);
  static const String title = 'Convincing your company to Flutter';
  static const String subtitle = '(Groupon)';

  @override
  ConvincingState createState() => ConvincingState();
}

class ConvincingState extends State<Convincing> {
  PageController controller;
  PresentationController presentationController;
  List<ValueGetter<Widget>> pageCreator;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    presentationController = PresentationController(controller: controller);
    pageCreator = <ValueGetter<Widget>>[];
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
      data: greenLight(),
      child: Material(
        color: Colors.white,
        child: Presentation(
          controller: controller,
          presentationController: presentationController,
          children: [
            const TitlePage(),
            const PopularityPage(),
            PlatformsPage(presentationController),
            const SectionPage('The Cross-Platform Story'),
            const CustomerPage(),
            const MerchantPage(),
            const PuppyPage(),
            const ImagePage('assets/image20.jpg'),
            const SectionPage('Getting Everybody On Board'),
            const DesignersPage(),
            const UmphPage(),
            const ImagePage('assets/image38.jpg'),
            const ImagePage(
              'assets/image31.jpg',
              child: Text('Less Testing'),
            ),
            const DevelopersPage(),
            const WorkshopPage(),
            const ManagersPage(),
            const MergingPage(),
            const SectionPage('The Assessment'),
            const SurveyPage(),
            CriteriaPage(
              presentationController,
              title: Text(
                'The Criteria',
                textAlign: TextAlign.center,
                style: GTheme.medium.copyWith(color: Colors.white),
              ),
            ),
            const DesignersPage(),
            const DevDesignPage(),
            const GrouponPlus(),
            const ImagePage('assets/image38.jpg'),
            const AppiumPage(),
            const IntegrationTestPage(),
            const WidgetTestPage(),
            const ManagersPage(),
            const DevelopersPage(),
            const LearningPage(),
            const FlutterDartPage(),
            const TeachingPage(),
            const LaunchPage(),
            CriteriaPage(
              presentationController,
              business: GTheme.green,
              background: Colors.white,
              technology: Colors.red,
              people: Colors.red,
              title: const Text(
                'iOS',
                textAlign: TextAlign.center,
                style: GTheme.medium,
              ),
            ),
            const ApplePage(),
            CriteriaPage(
              presentationController,
              business: GTheme.green,
              background: Colors.white,
              technology: GTheme.green,
              people: GTheme.green,
              title: const Text(
                'Android',
                textAlign: TextAlign.center,
                style: GTheme.medium,
              ),
            ),
            const AndroidPage(),
            const SummaryPage(
              title: 'For many,',
              subtitle: 'but not everyone.',
              background: GTheme.green,
            ),
            const SummaryPage(
              title: 'Integration',
              subtitle: 'adds complexity',
              background: GTheme.green,
            ),
            const SummaryPage(
              title: 'Flutter',
              subtitle: ' has potential!',
              background: GTheme.green,
            ),
            const SummaryPage(
              title: 'Join the Dart side!',
              subtitle: '',
              background: Colors.black,
            ),
            const ThankYouPage(),
          ],
        ),
      ),
    );
  }
}
