import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_presentations/shared/font_switcher.dart';
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
        SingleActivator(LogicalKeyboardKey.enter): ToggleFullScreenIntent(),
        SingleActivator(LogicalKeyboardKey.escape): GoBackIntent(),
        SingleActivator(LogicalKeyboardKey.f12): ToggleTheme(),
        SingleActivator(LogicalKeyboardKey.minus, control: true):
            FontDecreaseIntent(),
        SingleActivator(LogicalKeyboardKey.equal, control: true):
            FontIncreaseIntent(),
      },
      child: Builder(
        builder: (context) {
          return Actions(
            actions: <Type, Action<Intent>>{
              FontIncreaseIntent: CallbackAction(
                onInvoke: (_) async {
                  FontSwitcher.maybeOf(context)?.increase();
                  return null;
                },
              ),
              FontDecreaseIntent: CallbackAction(
                onInvoke: (_) async {
                  FontSwitcher.maybeOf(context)?.decrease();
                  return null;
                },
              ),
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

class FontIncreaseIntent extends Intent {
  const FontIncreaseIntent();
}

class FontDecreaseIntent extends Intent {
  const FontDecreaseIntent();
}
