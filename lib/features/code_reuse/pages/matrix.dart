import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:presentation/presentation.dart';

class Matrix extends StatefulWidget {
  const Matrix(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  _MatrixState createState() => _MatrixState();
}

enum _Step {
  init,
  typing,
  stop,
  next,
}

class _MatrixState extends State<Matrix> with SingleTickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  AnimationController _controller;
  String _text;
  bool _isBlinking = true;

  @override
  void initState() {
    final formattedDate =
        DateFormat('dd-MM-yy kk:mm:ss').format(DateTime.now());
    _text = 'Call trans opt: received. $formattedDate REC:Log>';
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    )..addStatusListener((status) {
        setState(() {
          _isBlinking = status == AnimationStatus.dismissed ||
              status == AnimationStatus.completed;
        });
      });
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.typing,
        forward: _controller.forward,
        reverse: _controller.reverse,
      )
      ..add(
        fromStep: _Step.typing,
        toStep: _Step.stop,
        forward: () => setState(() => _isBlinking = false),
        reverse: () => setState(() => _isBlinking = true),
      )
      ..add(
        fromStep: _Step.stop,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..addListener(() => setState(() {}))
      ..build();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: DefaultTextStyle.merge(
        style: const TextStyle(
          color: Color(0xFF48C979),
          fontFamily: 'AnonymousPro',
        ),
        child: WrappedAnimatedBuilder<double>(
          animation: _controller,
          builder: (_, animation, child) {
            return Wrap(
              children: [
                ..._text
                    .substring(0, (_text.length * animation.value).toInt())
                    .split('')
                    .map((letter) => _GlowingLetter(letter)),
                child,
              ],
            );
          },
          child: Cursor(isBlinking: _isBlinking),
        ),
      ),
    );
  }
}

class _GlowingLetter extends StatelessWidget {
  const _GlowingLetter(
    this.letter, {
    Key key,
  }) : super(key: key);

  final String letter;

  @override
  Widget build(BuildContext context) {
    return letter[0] != ' '
        ? Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF005122).withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Text(letter),
          )
        : Text(letter);
  }
}

class Cursor extends StatefulWidget {
  const Cursor({Key key, this.isBlinking}) : super(key: key);

  final bool isBlinking;

  @override
  _CursorState createState() => _CursorState();
}

class _CursorState extends State<Cursor> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _isVisible = true;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => _isVisible = false);
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        setState(() => _isVisible = true);
        _controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (AnimationMode.of(context) && widget.isBlinking) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(Cursor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (AnimationMode.of(context) && widget.isBlinking) {
      _controller.forward(from: 0);
    } else {
      _controller.stop(canceled: false);
      setState(() {
        _isVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Container(
        height: 60,
        width: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFA4F2DD),
          borderRadius: const BorderRadius.all(Radius.circular(1)),
          border: Border.all(color: const Color(0xFF48AB7F)),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF005122),
              blurRadius: 20,
              spreadRadius: 9,
            ),
          ],
        ),
      ),
    );
  }
}
