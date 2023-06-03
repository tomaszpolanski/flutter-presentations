import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/code_reuse/pages/thats_all.dart';
import 'package:flutter_presentations/shared/logo.dart';
import 'package:flutter_presentations/shared/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/presentation.dart';

class ButDoesItScale extends StatefulWidget {
  const ButDoesItScale({super.key});

  static const String title = 'But does it scale?';
  static const String subtitle = 'Yes!';

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
    return Theme(
      data: blueLight(),
      child: Scaffold(
        body: Builder(
          builder: (_) {
            final children = [
              /// Intro slide - nice animation
              ///
              /// What do I mean by scale?
              /// Not everythi
              const ThatsAll(thanks: 'Thank you!'),
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
                    child: SvgPicture.asset(
                      'assets/fluttercon.svg',
                      height: 25,
                      colorFilter: const ColorFilter.mode(
                        Colors.blue,
                        BlendMode.srcIn,
                      ),
                    ),
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
