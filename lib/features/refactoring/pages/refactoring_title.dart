import 'package:flutter/material.dart';

class RefactoringTitle extends StatefulWidget {
  const RefactoringTitle({Key? key}) : super(key: key);

  @override
  _RefactoringTitleState createState() => _RefactoringTitleState();
}

const text1 = 'Refactoring';
const text = 'Refaciortng';

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
          vertical: 0,
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
            vertical: 0,
            width: element.letter,
            index: index,
          ));
      }
      return letters;
    },
  );
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
        if (_controllerV1.value >= 0.7 &&
            _controllerV2.status == AnimationStatus.dismissed) {
          _controllerV2.repeat(reverse: true);
        }
      })
      ..repeat(reverse: true);
    _controllerV2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controllerV1.dispose();
    _controllerV2.dispose();
    super.dispose();
  }

  double _horizontalOffset(int index) {
    const e = 5;
    final x = index - text.length / 2;
    return (x < 0 ? -1 : 1) * e * x * x;
  }

  double _verticalOffset(_Letter letter) {
    if (letter.letter == 'i') {
      return -140;
    } else if (letter.letter == 't') {
      return 140;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final animation1 = CurvedAnimation(
      parent: _controllerV1,
      curve: Curves.easeIn,
    );
    final animation2 = CurvedAnimation(
      parent: _controllerV2,
      curve: Curves.easeIn,
    );
    return Stack(
      children: [
        ...arrange(text).map((l) {
          return Animation1(
            l,
            horizontalOffset: _horizontalOffset(l.index) * animation1.value,
            verticalOffset: _verticalOffset(l) * animation2.value,
          );
        }),
      ],
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
        style: Theme.of(context).textTheme.headline4,
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
