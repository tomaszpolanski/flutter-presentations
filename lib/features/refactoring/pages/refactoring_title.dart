import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/big_applications/pages/big_intro.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class RefactoringTitle extends StatelessWidget {
  const RefactoringTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned(
          right: 0,
          child: ClipPath(
            clipper: ClipPathClass(),
            child: SizedBox(
              width: 1500,
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

class ClipPathClass extends CustomClipper<Path> {
  const ClipPathClass();

  @override
  Path getClip(Size size) {
    final path = Path();

    final firstControlPoint = Offset(0.25 * size.width, size.height / 2);
    final firstPoint = Offset(size.width / 2, size.height / 2);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    final secondControlPoint = Offset(0.8 * size.width, size.height / 2);
    final secondPoint = Offset(size.width, size.height);

    path
      ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondPoint.dx, secondPoint.dy)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _Content extends StatefulWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

const letterWidth = 110.0;
const lineHeight = 210.0;

Iterable<_Letter> arrange(String text) {
  return text.split('').mapIndexed((index, element) => _Letter(
        element,
        index: index,
      ));
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
    ];
    _setupCyclicControllers(_controllers);
    _controllers.first.forward();
    super.initState();
  }

  void _setupReversedControllers(List<AnimationController> controllers) {
    for (var i = 0; i < controllers.length; i++) {
      final current = controllers[i];
      final AnimationController? next =
          i + 1 < controllers.length ? controllers[i + 1] : null;
      final AnimationController? prev = i - 1 >= 0 ? controllers[i - 1] : null;
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
      final AnimationController? next =
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
      return Anim1(
        text,
        animation: CurvedAnimation(
          parent: _controllers[0],
          curve: Curves.easeIn,
        ),
      );
    } else if (_controllers[1].isAnimating) {
      return Anim2(
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

      return Anim2(
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
      return Anim2(
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
      return Anim3(
        text3,
        animation: CurvedAnimation(
          parent: _controllers[4],
          curve: Curves.easeIn,
        ),
      );
    } else {
      return Anim1(
        text,
        animation: CurvedAnimation(
          parent: _controllers[0],
          curve: Curves.easeIn,
        ),
      );
    }
  }
}

class Anim1 extends StatelessWidget {
  const Anim1(this.data, {required this.animation, Key? key}) : super(key: key);
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

class Anim2 extends StatelessWidget {
  const Anim2(
    this.data, {
    required this.animation,
    required this.first,
    required this.second,
    Key? key,
  }) : super(key: key);
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

class Anim3 extends StatelessWidget {
  const Anim3(
    this.data, {
    required this.animation,
    Key? key,
  }) : super(key: key);
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

          return PositionedSingleLetter(
            left: (horizontal?.value ?? 0.0) + l.index * letterWidth,
            top: (vertical1?.value ?? 0.0) + (vertical2?.value ?? 0.0),
            middle: middle,
            size: Size(data.length * letterWidth, lineHeight),
            child: SingleLetter(l.letter),
          );
        }),
      ],
    );
  }
}

class PositionedSingleLetter extends StatelessWidget {
  const PositionedSingleLetter({
    Key? key,
    required this.top,
    required this.left,
    required this.middle,
    required this.size,
    required this.child,
  }) : super(key: key);

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
    Key? key,
  }) : super(key: key);
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
  const SingleLetter(this.letter, {Key? key}) : super(key: key);

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Text(
      letter,
      style: GoogleFonts.robotoMono(
        textStyle: const TextStyle(
          color: GTheme.flutter1,
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
    int i = 0;
    for (final value in this) {
      yield mapper(i++, value);
    }
  }
}
