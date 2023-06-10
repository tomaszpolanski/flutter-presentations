import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_presentations/flutter_presentations.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:window_manager/window_manager.dart';

class PresentationShortcuts extends StatelessWidget {
  const PresentationShortcuts({
    super.key,
    required this.child,
    required this.navigator,
  });

  final Widget child;
  final ValueGetter<NavigatorState?> navigator;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.f11): ToggleFullScreenIntent(),
        SingleActivator(LogicalKeyboardKey.escape): GoBackIntent(),
        SingleActivator(LogicalKeyboardKey.f12): ToggleTheme(),
      },
      child: Builder(
        builder: (context) {
          return Actions(
            actions: <Type, Action<Intent>>{
              ToggleTheme: CallbackAction(
                onInvoke: (_) async {
                  ThemeSwitcher.maybeOf(context)?.date = blueDark();
                  return null;
                },
              ),
              ToggleFullScreenIntent: CallbackAction(
                onInvoke: (_) async {
                  final isFullScreen =
                      await WindowManager.instance.isFullScreen();
                  await WindowManager.instance.setFullScreen(!isFullScreen);
                  return null;
                },
              ),
              GoBackIntent: CallbackAction(
                onInvoke: (a) async {
                  final _navigator = navigator();
                  final isFullScreen =
                      await WindowManager.instance.isFullScreen();
                  if (isFullScreen) {
                    await WindowManager.instance.setFullScreen(false);
                  } else if (_navigator?.canPop() ?? false) {
                    _navigator?.pop();
                  }

                  return null;
                },
              ),
            },
            child: child,
          );
        },
      ),
    );
  }
}

class ToggleFullScreenIntent extends Intent {
  const ToggleFullScreenIntent();
}

class GoBackIntent extends Intent {
  const GoBackIntent();
}

class ToggleTheme extends Intent {
  const ToggleTheme();
}
