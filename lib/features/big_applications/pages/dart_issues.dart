import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class DartIssues extends StatelessWidget {
  const DartIssues({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Editor(
      '$_invalid\n\n\n\n$_valid',
      brightness: Brightness.light,
      padding: EdgeInsets.symmetric(vertical: 140, horizontal: 50),
    );
  }
}

const _invalid =
    'int descending<T>(T smaller, Comparable<T> larger) => larger.compareTo(smaller);';
const _valid =
    'int descending<T>(Comparable<T> smaller, Comparable<T> larger) => Comparable.compare(larger, smaller);';
