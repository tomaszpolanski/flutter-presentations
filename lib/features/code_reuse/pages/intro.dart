import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_theme/shared_theme.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.white,
                Colors.white,
                Colors.transparent,
                Colors.transparent,
              ],
              stops: [0, 0.3, 0.9, 1],
            ),
          ),
        ),
        _LineDecoration(),
        Padding(
          padding: const EdgeInsets.all(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DefaultTextStyle.merge(
                  style: Theme.of(context).textTheme.headlineSmall,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headlineSmall,
                          text: 'True ',
                          children: [
                            TextSpan(
                              text: 'Code',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: GTheme.flutter2,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            const TextSpan(
                              text: '\nEffort ',
                              style: TextStyle(color: GTheme.flutter3),
                            ),
                            const TextSpan(text: 'Reusability'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.bodySmall,
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tomek Polański',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text('@tpolansk'),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _LineDecoration extends StatefulWidget {
  @override
  __LineDecorationState createState() => __LineDecorationState();
}

class __LineDecorationState extends State<_LineDecoration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
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
    if (AnimationMode.of(context)) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Transform(
        transform: Matrix4.skewX(0.53),
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.translate(
              offset: Offset(200 + -100 * _controller.value, 0),
              child: child,
            );
          },
          child: Container(
            width: 100,
            color: GTheme.flutter3,
          ),
        ),
      ),
    );
  }
}
