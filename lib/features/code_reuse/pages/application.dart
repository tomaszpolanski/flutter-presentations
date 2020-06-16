import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GrouponApp extends StatefulWidget {
  const GrouponApp({Key key}) : super(key: key);
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
                      child: Container(
                        color: Colors.transparent,
                        child: const Center(
                          child: Image(
                            image: AssetImage('assets/image7.png'),
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
