import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class RefactoringTitle extends StatefulWidget {
  const RefactoringTitle({Key? key}) : super(key: key);

  @override
  _RefactoringTitleState createState() => _RefactoringTitleState();
}

const text = 'Refactoring';

Iterable<_Letter> arrange(String text) {
  return text.split('').fold<List<_Letter>>(
    [],
    (previousValue, element) {
      final letters = <_Letter>[];
      if (previousValue.isEmpty) {
        const index = 0;
        letters.add(_Letter(
          element,
          horizontal: 400,
          width: element.letter,
          index: index,
        ));
      } else {
        final prev = previousValue.last;
        final index = prev.index + 1;
        letters
          ..addAll(previousValue)
          ..add(_Letter(
            element,
            horizontal: prev.horizontal + prev.width,
            width: element.letter,
            index: index,
          ));
      }
      return letters;
    },
  );
}

class _RefactoringTitleState extends State<RefactoringTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _offset(int index) {
    const e = 5;
    final x = index - text.length / 2;
    return (x < 0 ? -1 : 1) * e * x * x;
  }

  @override
  Widget build(BuildContext context) {
    return WrappedAnimatedBuilder<double>(
      animation: CurvedAnimation(parent: _controller, curve: Curves.easeIn),
      builder: (context, animation, _) {
        return Stack(
          children: [
            ...arrange(text).map((l) {
              return Animation1(
                l,
                offset: _offset(l.index) * animation.value,
              );
            }),
          ],
        );
      },
    );
  }
}

class Animation1 extends StatelessWidget {
  const Animation1(
    this.l, {
    required this.offset,
    Key? key,
  }) : super(key: key);
  final _Letter l;

  final double offset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: l.horizontal + offset,
      top: 300 + l.vertical,
      child: Text(
        l.letter,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class _Letter {
  const _Letter(
    this.letter, {
    required this.horizontal,
    this.vertical = 0,
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
    double? width,
    int? index,
  }) {
    return _Letter(
      letter,
      horizontal: horizontal ?? this.horizontal,
      width: width ?? this.width,
      index: index ?? this.index,
    );
  }
}

extension on String {
  double get letter {
    switch (this) {
      case 'R':
        return 95;
      case 'e':
        return 85;
      case 'f':
        return 55;
      case 'a':
        return 80;
      case 'c':
        return 85;
      case 't':
        return 55;
      case 'o':
        return 85;
      case 'r':
        return 55;
      case 'i':
        return 33;
      case 'n':
        return 90;
      case 'g':
        return 90;
      default:
        return 0;
    }
  }
}

// 955SY
