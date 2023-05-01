import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/coding/pages/editor_test.dart';
import 'package:flutter_presentations/features/coding/pages/qr_code.dart';
import 'package:flutter_presentations/shared/themes.dart';
import 'package:presentation/presentation.dart';

class Coding extends StatefulWidget {
  const Coding({super.key});

  static const String title = 'Coding in Flutter';
  static const String subtitle = 'WIP';

  @override
  _CodingState createState() => _CodingState();
}

class _CodingState extends State<Coding> {
  late PageController controller;
  late PresentationController presentationController;
  List<ValueGetter<Widget>>? pageCreator;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    presentationController = PresentationController(controller: controller);
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
      child: Material(
        color: Colors.white,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Presentation(
              controller: controller,
              presentationController: presentationController,
              children: [
                const EditorTest(),
                QrCode(
                  child: AnimatedColor(
                    begin: Colors.red,
                    end: Colors.yellowAccent,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(120),
                      ),
                      child: Image.asset('assets/tomek.png'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedColor extends StatefulWidget {
  const AnimatedColor({
    super.key,
    this.child,
    required this.begin,
    required this.end,
  });

  final Widget? child;
  final Color begin;
  final Color end;

  @override
  _AnimatedColorState createState() => _AnimatedColorState();
}

class _AnimatedColorState extends State<AnimatedColor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WrappedAnimatedBuilder<Color?>(
      animation: _controller.drive(ColorTween(
        begin: widget.begin,
        end: widget.end,
      ),),
      builder: (_, Animation<Color?> animation, child) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: animation.value,
          border: Border.all(color: Colors.transparent, width: 3),
        ),
        child: child,
      ),
      child: widget.child,
    );
  }
}
