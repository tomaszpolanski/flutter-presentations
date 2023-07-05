import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/effects.dart';
import 'package:presentation/presentation.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_ui/shared_ui.dart';
import 'package:talk_but_does_it_scale/src/assets.dart';
import 'package:talk_but_does_it_scale/src/images.dart';
import 'package:talk_but_does_it_scale/src/pages/ci_definition.dart';
import 'package:talk_but_does_it_scale/src/pages/ci_tricks.dart';
import 'package:talk_but_does_it_scale/src/pages/code_iteration.dart';
import 'package:talk_but_does_it_scale/src/pages/design_system.dart';
import 'package:talk_but_does_it_scale/src/pages/design_system_tips.dart';
import 'package:talk_but_does_it_scale/src/pages/embrace_change.dart';
import 'package:talk_but_does_it_scale/src/pages/fast_pr_checks.dart';
import 'package:talk_but_does_it_scale/src/pages/history_year.dart';
import 'package:talk_but_does_it_scale/src/pages/intro.dart';
import 'package:talk_but_does_it_scale/src/pages/issues.dart';
import 'package:talk_but_does_it_scale/src/pages/machine_work.dart';
import 'package:talk_but_does_it_scale/src/pages/modules.dart';
import 'package:talk_but_does_it_scale/src/pages/more_devs_more_problems.dart';
import 'package:talk_but_does_it_scale/src/pages/old_android.dart';
import 'package:talk_but_does_it_scale/src/pages/scale_vs_change.dart';
import 'package:talk_but_does_it_scale/src/pages/snippet_page.dart';
import 'package:talk_but_does_it_scale/src/pages/speakers_intro.dart';
import 'package:talk_but_does_it_scale/src/pages/what_is_scale.dart';
import 'package:talk_but_does_it_scale/src/pages/you_build_it.dart';

class ButDoesItScale extends StatefulWidget {
  const ButDoesItScale({super.key});

  static const String title = 'But Does It Scale';
  static const String subtitle =
      'Can flutter applications scale to large teams?';

  @override
  _ButDoesItScaleState createState() => _ButDoesItScaleState();
}

class _ButDoesItScaleState extends State<ButDoesItScale> {
  late PageController controller;
  late PresentationController presentationController;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    presentationController = PresentationController(
      controller: controller,
      animationDuration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    presentationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (_) {
          final children = [
            const Intro(),
            SpeakersIntro(presentationController),
            const SummaryPage(
              title: 'What is',
              subtitle: 'Scale?',
            ),
            WhatIsScale(presentationController),
            MoreCodeMoreProblems(presentationController),
            const SummaryPage(
              title: 'Who should',
              subtitle: 'Scale?',
            ),
            ScaleVsChange(presentationController),
            EmbraceChange(presentationController),
            const SummaryPage(
              title: 'Some Brief History',
              subtitle: 'of Klar',
            ),
            YearStats(
              presentationController,
              date: DateTime(2021),
              developerCount: 4,
              dartFileCount: 430,
              testFileCount: 14,
            ),
            const SummaryPage(
              title: 'Velocity',
              subtitle: 'Problem',
            ),
            const SnippetPage(
              title: Text('Velocity?'),
              child: SingleChildScrollView(
                child: ParallaxImage(
                  Assets.velocity_linear,
                  package: Assets.package,
                ),
              ),
            ),
            const SnippetPage(
              title: Text('Velocity!'),
              child: SingleChildScrollView(
                child: ParallaxImage(
                  Assets.velocity_log,
                  package: Assets.package,
                ),
              ),
            ),
            YearStats(
              presentationController,
              date: DateTime(2023),
              developerCount: 19,
              dartFileCount: 4800,
              testFileCount: 1700,
            ),
            const SummaryPage(
              title: 'Test',
              subtitle: '✅ All ✅',
            ),
            const SnippetPage(
              title: Text('Screenshots for UI Tests'),
              child: SingleChildScrollView(
                child: ParallaxImage(
                  Assets.screenshots,
                  package: Assets.package,
                ),
              ),
            ),
            const SnippetPage(
              title: Text('Golden Tests ❌'),
              // Should be only used for graphs
              child: ParallaxImage(
                Assets.simpleGolden,
                package: Assets.package,
              ),
            ),
            const SnippetPage(
              title: Text('Golden Tests ✅'),
              // Should be only used for graphs
              child: ParallaxImage(
                Assets.advanceGolden,
                package: Assets.package,
              ),
            ),
            const SummaryPage(
              title: 'Widget Tests',
              subtitle: 'They are 🤩, nuff said',
            ),
            const SummaryPage(
              title: 'Test',
              subtitle: '⚡ Fast ⚡',
            ),
            const SummaryPage(
              title: 'Design System',
              subtitle: 'UI',
            ),
            const DesignSystems(),
            DesignSystemTips(presentationController),
            OldAndroid(presentationController),
            const Modules(),
            const SummaryPage(
              title: 'Melos 📦',
              subtitle: '& Mason 🧱',
            ),
            const SectionPage(
              'Automation 🤖',
            ),
            const WorkForMachine(),
            const SectionPage(
              'Automate releases 🚀',
            ),
            const SectionPage(
              'Identify your challenges',
            ),
            const SnippetPage(
              title: Text('Orange 🍊'),
              child: SingleChildScrollView(
                child: ParallaxImage(
                  Assets.debug,
                  package: Assets.package,
                ),
              ),
            ),
            const SnippetPage(
              title: Text('! 🍊'),
              child: SingleChildScrollView(
                child: ParallaxImage(
                  Assets.failedDebug,
                  package: Assets.package,
                ),
              ),
            ),
            const SummaryPage(
              title: 'Custom tools',
              subtitle: '🛠️',
            ),
            CodeIteration(presentationController),
            const SummaryPage(
              title: 'Continuous Integration',
              subtitle: '',
            ),
            const ContinuousIntegrationDefinition(),
            FastPrChecks(presentationController),
            CiTricks(presentationController),
            const SnippetPage(
              title: Text('Continuous Delivery'),
              child: SingleChildScrollView(
                child: ParallaxImage(
                  Assets.continuousDeliveryExample,
                  package: Assets.package,
                ),
              ),
            ),
            TitledPage(
              title: const Text('Continuous Delivery by Dave Farley'),
              child: Center(
                child: SingleChildScrollView(
                  child: QrImageView(
                    data: 'https://www.youtube.com/c/ContinuousDelivery',
                    size: 400.0,
                  ),
                ),
              ),
            ),
            YouBuildIt(presentationController),
            Issues(presentationController),
            const SectionPage('Conclusion'),
            const SummaryPage(
              title: 'Scales,',
              subtitle: 'so far...',
            ),
            const SummaryPage(
              title: 'Must Have!',
              subtitle: 'CI',
            ),
            const SectionPage('Embrace The Change!'),
            const ThatsAll(
              thanks: 'Thank you!',
              author: 'Pawel & Tomek Polanski',
              contact: '@jaggernod / @tpolansk',
            ),
          ];
          return Stack(
            fit: StackFit.expand,
            children: [
              Presentation(
                controller: controller,
                presentationController: presentationController,
                children: children,
              ),
              Positioned(
                bottom: 50,
                left: 50,
                child: PresentationLogo(
                  controller: controller,
                  child: PresentationLogo(
                    controller: controller,
                    child: SvgPicture.asset(
                      Images.flutterCon,
                      package: Images.package,
                      height: 25,
                      colorFilter: const ColorFilter.mode(
                        Colors.blue,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
