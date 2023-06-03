import 'package:flutter/material.dart';
import 'package:talk_convincing_to_flutter/pages/assessment.dart';
import 'package:talk_convincing_to_flutter/pages/convince_team.dart';
import 'package:talk_convincing_to_flutter/pages/groupon_intro.dart';
import 'package:talk_convincing_to_flutter/pages/images.dart';
import 'package:talk_convincing_to_flutter/pages/intro.dart';
import 'package:talk_convincing_to_flutter/pages/summary.dart';

import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_theme/shared_theme.dart';

class Convincing extends StatefulWidget {
  const Convincing({super.key});

  static const String title = 'Convincing your company to Flutter';
  static const String subtitle = '(Groupon)';

  @override
  ConvincingState createState() => ConvincingState();
}

class ConvincingState extends State<Convincing> {
  late PageController controller;
  late PresentationController presentationController;
  late List<ValueGetter<Widget>> pageCreator;

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
            const ImagePage(
              'assets/image20.jpg',
              package: Images.package,
            ),
            const SectionPage('Getting Everybody On Board'),
            const DesignersPage(),
            const UmphPage(),
            const ImagePage(
              'assets/image38.jpg',
              package: Images.package,
            ),
            const ImagePage(
              'assets/image31.jpg',
              package: Images.package,
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
            const ImagePage(
              'assets/image38.jpg',
              package: Images.package,
            ),
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
