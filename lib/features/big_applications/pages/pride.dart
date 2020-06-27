import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';

class Pride extends StatelessWidget {
  const Pride({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Center(
        child: DefaultTextStyle.merge(
          style: Theme.of(context).textTheme.bodyText2,
          child: const Tooltip(
            message: 'Uncle Bob',
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: 'When someone first looks at ',
                  ),
                  TextSpan(
                    text: 'our code',
                    style: TextStyle(color: GTheme.flutter3),
                  ),
                  TextSpan(
                    text: ',\nwe want them to be ',
                  ),
                  TextSpan(
                    text: 'impressed',
                    style: TextStyle(color: GTheme.flutter3),
                  ),
                  TextSpan(text: ' by the '),
                  TextSpan(
                    text: 'attention',
                    style: TextStyle(color: GTheme.flutter3),
                  ),
                  TextSpan(text: ' to details.\n'),
                  TextSpan(
                    text: 'Struck',
                    style: TextStyle(color: GTheme.flutter3),
                  ),
                  TextSpan(text: ' by how '),
                  TextSpan(
                    text: 'orderly',
                    style: TextStyle(color: GTheme.flutter3),
                  ),
                  TextSpan(text: ' it is.\nConvinced that '),
                  TextSpan(
                    text: 'professionals',
                    style: TextStyle(color: GTheme.flutter3),
                  ),
                  TextSpan(text: ' were at work.'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
