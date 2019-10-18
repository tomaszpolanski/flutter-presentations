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
    return Container(
      color: EditorColor.background.lerp(_controller.value),
      child: Scrollbar(
        child: ListView(
          padding: widget.padding,
          children: [
            for (final line in widget.data.split('\r\n'))
              EditorLine(
                line,
                animation: _controller,
              ),
          ],
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
    _createSpans(RegExp(r'\s+'), EditorColor.plain, _createBrackets)(
      data,
      animation,
    );

Iterable<InlineSpan> _createBrackets(
        String word, Animation<double> animation) =>
    _createSpans(RegExp(r'[\[\]{}()<>]'), EditorColor.brackets, _createStrings)(
      word,
      animation,
    );

Iterable<InlineSpan> _createStrings(String word, Animation<double> animation) =>
    _createSpans(RegExp(r"'.+'"), EditorColor.text, _createValue)(
      word,
      animation,
    );

Iterable<InlineSpan> _createValue(String word, Animation<double> animation) =>
    splitMapJoin(
      word,
      RegExp(r'\.(\w+[\w\d]+)'),
      onMatch: (m) => TextSpan(
        children: [
          const TextSpan(text: '.'),
          TextSpan(
            text: m.group(0).replaceAll('.', ''),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: EditorColor.value.lerp(animation.value),
            ),
          ),
        ],
      ),
      onNonMatch: (m) => _createAt(m, animation),
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
        Pattern pattern, EditorColor color, _SpanCreator next) =>
    (String word, Animation<double> animation) => splitMapJoin(
          word,
          pattern,
          onMatch: (m) => TextSpan(
            text: m.group(0),
            style: TextStyle(color: color.lerp(animation.value)),
          ),
          onNonMatch: (m) => next(m, animation),
        );

const _keywords = {
  'class',
  'extends',
  'const',
  'this',
  'super',
  'final',
  'return',
  'import',
  'true',
  'false',
};

const _classes = {
  'build',
  'LayoutBuilder',
  'Stack',
  'SizedBox',
};
