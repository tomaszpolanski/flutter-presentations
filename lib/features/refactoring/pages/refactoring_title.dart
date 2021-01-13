import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class RefactoringTitle extends StatefulWidget {
  const RefactoringTitle({Key? key}) : super(key: key);

  @override
  _RefactoringTitleState createState() => _RefactoringTitleState();
}

const text = 'Refactoring';
const text1 = 'Reftcaoring';
const text2 = 'Reftraocing';
const text3 = 'reftRaocing';

const letterWidth = 110.0;
const lineHeight = 210.0;

Iterable<_Letter> arrange(String text) {
  return text.split('').mapIndexed((index, element) => _Letter(
        element,
        horizontal: 400,
        vertical: 0,
        width: 110,
        index: index,
      ));
}

class _RefactoringTitleState extends State<RefactoringTitle>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;

  @override
  void initState() {
    _controllers = [
      AnimationController(vsync: this, duration: const Duration(seconds: 1)),
      AnimationController(vsync: this, duration: const Duration(seconds: 1)),
      AnimationController(vsync: this, duration: const Duration(seconds: 1)),
      AnimationController(vsync: this, duration: const Duration(seconds: 1)),
      AnimationController(vsync: this, duration: const Duration(seconds: 1)),
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
          curve: Curves.linear,
        ),
      );
    } else if (_controllers[2].isAnimating) {
      return Anim2(
        text1,
        first: 'c',
        second: 'r',
        animation: CurvedAnimation(
          parent: _controllers[2],
          curve: Curves.linear,
        ),
      );
    } else if (_controllers[3].isAnimating) {
      return Anim2(
        text2,
        first: 'R',
        second: 'r',
        animation: CurvedAnimation(
          parent: _controllers[3],
          curve: Curves.linear,
        ),
      );
    } else if (_controllers[4].isAnimating) {
      return Anim3(
        text3,
        animation: CurvedAnimation(
          parent: _controllers[4],
          curve: Curves.linear,
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
    return Stack(
      children: [
        ...letters.map((l) {
          return Positioned(
            left: l.horizontal +
                ((text.length * animation.value) * letterWidth)
                    .clamp(0.0, l.index * letterWidth),
            top: 300 + l.vertical,
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
    return Stack(
      children: [
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

          return Positioned(
            left: l.horizontal + l.index * letterWidth + horizontal,
            top: 300 + l.vertical + vertical,
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
    return Stack(
      children: [
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

          return Positioned(
            left: (horizontal?.value ?? 0.0) +
                l.horizontal +
                l.index * letterWidth,
            top: (vertical1?.value ?? 0.0) +
                (vertical2?.value ?? 0.0) +
                300 +
                l.vertical,
            child: SingleLetter(l.letter),
          );
        }),
      ],
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

class Animation1 extends StatelessWidget {
  const Animation1(
    this.l, {
    required this.horizontalOffset,
    required this.verticalOffset,
    Key? key,
  }) : super(key: key);
  final _Letter l;

  final double horizontalOffset;
  final double verticalOffset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: l.horizontal + horizontalOffset,
      top: 300 + l.vertical + verticalOffset,
      child: Text(
        l.letter,
        style: GoogleFonts.robotoMono(
          textStyle: const TextStyle(
            color: GTheme.flutter1,
            fontWeight: FontWeight.bold,
            fontSize: 200,
          ),
        ),
      ),
    );
  }
}

class _Letter {
  const _Letter(
    this.letter, {
    required this.horizontal,
    required this.vertical,
    required this.width,
    required this.index,
  });

  final String letter;
  final double horizontal;
  final double vertical;
  final double width;
  final int index;

  _Letter copyWith({
    double? horizontal,
    double? vertical,
    double? width,
    int? index,
  }) {
    return _Letter(
      letter,
      horizontal: horizontal ?? this.horizontal,
      vertical: vertical ?? this.vertical,
      width: width ?? this.width,
      index: index ?? this.index,
    );
  }
}

extension IterableEx<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(R Function(int index, T) mapper) sync* {
    int i = 0;
    for (final value in this) {
      yield mapper(i++, value);
    }
  }
}
