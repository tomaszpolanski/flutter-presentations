import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:flutter_presentations/features/coding/pages/split.dart';
import 'package:flutter_presentations/shared/colors.dart';

class Editor extends StatelessWidget {
  const Editor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EditorColor.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          EditorLine('class Editor extends StatelessWidget {'),
          EditorLine('  const Editor({Key key}) : super(key: key);'),
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
    RegExp(r'[{}()<>]'),
    onMatch: (m) => BracketsSpan.create('${m.group(0)}'),
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
  };

  static bool match(String data) => words.contains(data);

  static InlineSpan create(String data) {
    return TextSpan(
      text: data,
      style: TextStyle(color: EditorColor.keyword),
    );
  }
}

class BracketsSpan {
  static InlineSpan create(String data) {
    return TextSpan(
      text: data,
      style: TextStyle(color: EditorColor.brackets),
    );
  }
}

class PlainSpan {
  static InlineSpan create(String data) {
    return TextSpan(
      text: data,
      style: TextStyle(color: EditorColor.plain),
    );
  }
}

//static const Color background = Color(0xFF2B2B2B);
//static const Color plain = Color(0xFFa9b7c6);
//static const Color keyword = Color(0xFFcc7832);
//static const Color clazz = Color(0xFFffc66d);
//static const Color number = Color(0xFF6897bb);
//static const Color value = Color(0xFF9876aa);
//static const Color text = Color(0xFF6a8759);
//static const Color brackets = Color(0xFFe6b422);
