import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:flutter_presentations/features/coding/pages/split.dart';
import 'package:flutter_presentations/shared/colors.dart';

class Editor extends StatefulWidget {
  const Editor({Key key}) : super(key: key);

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..value = 1;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.lerp(
        EditorDartColor.background,
        EditorLightColor.background,
        _controller.value,
      ),
      child: ListView(
        children: [
          for (final line in test.split('\r\n'))
            EditorLine(
              line,
              animation: _controller,
            ),
        ],
      ),
    );
  }
}

class EditorLine extends StatelessWidget {
  const EditorLine(
    this.data, {
    @required this.animation,
    Key key,
  }) : super(key: key);

  final String data;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: create(data, animation)),
      style: TextStyle(
        fontFamily: 'Consolas',
        fontWeight: FontWeight.w300,
        color: Color.lerp(
          EditorDartColor.plain,
          EditorLightColor.plain,
          animation.value,
        ),
        fontSize: 20,
      ),
    );
  }
}

List<InlineSpan> create(String data, Animation<double> animation) {
  return splitMapJoin(
    data,
    RegExp(r'\s+'),
    onMatch: (m) => TextSpan(
      text: '${m.group(0)}',
      style: TextStyle(
        color: Color.lerp(
          EditorDartColor.plain,
          EditorLightColor.plain,
          animation.value,
        ),
      ),
    ),
    onNonMatch: (m) => createBrackets(m, animation),
  ).toList(growable: false);
}

Iterable<InlineSpan> createBrackets(String word, Animation<double> animation) {
  return splitMapJoin(
    word,
    RegExp(r'[\[\]{}()<>]'),
    onMatch: (m) => TextSpan(
      text: '${m.group(0)}',
      style: TextStyle(
        color: Color.lerp(
          EditorDartColor.brackets,
          EditorLightColor.brackets,
          animation.value,
        ),
      ),
    ),
    onNonMatch: (m) => createStrings(m, animation),
  );
}

Iterable<InlineSpan> createStrings(String word, Animation<double> animation) {
  return splitMapJoin(
    word,
    RegExp(r"'.+'"),
    onMatch: (m) => TextSpan(
      text: '${m.group(0)}',
      style: TextStyle(
        color: Color.lerp(
          EditorDartColor.text,
          EditorLightColor.text,
          animation.value,
        ),
      ),
    ),
    onNonMatch: (m) => createValue(m, animation),
  );
}

Iterable<InlineSpan> createValue(String word, Animation<double> animation) {
  return splitMapJoin(
    word,
    RegExp(r'\.\w+[\w\d]+'),
    onMatch: (m) => TextSpan(
      text: '${m.group(0)}',
      style: TextStyle(
        color: Color.lerp(
          EditorDartColor.value,
          EditorLightColor.value,
          animation.value,
        ),
      ),
    ),
    onNonMatch: (m) => createAt(m, animation),
  );
}

Iterable<InlineSpan> createAt(String word, Animation<double> animation) {
  return splitMapJoin(
    word,
    RegExp('@'),
    onMatch: (m) => TextSpan(
      text: '${m.group(0)}',
      style: TextStyle(
        color: Color.lerp(
          EditorDartColor.at,
          EditorLightColor.at,
          animation.value,
        ),
      ),
    ),
    onNonMatch: (m) => createNumber(m, animation),
  );
}

Iterable<InlineSpan> createNumber(String word, Animation<double> animation) {
  return splitMapJoin(
    word,
    RegExp(r'\d'),
    onMatch: (m) => TextSpan(
      text: '${m.group(0)}',
      style: TextStyle(
        color: Color.lerp(
          EditorDartColor.number,
          EditorLightColor.number,
          animation.value,
        ),
      ),
    ),
    onNonMatch: (m) => createWords(m, animation),
  );
}

Iterable<InlineSpan> createWords(
    String word, Animation<double> animation) sync* {
  if (KeywordSpan.match(word)) {
    yield TextSpan(
      text: word,
      style: TextStyle(
        color: Color.lerp(
          EditorDartColor.keyword,
          EditorLightColor.keyword,
          animation.value,
        ),
      ),
    );
  } else if (ClassSpan.match(word)) {
    yield TextSpan(
      text: word,
      style: TextStyle(
        color: Color.lerp(
          EditorDartColor.clazz,
          EditorLightColor.clazz,
          animation.value,
        ),
      ),
    );
  } else {
    yield TextSpan(
      text: word,
      style: TextStyle(
        color: Color.lerp(
          EditorDartColor.plain,
          EditorLightColor.plain,
          animation.value,
        ),
      ),
    );
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
      style: const TextStyle(color: EditorDartColor.keyword),
    );
  }
}

class BracketsSpan {
  static InlineSpan create(String data) {
    return TextSpan(
      text: data,
      style: const TextStyle(color: EditorDartColor.brackets),
    );
  }
}

class StringTextSpan {
  static InlineSpan create(String data) {
    return TextSpan(
      text: data,
      style: const TextStyle(color: EditorDartColor.text),
    );
  }
}

class ValueSpan {
  static InlineSpan create(String data) {
    return TextSpan(
      children: [
        const TextSpan(text: '.'),
        TextSpan(
          text: data.replaceAll('.', ''),
          style: const TextStyle(color: EditorDartColor.value),
        ),
      ],
    );
  }
}

class AtSpan {
  static InlineSpan create(String data) {
    return TextSpan(
      text: data,
      style: const TextStyle(color: EditorDartColor.at),
    );
  }
}

class NumberSpan {
  static InlineSpan create(String data) {
    return TextSpan(
      text: data,
      style: const TextStyle(color: EditorDartColor.number),
    );
  }
}

class ClassSpan {
  static const words = {
    'build',
    'LayoutBuilder',
    'Stack',
    'SizedBox',
  };

  static bool match(String data) => words.contains(data);

  static InlineSpan create(String data) {
    return TextSpan(
      text: data,
      style: const TextStyle(color: EditorDartColor.clazz),
    );
  }
}

class PlainSpan {
  static InlineSpan create(String data) {
    return TextSpan(
      text: data,
      style: const TextStyle(color: EditorDartColor.plain),
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
