import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/code_reuse/pages/thats_all.dart';
import 'package:flutter_presentations/shared/logo.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:presentation/presentation.dart';

class {{name.pascalCase()}} extends StatefulWidget {
  const {{name.pascalCase()}}({super.key});

  static const String title = '{{name.titleCase()}}';
  static const String subtitle = '{{description.sentenceCase()}}';

  @override
  _{{name.pascalCase()}}State createState() => _{{name.pascalCase()}}State();
}

class _{{name.pascalCase()}}State extends State<{{name.pascalCase()}}> {
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
                    child: const SizedBox(),
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
