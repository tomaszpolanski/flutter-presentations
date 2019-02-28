import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/groupon/stats.dart';

class Languages extends StatefulWidget {
  const Languages({
    Key key,
    @required this.image,
    @required this.lineCount,
    @required this.subtitle,
  }) : super(key: key);

  final String image;
  final int lineCount;
  final String subtitle;

  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = _controller.drive(
      CurveTween(curve: Curves.easeOut),
    );
    return Row(
      children: [
        Expanded(
            child: Image(
          image: AssetImage(widget.image),
          height: 250.0,
        )),
        Expanded(
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        '${(animation.value * linePercentage(widget.lineCount)).toInt()}%'),
                    Opacity(
                      opacity: animation.value,
                      child: Text(
                        widget.subtitle,
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
