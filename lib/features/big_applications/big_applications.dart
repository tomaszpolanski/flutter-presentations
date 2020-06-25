import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/big_applications/pages/widget_is_function.dart';
import 'package:flutter_presentations/features/code_reuse/pages/everythigs_widget.dart';
import 'package:flutter_presentations/features/code_reuse/pages/intro.dart';
import 'package:flutter_presentations/features/code_reuse/pages/thats_all.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';
import 'package:flutter_presentations/shared/logo.dart';
import 'package:flutter_presentations/shared/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:presentation/presentation.dart';

class BigApplications extends StatefulWidget {
  const BigApplications({Key key}) : super(key: key);

  static const String title = 'Big Applications';
  static const String subtitle = 'with Flutter';

  @override
  _BigApplicationsState createState() => _BigApplicationsState();
}

class _BigApplicationsState extends State<BigApplications> {
  PageController controller;
  PresentationController presentationController;
  bool _showAppBar = true;

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
        backgroundColor: Colors.white,
        appBar: _showAppBar
            ? AppBar(
                title: const Text(BigApplications.title),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.fullscreen),
                    onPressed: () {
                      setState(() => _showAppBar = !_showAppBar);
                    },
                  )
                ],
              )
            : null,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Presentation(
              controller: controller,
              presentationController: presentationController,
              children: [
                const Intro(),
                ...[
                  const SectionPage('Prototyping'),
                  const SummaryPage(
                    title: 'iOS/Android',
                    subtitle: 'Prototyping',
                  ),
                  ...[
                    const SummaryPage(
                      title: 'Flutter',
                      subtitle: 'Prototyping',
                    ),
                  ],
                ],
                ...[
                  const SectionPage('Scalable?'),
                  ...[
                    const SectionPage('Architecture'),
                    const SummaryPage(
                      title: 'Which To Pick?',
                      subtitle: 'Architecture',
                    ),
                  ],
                  ...[
                    const SectionPage('Maintainable Code'),
                    WidgetIsFunction(presentationController),
                    EverythingsWidget(presentationController),
                    const SummaryPage(
                      title: 'Pride',
                      subtitle: 'Maintainable Code',
                    ),
                  ],
                  ...[
                    const SectionPage('Testing'),
                  ],
                ],
                ...[
                  const SectionPage('🐘 in the Room'),
                  const SummaryPage(
                    title: 'Simpler',
                    subtitle: 'All at Once',
                  ),
                  const SummaryPage(
                    title: 'Harder',
                    subtitle: 'Piece by Piece',
                  ),
                ],
                const ThatsAll(thanks: 'Thank you!'),
              ],
            ),
            Positioned(
              bottom: 0,
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
                            textStyle:
                                Theme.of(context).textTheme.headline4.copyWith(
                                      color: (page.round() == 0
                                              ? Colors.black
                                              : Colors.white)
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
        ),
      ),
    );
  }
}
