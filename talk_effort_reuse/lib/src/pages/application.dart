import 'package:flutter/material.dart';
import 'package:talk_effort_reuse/src/images.dart';

class GrouponApp extends StatefulWidget {
  const GrouponApp({super.key});

  @override
  _GrouponAppState createState() => _GrouponAppState();
}

class _GrouponAppState extends State<GrouponApp> {
  bool _showSplash = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: FlutterLogo(
            size: 250,
            style: FlutterLogoStyle.stacked,
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              width: 480,
              margin: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                border: Border.all(width: 2),
              ),
              child: _showSplash
                  ? GestureDetector(
                      onTap: () => setState(() => _showSplash = false),
                      child: const ColoredBox(
                        color: Colors.transparent,
                        child: Center(
                          child: Image(
                            image: AssetImage(
                              Images.groupon_logo,
                              package: Images.package,
                            ),
                            height: 100,
                          ),
                        ),
                      ),
                    )
                  : const Placeholder(),
            ),
          ),
        ),
      ],
    );
  }
}
