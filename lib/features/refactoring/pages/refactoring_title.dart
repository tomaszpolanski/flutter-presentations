import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/big_applications/pages/big_intro.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:presentation/presentation.dart';

class RefactoringTitle extends StatelessWidget {
  const RefactoringTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned(
          right: 0,
          child: ClipPath(
            clipper: UpperClipper(),
            child: SizedBox(
              width: 2000,
              height: 300,
              child: FlutterProjects(),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: ClipPath(
            clipper: LowerClipper(),
            child: SizedBox(
              width: 2000,
              height: 300,
              child: FlutterProjects(),
            ),
          ),
        ),
        _Content(),
      ],
    );
  }
}

class UpperClipper extends CustomClipper<Path> {
  const UpperClipper();

  @override
  Path getClip(Size size) {
    final path = Path();

    final firstControlPoint = Offset(0.25 * size.width, size.height / 2);
    final firstPoint = Offset(size.width / 2, size.height / 2);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy,);

    final secondControlPoint = Offset(0.8 * size.width, 0.2 * size.height);
    final secondPoint = Offset(size.width, size.height);

    path
      ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondPoint.dx, secondPoint.dy,)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LowerClipper extends CustomClipper<Path> {
  const LowerClipper();

  @override
  Path getClip(Size size) {
    final path = Path();

    final firstControlPoint = Offset(0.25 * size.width, 0.9 * size.height);
    final firstPoint = Offset(size.width / 2, size.height / 2);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy,);

    final secondControlPoint = Offset(0.8 * size.width, size.height / 2);
    final secondPoint = Offset(size.width, size.height);

    path
      ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondPoint.dx, secondPoint.dy,)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _Content extends StatefulWidget {
  const _Content({super.key});

  @override
  _ContentState createState() => _ContentState();
}

const letterWidth = 110.0;
const lineHeight = 210.0;

Iterable<_Letter> arrange(String text) {
  return text.split('').mapIndexed((index, element) => _Letter(
        element,
        index: index,
      ),);
}

class _ContentState extends State<_Content> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;

  @override
  void initState() {
    _controllers = [
      AnimationController(vsync: this, duration: const Duration(seconds: 2)),
      AnimationController(vsync: this, duration: const Duration(seconds: 1)),
      AnimationController(vsync: this, duration: const Duration(seconds: 1)),
      AnimationController(vsync: this, duration: const Duration(seconds: 1)),
      AnimationController(vsync: this, duration: const Duration(seconds: 2)),
      AnimationController(vsync: this, duration: const Duration(seconds: 2)),
    ];
    _setupCyclicControllers(_controllers);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (AnimationMode.of(context)) {
      _controllers.first.forward();
    }
  }

  // ignore: unused_element
  void _setupReversedControllers(List<AnimationController> controllers) {
    for (var i = 0; i < controllers.length; i++) {
      final current = controllers[i];
      final next =
          i + 1 < controllers.length ? controllers[i + 1] : null;
      final prev = i - 1 >= 0 ? controllers[i - 1] : null;
      current.addListener(() {
        setState(() {});
        if (next != null) {
          if (current.status == AnimationStatus.completed) {
            next.forward();
          }
        } else {
          if (current.status == AnimationStatus.completed) {
            current.reverse();
          }
        }
        if (prev != null) {
          if (current.status == AnimationStatus.dismissed) {
            prev.reverse();
          }
        } else {
          if (current.status == AnimationStatus.dismissed) {
            current.forward();
          }
        }
      });
    }
  }

  void _setupCyclicControllers(List<AnimationController> controllers) {
    for (var i = 0; i < controllers.length; i++) {
      final current = controllers[i];
      final next =
          i + 1 < controllers.length ? controllers[i + 1] : null;
      current.addListener(() {
        setState(() {});
        if (current.status == AnimationStatus.completed) {
          if (next != null) {
            next.forward(from: 0);
          } else {
            controllers.first.forward(from: 0);
          }
        }
      });
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const text = 'Refactoring';

    if (_controllers[0].isAnimating) {
      return _ExpandAnimation(
        text,
        animation: CurvedAnimation(
          parent: _controllers[0],
          curve: Curves.easeIn,
        ),
      );
    } else if (_controllers[1].isAnimating) {
      return _SwapAnimation(
        text,
        first: 'a',
        second: 't',
        animation: CurvedAnimation(
          parent: _controllers[1],
          curve: Curves.bounceOut,
        ),
      );
    } else if (_controllers[2].isAnimating) {
      const text1 = 'Reftcaoring';

      return _SwapAnimation(
        text1,
        first: 'c',
        second: 'r',
        animation: CurvedAnimation(
          parent: _controllers[2],
          curve: Curves.fastLinearToSlowEaseIn,
        ),
      );
    } else if (_controllers[3].isAnimating) {
      const text2 = 'Reftraocing';
      return _SwapAnimation(
        text2,
        first: 'R',
        second: 'r',
        animation: CurvedAnimation(
          parent: _controllers[3],
          curve: Curves.easeOut,
        ),
      );
    } else if (_controllers[4].isAnimating) {
      const text3 = 'reftRaocing';
      return _ColorAnimation(
        text3,
        from: GTheme.flutter1,
        to: GTheme.flutter3,
        animation: CurvedAnimation(
          parent: _controllers[4],
          curve: Curves.linear,
        ),
      );
    } else if (_controllers[5].isAnimating) {
      const text3 = 'reftRaocing';
      return _CollapseAnimation(
        text3,
        animation: CurvedAnimation(
          parent: _controllers[5],
          curve: Curves.easeIn,
        ),
      );
    } else {
      return _ExpandAnimation(
        text,
        animation: CurvedAnimation(
          parent: _controllers[0],
          curve: Curves.easeIn,
        ),
      );
    }
  }
}

