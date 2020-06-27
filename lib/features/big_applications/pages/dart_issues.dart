import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class DartIssues extends StatefulWidget {
  const DartIssues({Key key}) : super(key: key);

  @override
  _DartIssuesState createState() => _DartIssuesState();
}

class _DartIssuesState extends State<DartIssues> {
  Brightness _brightness = Brightness.light;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _brightness = _brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light;
        });
      },
      child: Editor(
        '$_invalid\n\n\n\n$_valid',
        brightness: _brightness,
        fontSize: 40,
        padding: const EdgeInsets.symmetric(vertical: 140, horizontal: 50),
      ),
    );
  }
}

const _invalid =
    'int descending<T>(T smaller, Comparable<T> larger) => larger.compareTo(smaller);';
const _valid =
    'int descending<T>(Comparable<T> smaller, Comparable<T> larger) => Comparable.compare(larger, smaller);';
