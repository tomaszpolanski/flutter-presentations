import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class RefactoringTitle extends StatefulWidget {
  const RefactoringTitle({Key? key}) : super(key: key);

  @override
  _RefactoringTitleState createState() => _RefactoringTitleState();
}

const text = 'Refactoring';
const text1 = 'Refaciortng';

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
  late AnimationController _controllerV1;
  late AnimationController _controllerV2;

  @override
  void initState() {
    _controllerV1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..addListener(() {
        setState(() {});
        if (_controllerV1.status == AnimationStatus.completed) {
          _controllerV2.forward();
        }
        if (_controllerV1.status == AnimationStatus.dismissed) {
          _controllerV1.forward();
        }
      })
      ..forward();
    _controllerV2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
        if (_controllerV2.status == AnimationStatus.dismissed) {
          _controllerV1.reverse();
        }
        if (_controllerV2.status == AnimationStatus.completed) {
          _controllerV2.reverse();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controllerV1.dispose();
    _controllerV2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation1 = CurvedAnimation(
      parent: _controllerV1,
      curve: Curves.easeIn,
    );
    final animation2 = CurvedAnimation(
      parent: _controllerV2,
      curve: Curves.linear,
    );
    return _controllerV2.isAnimating
        ? Anim2(text, animation: animation2)
        : Anim1(text, animation: animation1);
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
  const Anim2(this.data, {required this.animation, Key? key}) : super(key: key);
  final String data;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final letters = arrange(data);
    const first = 'f';
    const second = 'g';
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
