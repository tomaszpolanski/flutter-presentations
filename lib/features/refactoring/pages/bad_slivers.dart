import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class BadSlivers extends StatelessWidget {
  const BadSlivers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 700,
        child: AppFrame(
          title: Text('Bad'),
          child: Placeholder(),
        ),
      ),
    );
  }
}
