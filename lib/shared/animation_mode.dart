import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimationMode extends InheritedWidget {
  const AnimationMode({
    Key key,
    @required this.enabled,
    Widget child,
  })  : assert(enabled != null),
        super(key: key, child: child);

  final bool enabled;

  static bool of(BuildContext context) {
    final AnimationMode widget =
        context.inheritFromWidgetOfExactType(AnimationMode);
    return widget?.enabled ?? true;
  }

  @override
  bool updateShouldNotify(AnimationMode oldWidget) =>
      enabled != oldWidget.enabled;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(FlagProperty(
      'mode',
      value: enabled,
      ifTrue: 'enabled',
      ifFalse: 'disabled',
      showName: true,
    ));
  }
}
