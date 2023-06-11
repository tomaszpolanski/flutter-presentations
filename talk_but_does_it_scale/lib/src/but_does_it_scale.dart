import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_ui/shared_ui.dart';
import 'package:talk_but_does_it_scale/src/images.dart';
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
            SpeakersIntro(presentationController),
            WhatIsScale(presentationController),
            TimelinePage(
              presentationController,
              current: 'First Day',
            ),
            TimelinePage(
              presentationController,
              current: 'First Day',
              next: 'Test All',
            ),
            TimelinePage(
              presentationController,
              current: 'Test All',
              next: '...',
            ),
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
