import 'package:flutter/material.dart';

class RefactoringTitle extends StatelessWidget {
  const RefactoringTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...'Refactoring'.split('').fold<List<_Letter>>(
          [],
          (previousValue, element) {
            final letters = <_Letter>[];
            if (previousValue.isEmpty) {
              letters.add(_Letter(element, offset: 400, width: element.letter));
            } else {
              letters
                ..addAll(previousValue)
                ..add(_Letter(
                  element,
                  offset: previousValue.last.offset + previousValue.last.width,
                  width: element.letter,
                ));
            }
            return letters;
          },
        ).toList(),
      ],
    );
  }
}

class _Letter extends StatelessWidget {
  const _Letter(
    this.letter, {
    required this.offset,
    required this.width,
    Key? key,
  }) : super(key: key);

  final String letter;
  final double offset;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset,
      top: 300,
      child: Text(
        letter,
        style: Theme.of(context).textTheme.headline4,
      ),
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
