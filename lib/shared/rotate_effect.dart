import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/shared/page_transformer.dart';
import 'package:flutter_presentations/shared/presentation_page.dart';

class RotateWidget extends StatelessWidget {
  const RotateWidget({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final result = ScrollSettings.of(context);
    final resolver = PageVisibilityResolver(metrics: result);
    final index = PageViewSettings.of(context).index;
    final visibility = resolver.resolvePageVisibility(index);

    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()..rotateY(pi * visibility.pagePosition),
      child: child,
    );
  }
}
