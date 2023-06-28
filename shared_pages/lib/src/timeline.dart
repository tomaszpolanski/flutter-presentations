import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_ui/shared_ui.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage(
    this.controller, {
    super.key,
    required this.current,
    this.next,
  });

  final PresentationController controller;
  final String current;
  final String? next;

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

enum _Step {
  init,
  animation,
  end,
}

class _TimelinePageState extends State<TimelinePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  PageStepper<_Step>? _stateController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..addListener(() {
        setState(() {});
      });

    if (widget.next != null) {
      _stateController = PageStepper<_Step>(
        controller: widget.controller,
        steps: _Step.values,
      )
        ..add(
          fromStep: _Step.init,
          toStep: _Step.animation,
          forward: () => _controller.forward(),
          reverse: () => _controller.reverse(),
        )
        ..add(
          fromStep: _Step.animation,
          toStep: _Step.end,
          forward: () => widget.controller.nextSlide(),
        )
        ..addListener(() => setState(() {}))
        ..build();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final next = widget.next;
    final text = _controller.status == AnimationStatus.dismissed
        ? widget.current
        : next != null && _controller.status == AnimationStatus.completed
            ? next
            : null;
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 80, bottom: 20),
              child: text != null //
                  ? FadeInWidget(child: Text(text))
                  : const Text(''),
            ),
            ClipRect(
              child: CustomPaint(
                painter: TimelinePainter(
                  count: 20,
                  progress: _controller.value,
                  color: Theme.of(context).primaryColor,
                ),
                child: Container(
                  height: 300,
                ),
              ),
            ),
          ],
        ),
        CustomPaint(
          painter: TrianglePainter(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Container(),
        ),
      ],
    );
  }
}

class TimelinePainter extends CustomPainter {
  const TimelinePainter({
    required this.count,
    required this.progress,
    required this.color,
  });

  final int count;
  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width, size.height / 2);
    canvas.drawPath(path, paint);
    final distance = (2 * size.width) / count;
    final offset = 200 - size.width * progress;

    for (var i = 0; i < count; i++) {
      final isBig = i % (count / 2) == 0;
      path = Path()
        ..moveTo(
          offset + i * distance,
          isBig ? 0 : size.height * (4 / 10),
        )
        ..lineTo(
          offset + i * distance,
          isBig ? size.height : size.height * (6 / 10),
        );
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(TimelinePainter oldDelegate) {
    return progress != oldDelegate.progress || color != oldDelegate.color;
  }
}

class TrianglePainter extends CustomPainter {
  const TrianglePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.2, size.height)
      ..close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
