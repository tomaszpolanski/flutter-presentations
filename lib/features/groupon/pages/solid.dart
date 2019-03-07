import 'package:flutter/widgets.dart';

class Solid extends StatefulWidget {
  @override
  _SolidState createState() => _SolidState();
}

class _SolidState extends State<Solid> {
  @override
  Widget build(BuildContext context) {
    const height = 140.0;
    return DefaultTextStyle.merge(
      style: TextStyle(fontSize: height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Letter('Single Responsibility Principle'),
          Transform.translate(
            offset: Offset(0, height * 1),
            child: _Letter('Open/Closed Principle'),
          ),
          Transform.translate(
            offset: Offset(0, height * 2),
            child: _Letter('Liskov Substitution Principle'),
          ),
          Transform.translate(
            offset: Offset(0, height * 3),
            child: _Letter('Interface Segregation Principle'),
          ),
          Transform.translate(
            offset: Offset(0, height * 4),
            child: _Letter('Dependency Inversion'),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(' . ');
  }
}

class _Letter extends StatelessWidget {
  const _Letter(this.text, {Key key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(text[0]),
      ],
    );
  }
}
