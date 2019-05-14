import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presentations/shared/utils.dart';
import 'package:presentation/presentation.dart';

class PlatformStack extends StatefulWidget {
  const PlatformStack(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  _PlatformStackState createState() => _PlatformStackState();
}

enum _Step {
  init,
  web,
  next,
}

class _PlatformStackState extends State<PlatformStack>
    with SingleTickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.web,
        forward: _controller.forward,
        reverse: _controller.reverse,
      )
      ..add(
        fromStep: _Step.web,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..addListener(() => setState(() {}))
      ..build();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.body1.copyWith(
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
      textAlign: TextAlign.center,
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _PlatformComponent(
              color: const Color(0xFF0F9D58),
              title: Text('Framework\n(Dart)'),
              children: const [
                _Layer(
                  children: const [
                    _TextCell(child: Text('Material')),
                    _TextCell(child: Text('Cupertino')),
                  ],
                ),
                _TextCell(child: Text('Widgets')),
                _TextCell(child: Text('Renderinig')),
                _Layer(
                  children: const [
                    _TextCell(child: Text('Animation')),
                    _TextCell(child: Text('Painting')),
                    _TextCell(child: Text('Gestures')),
                  ],
                ),
                _TextCell(child: Text('Foundation'))
              ],
            ),
            Stack(
              children: <Widget>[
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return FractionalTranslation(
                      translation: Offset(-_controller.value, 0),
                      child: child,
                    );
                  },
                  child: _PlatformComponent(
                    color: const Color(0xFF4285F4),
                    title: Text('Engine\n(C++)'),
                    children: const [
                      _Layer(
                        children: const [
                          _TextCell(
                            background: const Color(0xFF4285F4),
                            child: Text('Skia'),
                          ),
                          _TextCell(
                            background: const Color(0xFF4285F4),
                            child: Text('Dart'),
                          ),
                          _TextCell(
                            background: const Color(0xFF4285F4),
                            child: Text('Text'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return FractionalTranslation(
                      translation: Offset(, 0),
                      child: child,
                    );
                  },
                  child: _PlatformComponent(
                    color: const Color(0xFFF7AB2E),
                    title: Text('Browser\n(C++, JS)'),
                    children: const [
                      _Layer(
                        children: const [
                          _TextCell(
                            background: const Color(0xFFF7AB2E),
                            child: Text('Canvas'),
                          ),
                          _TextCell(
                            background: const Color(0xFFF7AB2E),
                            child: Text('JS Engine'),
                          ),
                          _TextCell(
                            background: const Color(0xFFF7AB2E),
                            child: Text('DOM'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PlatformComponent extends StatelessWidget {
  const _PlatformComponent({
    Key key,
    @required this.title,
    @required this.children,
    @required this.color,
  }) : super(key: key);

  final Widget title;
  final List<Widget> children;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.withOpacity(0.3),
      padding: EdgeInsets.all(30),
      child: Row(
        children: [
          Expanded(flex: 2, child: title),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...join(separator: SizedBox(height: 20), children: children)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Layer extends StatelessWidget {
  const _Layer({Key key, @required this.children}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final child in children) Expanded(flex: 1, child: child),
      ],
    );
  }
}

class _TextCell extends StatelessWidget {
  const _TextCell({
    Key key,
    this.background = const Color(0xFF0F9D58),
    this.child,
  }) : super(key: key);
  final Widget child;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      margin: EdgeInsets.only(right: 20),
      child: DefaultTextStyle.merge(
        style: TextStyle(color: Colors.white),
        child: child,
      ),
    );
  }
}
