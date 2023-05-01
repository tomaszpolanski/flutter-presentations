import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/big_applications/pages/arch_vs_tool.dart';
import 'package:flutter_presentations/features/big_applications/pages/architectures.dart';
import 'package:flutter_presentations/features/big_applications/pages/big_intro.dart';
import 'package:flutter_presentations/features/big_applications/pages/crashes.dart';
import 'package:flutter_presentations/features/big_applications/pages/dart_issues.dart';
import 'package:flutter_presentations/features/big_applications/pages/flutter_is_fun.dart';
import 'package:flutter_presentations/features/big_applications/pages/pride.dart';
import 'package:flutter_presentations/features/big_applications/pages/the_app.dart';
import 'package:flutter_presentations/features/big_applications/pages/widget_is_function.dart';
import 'package:flutter_presentations/features/big_applications/pages/you_can_make.dart';
import 'package:flutter_presentations/features/code_reuse/pages/everythigs_widget.dart';
import 'package:flutter_presentations/features/code_reuse/pages/tests.dart';
import 'package:flutter_presentations/features/code_reuse/pages/thats_all.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/logo.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:flutter_presentations/shared/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:presentation/presentation.dart';

class BigApplications extends StatefulWidget {
  const BigApplications({super.key});

  static const String title = 'Big Applications';
  static const String subtitle = 'with Flutter';

  @override
  _BigApplicationsState createState() => _BigApplicationsState();
}

class _BigApplicationsState extends State<BigApplications> {
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
    return Theme(
      data: blueLight(),
      child: Scaffold(
        body: Builder(
          builder: (_) {
            final children = [
              const BigIntro(),
              const YouCanMake(),
              TheApp(presentationController),
              ...[
                const SectionPage('Prototyping'),
                const SummaryPage(
                  title: 'iOS/Android',
                  subtitle: 'Prototyping',
                ),
                ...[
                  const SummaryPage(
                    title: 'Flutter 🔥',
                    subtitle: 'Prototyping',
                  ),
                ],
              ],
              ...[
                const SectionPage('Scalable?'),
                ...[
                  const SectionPage('Architecture 📐'),
                  Tools(presentationController),
                  Architectures(presentationController),
                  const SummaryPage(
                    title: 'Which To Pick?',
                    subtitle: 'Architecture',
                  ),
                  const SummaryPage(
                    title: 'Provider?',
                    subtitle: 'InheritedWidget on Steroids',
                  ),
                ],
                ...[
                  const SectionPage('Maintainable Code'),
                  WidgetIsFunction(presentationController),
                  EverythingsWidget(presentationController),
                  const SummaryPage(
                    title: '✂ until',
                    subtitle: 'cannot ✂ any more',
                  ),
                  const SummaryPage(
                    title: 'No Code',
                    subtitle: 'Only 🏗️ Lego',
                  ),
                  const Pride(),
                ],
                ...[
                  const SectionPage('Testing'),
                  StackedPage(
                    controller: presentationController,
                    children: const [
                      Text('🤩‍❌'),
                      Text('🤢✅'),
                    ],
                  ),
                  Tests(presentationController),
                ],
              ],
              ...[
                const SectionPage('🐘 in the Room'), // explosion emoji
                const SummaryPage(
                  title: 'Simpler Approach',
                  subtitle: 'All at Once',
                ),
                const SummaryPage(
                  title: 'Complex Approach',
                  subtitle: 'Piece by Piece',
                ),
              ],
              ...[
                const SectionPage('💥 Issues 💥'), // explosion emoji

                const DartIssues(),
                const Crashes(),
                const SummaryPage(
                  title: '😃 89 images',
                  subtitle: '😬 90 images',
                ),
                StackedPage(
                  controller: presentationController,
                  children: const [
                    Text('👨🏽‍💼'),
                    Text('👨🏽‍💼👩‍💼'),
                    Text('👨🏽‍💼👩‍💼👨‍💼'),
                  ],
                ),
              ],
              ...[
                const SummaryPage(
                  title: 'Was it Worth it?',
                  subtitle: '// Demo',
                ),
                const SummaryPage(
                  title: 'Refactoring',
                  subtitle: 'Without Fear',
                ),
                FlutterIsFun(presentationController),
              ],
              YouCanMake(controller: presentationController),
              const ThatsAll(thanks: 'Thank you!'),
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
                  bottom: 0,
                  left: 20,
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) {
                      final page = controller.page ?? 0.0;
                      return Logo(
                        visible: (page * 1000).floor() % 1000 == 0,
                        child: Row(
                          children: [
                            Image.asset('assets/gdg.png', height: 110),
                            Text(
                              'GDG Jeddah',
                              style: GoogleFonts.poppins(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color:
                                          (page.round() == children.length - 1
                                                  ? Colors.white
                                                  : Colors.black)
                                              .withOpacity(0.6),
                                    ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
