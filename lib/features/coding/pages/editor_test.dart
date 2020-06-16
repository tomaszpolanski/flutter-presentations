import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/coding/coding.dart';
import 'package:presentation/presentation.dart';

class EditorTest extends StatefulWidget {
  const EditorTest({Key key}) : super(key: key);
  @override
  _EditorTestState createState() => _EditorTestState();
}

class _EditorTestState extends State<EditorTest> {
  Brightness _brightness = Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _brightness = _brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark;
        });
      },
      child: Editor(
        test,
        brightness: _brightness,
        padding: const EdgeInsets.only(left: 60),
        children: const [
          AnimatedColor(
            begin: Colors.red,
            end: Colors.yellowAccent,
            child: SizedBox(
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
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
      builder: (context, {0}) {
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

const test2 = r'''
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
''';
