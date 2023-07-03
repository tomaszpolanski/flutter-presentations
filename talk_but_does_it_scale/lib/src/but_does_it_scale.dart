import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/effects.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_ui/shared_ui.dart';
import 'package:talk_but_does_it_scale/src/assets.dart';
import 'package:talk_but_does_it_scale/src/images.dart';
import 'package:talk_but_does_it_scale/src/pages/embrace_change.dart';
import 'package:talk_but_does_it_scale/src/pages/golden_tests.dart';
import 'package:talk_but_does_it_scale/src/pages/intro.dart';
import 'package:talk_but_does_it_scale/src/pages/modules.dart';
import 'package:talk_but_does_it_scale/src/pages/more_devs_more_problems.dart';
import 'package:talk_but_does_it_scale/src/pages/old_android.dart';
import 'package:talk_but_does_it_scale/src/pages/scale_vs_change.dart';
import 'package:talk_but_does_it_scale/src/pages/speakers_intro.dart';
import 'package:talk_but_does_it_scale/src/pages/what_is_scale.dart';

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
              title: 'Test',
              subtitle: '✅ All ✅',
            ),
            const GoldenTestPage(
              title: Text('Screenshots for UI Tests'),
              child: SingleChildScrollView(
                child: ParallaxImage(
                  Assets.screenshots,
                  package: Assets.package,
                ),
              ),
            ),
            const GoldenTestPage(
              title: Text('Golder Tests ❌'),
              // Should be only used for graphs
              child: ParallaxImage(
                Assets.simpleGolden,
                package: Assets.package,
              ),
            ),
            const GoldenTestPage(
              title: Text('Golder Tests ✅'),
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
            OldAndroid(presentationController),
            const Modules(),
            const SummaryPage(
              title: 'Melos 📦',
              subtitle: '& Mason 🧱',
            ),
            const SectionPage('Issues'),
            StackedPage(
              controller: presentationController,
              children: const [
                Text('Modules and OOM'),
                Text('Analyzer'),
              ],
            ),
            const SectionPage('Conclusion'),
            const SummaryPage(
              title: 'Scales,',
              subtitle: 'so far...',
            ),
            const SummaryPage(
              title: 'Must Have,',
              subtitle: 'Tests/CI',
            ),
            const SummaryPage(
              title: 'You Build It',
              subtitle: 'You Run It',
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
