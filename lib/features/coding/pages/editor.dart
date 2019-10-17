import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:flutter_presentations/features/coding/pages/split.dart';
import 'package:flutter_presentations/shared/colors.dart';

class Editor extends StatelessWidget {
  const Editor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EditorColor.background,
      child: ListView(
        children: [
          for (final line in test.split('\r\n')) EditorLine(line),
        ],
      ),
    );
  }
}

class EditorLine extends StatelessWidget {
  const EditorLine(this.data, {Key key}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: create(data)),
      style: TextStyle(
        fontFamily: 'Consolas',
        fontWeight: FontWeight.w300,
        color: EditorColor.plain,
        fontSize: 20,
      ),
    );
  }
}

List<InlineSpan> create(String data) {
  return splitMapJoin(
    data,
    RegExp(r'\s+'),
    onMatch: (m) => PlainSpan.create('${m.group(0)}'),
    onNonMatch: (m) => createBrackets(m),
  ).toList(growable: false);
}

Iterable<InlineSpan> createBrackets(String word) {
  return splitMapJoin(
    word,
    RegExp(r'[\[\]{}()<>]'),
    onMatch: (m) => BracketsSpan.create('${m.group(0)}'),
    onNonMatch: (m) => createStrings(m),
  );
}

Iterable<InlineSpan> createStrings(String word) {
  return splitMapJoin(
    word,
    RegExp(r"'.+'"),
    onMatch: (m) => StringTextSpan.create('${m.group(0)}'),
    onNonMatch: (m) => createWords(m),
  );
}

Iterable<InlineSpan> createWords(String word) sync* {
  if (KeywordSpan.match(word)) {
    yield KeywordSpan.create(word);
  } else {
    yield PlainSpan.create(word);
  }
}

class KeywordSpan {
  static const words = {
    'class',
    'extends',
    'const',
    'this',
    'super',
    'final',
    'return',
    'import',
    ';',
    ',',
    'true,',
    'false,',
  };

  static bool match(String data) => words.contains(data);

  static InlineSpan create(String data) {
    return TextSpan(
      text: data,
      style: const TextStyle(color: EditorColor.keyword),
    );
  }
}

class BracketsSpan {
  static InlineSpan create(String data) {
    return TextSpan(
      text: data,
      style: const TextStyle(color: EditorColor.brackets),
    );
  }
}

class StringTextSpan {
  static InlineSpan create(String data) {
    return TextSpan(
      text: data,
      style: const TextStyle(color: EditorColor.text),
    );
  }
}

class PlainSpan {
  static InlineSpan create(String data) {
    return TextSpan(
      text: data,
      style: const TextStyle(color: EditorColor.plain),
    );
  }
}

const test = '''
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatelessWidget {
  const QrCode({
    @required this.child,
    Key key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        return Stack(
          alignment: Alignment.center,
          children: [
            QrImage(
              data: 'https://github.com/tomaszpolanski/flutter-presentations',
              version: QrVersions.auto,
              gapless: true,
            ),
            SizedBox(
              height: c.biggest.shortestSide / 4.5,
              width: c.biggest.shortestSide / 4.5,
              child: child,
            ),
          ],
        );
      },
    );
  }
}
''';
