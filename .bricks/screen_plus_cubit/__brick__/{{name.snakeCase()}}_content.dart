import 'package:flutter/material.dart';

class {{name.pascalCase()}}Content extends StatelessWidget {
  const {{name.pascalCase()}}Content({
    required this.number,
    Key? key,
  }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) => Text('$number');
}