class _ExpandAnimation extends StatelessWidget {
  const _ExpandAnimation(this.data, {required this.animation, super.key});
  final String data;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final letters = arrange(data);
    return CenteredStack(
      builder: (_, middle) => [
        ...letters.map((l) {
          return PositionedSingleLetter(
            left: ((data.length * animation.value) * letterWidth)
                .clamp(0.0, l.index * letterWidth),
            top: 0,
            middle: middle,
            size: Size(data.length * letterWidth, lineHeight),
            child: SingleLetter(l.letter),
          );
        }),
      ],
    );
  }
}

class _SwapAnimation extends StatelessWidget {
  const _SwapAnimation(
    this.data, {
    required this.animation,
    required this.first,
    required this.second,
    super.key,
  });
  final String data;
  final String first;
  final String second;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final letters = arrange(data);
    return CenteredStack(
      builder: (_, middle) => [
        ...letters.map((l) {
          var horizontal = 0.0;
          var vertical = 0.0;
          if (l.letter == first || l.letter == second) {
            final x = animation.value * 15;
            final distance = l.letter == first
                ? data.indexOf(second) - data.indexOf(first)
                : data.indexOf(first) - data.indexOf(second);
            vertical = distance * 10 * (0.1 * (x * x) - 1.5 * x);
            horizontal = animation.value * distance * letterWidth;
          }

          return PositionedSingleLetter(
            left: l.index * letterWidth + horizontal,
            top: vertical,
            middle: middle,
            size: Size(data.length * letterWidth, lineHeight),
            child: SingleLetter(l.letter),
          );
        }),
      ],
    );
  }
}

class _ColorAnimation extends StatelessWidget {
  const _ColorAnimation(
    this.data, {
    required this.animation,
    required this.from,
    required this.to,
    super.key,
  });
  final String data;
  final Color from;
  final Color to;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final letters = arrange(data);

    return CenteredStack(
      builder: (_, middle) => [
        ...letters.map((l) {
          final step = 1 / letters.length;
          final index =
              l.index.isEven ? l.index / 2 : letters.length / 2 + l.index / 2;
          final color = ColorTween(
            begin: from,
            end: to,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(
                step * index,
                step * index + step,
              ),
            ),
          );

          return PositionedSingleLetter(
            left: l.index * letterWidth,
            top: 0,
            middle: middle,
            size: Size(data.length * letterWidth, lineHeight),
            child: SingleLetter(l.letter, color: color.value!),
          );
        }),
      ],
    );
  }
}

class _CollapseAnimation extends StatelessWidget {
  const _CollapseAnimation(
    this.data, {
    required this.animation,
    super.key,
  });
  final String data;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final letters = arrange(data);
    return CenteredStack(
      builder: (_, middle) => [
        ...letters.map((l) {
          Animation<double>? horizontal;
          Animation<double>? vertical1;
          Animation<double>? vertical2;
          if (l.index > 0) {
            vertical1 = Tween<double>(
              begin: 0,
              end: (l.index.isEven ? -1 : 1) * 250.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0, 0.3, curve: Curves.ease),
              ),
            );

            horizontal = Tween<double>(
              begin: 0,
              end: -l.index * letterWidth,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0.3, 0.6, curve: Curves.ease),
              ),
            );
            vertical2 = Tween<double>(
              begin: 0,
              end: (l.index.isEven ? 1 : -1) * 250.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0.6, 1, curve: Curves.ease),
              ),
            );
          }

          final color = ColorTween(
            begin: GTheme.flutter3,
            end: GTheme.flutter1,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
            ),
          );

          return PositionedSingleLetter(
            left: (horizontal?.value ?? 0.0) + l.index * letterWidth,
            top: (vertical1?.value ?? 0.0) + (vertical2?.value ?? 0.0),
            middle: middle,
            size: Size(data.length * letterWidth, lineHeight),
            child: SingleLetter(l.letter, color: color.value!),
          );
        }),
      ],
    );
  }
}

class PositionedSingleLetter extends StatelessWidget {
  const PositionedSingleLetter({
    super.key,
    required this.top,
    required this.left,
    required this.middle,
    required this.size,
    required this.child,
  });

  final double top;
  final double left;
  final Size middle;
  final Size size;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (middle.width - size.width / 2) + left,
      top: top + middle.height - size.height,
      child: child,
    );
  }
}

class CenteredStack extends StatelessWidget {
  const CenteredStack({
    required this.builder,
    super.key,
  });
  final List<Widget> Function(BuildContext context, Size middle) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, c) {
        return Stack(
          children: builder(
            context,
            Size(c.biggest.width / 2, c.biggest.height / 2),
          ),
        );
      },
    );
  }
}

class SingleLetter extends StatelessWidget {
  const SingleLetter(
    this.letter, {
    this.color = GTheme.flutter1,
    super.key,
  });

  final String letter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      letter,
      style: GoogleFonts.robotoMono(
        textStyle: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 200,
        ),
      ),
    );
  }
}

class _Letter {
  const _Letter(
    this.letter, {
    required this.index,
  });

  final String letter;
  final int index;
}

extension IterableEx<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(R Function(int index, T) mapper) sync* {
    var i = 0;
    for (final value in this) {
      yield mapper(i++, value);
    }
  }
}
