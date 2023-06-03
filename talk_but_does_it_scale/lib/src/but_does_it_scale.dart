import 'package:flutter/material.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_ui/shared_ui.dart';

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
    return Theme(
      data: blueLight(),
      child: Scaffold(
        body: Builder(
          builder: (_) {
            final children = [
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
                        'assets/fluttercon.svg',
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
      ),
    );
  }
}
