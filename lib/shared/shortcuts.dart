import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

class PresentationShortcuts extends StatelessWidget {
  const PresentationShortcuts({
    super.key,
    required this.child,
    required this.navigator,
  });

  final Widget child;
  final NavigatorState? navigator;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.f11): ToggleFullScreenIntent(),
        SingleActivator(LogicalKeyboardKey.escape): GoBackIntent(),
      },
      child: Builder(
        builder: (context) {
          return Actions(
            actions: <Type, Action<Intent>>{
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
                  final isFullScreen =
                      await WindowManager.instance.isFullScreen();
                  if (isFullScreen) {
                    await WindowManager.instance.setFullScreen(false);
                  } else if (navigator?.canPop() ?? false) {
                    navigator?.pop();
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
