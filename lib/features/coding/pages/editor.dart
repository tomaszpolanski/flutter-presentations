import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:flutter_presentations/features/coding/pages/split.dart';
import 'package:flutter_presentations/shared/colors.dart';

class Editor extends StatefulWidget {
  const Editor(
    this.data, {
    Key key,
    this.brightness = Brightness.dark,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final String data;
  final Brightness brightness;
  final EdgeInsetsGeometry padding;

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
    )
      ..value = widget.brightness == Brightness.dark ? 0 : 1
      ..addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Editor oldWidget) {
    if (oldWidget.brightness != widget.brightness) {
      if (widget.brightness == Brightness.dark) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final lines = widget.data.split('\r\n');
    return Container(
      color: EditorColor.background.lerp(_controller.value),
      child: Scrollbar(
        child: ListView.builder(
          padding: widget.padding,
          itemCount: lines.length,
          itemBuilder: (context, index) {
            return EditorLine(
              lines[index],
              animation: _controller,
            );
          },
        ),
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
      TextSpan(children: _create(data, animation).toList(growable: false)),
      style: TextStyle(
        fontFamily: 'Consolas',
        fontWeight: FontWeight.w300,
        color: EditorColor.plain.lerp(animation.value),
        fontSize: 20,
      ),
    );
  }
}

Iterable<InlineSpan> _create(String data, Animation<double> animation) =>
    _createSpans(RegExp(r'\s+'), EditorColor.plain, _createStrings)(
      data,
      animation,
    );

Iterable<InlineSpan> _createStrings(String word, Animation<double> animation) =>
    _createSpans(
      RegExp(r"'.+'"),
      EditorColor.text,
      _createKeywords,
      fontWeight: FontWeight.w700,
    )(
      word,
      animation,
    );

Iterable<InlineSpan> _createKeywords(
        String data, Animation<double> animation) =>
    _createSpans(
      RegExp(_keywords.map((it) => '\\b$it\\b').join('|')),
      EditorColor.keyword,
      _createValue,
      fontWeight: FontWeight.w700,
    )(
      data,
      animation,
    );

Iterable<InlineSpan> _createValue(String word, Animation<double> animation) =>
    splitMapJoin(
      word,
      RegExp(r'[\.|_](?=([a-z][\w\d]+))\1(?!\()'),
      onMatch: (m) {
        final first = m.group(0).substring(0, 1);
        return TextSpan(
          children: [
            if (first == '.') TextSpan(text: first),
            TextSpan(
              text: m.group(0).replaceAll('.', ''),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: EditorColor.value.lerp(animation.value),
              ),
            ),
          ],
        );
      },
      onNonMatch: (m) => _createBrackets(m, animation),
    );

Iterable<InlineSpan> _createBrackets(
        String word, Animation<double> animation) =>
    _createSpans(RegExp(r'[\[\]{}()<>]'), EditorColor.brackets, _createAt)(
      word,
      animation,
    );

Iterable<InlineSpan> _createAt(String word, Animation<double> animation) =>
    _createSpans(RegExp('@'), EditorColor.at, _createNumber)(word, animation);

Iterable<InlineSpan> _createNumber(String word, Animation<double> animation) =>
    _createSpans(RegExp(r'\d'), EditorColor.number, _createSeparator)(
      word,
      animation,
    );

Iterable<InlineSpan> _createSeparator(
        String word, Animation<double> animation) =>
    _createSpans(RegExp(r'[,;]'), EditorColor.keyword, _createWords)(
      word,
      animation,
    );

Iterable<InlineSpan> _createWords(
  String word,
  Animation<double> animation,
) sync* {
  if (_keywords.contains(word)) {
    yield TextSpan(
      text: word,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: EditorColor.keyword.lerp(animation.value),
      ),
    );
  } else if (_classes.contains(word)) {
    yield TextSpan(
      text: word,
      style: TextStyle(
        color: EditorColor.clazz.lerp(animation.value),
      ),
    );
  } else {
    yield TextSpan(text: word);
  }
}

typedef _SpanCreator = Iterable<InlineSpan> Function(
  String word,
  Animation<double> animation,
);

_SpanCreator _createSpans(
  Pattern pattern,
  EditorColor color,
  _SpanCreator next, {
  FontWeight fontWeight,
}) =>
    (String word, Animation<double> animation) => splitMapJoin(
          word,
          pattern,
          onMatch: (m) => TextSpan(
            text: m.group(0),
            style: TextStyle(
              color: color.lerp(animation.value),
              fontWeight: fontWeight,
            ),
          ),
          onNonMatch: (m) => next(m, animation),
        );

const _keywords = {
  'abstract',
  'dynamic',
  'implements',
  'show',
  'as',
  'else',
  'import',
  'static',
  'assert',
  'enum',
  'in',
  'super',
  'async',
  'export',
  'interface',
  'switch',
  'await',
  'extends',
  'is',
  'sync',
  'break',
  'external',
  'library',
  'this',
  'case',
  'factory',
  'mixin',
  'throw',
  'catch',
  'false',
  'new',
  'true',
  'class',
  'final',
  'null',
  'try',
  'const',
  'finally',
  'on',
  'typedef',
  'continue',
  'for',
  'operator',
  'var',
  'covariant',
  'part',
  'void',
  'default',
  'get',
  'rethrow',
  'while',
  'deferred',
  'hide',
  'return',
  'with',
  'do',
  'if',
  'set',
  'yield',
};

const _classes = {
  'build',
  'LayoutBuilder',
  'Stack',
  'SizedBox',
  'Duration',
  'AnimationController',
};
