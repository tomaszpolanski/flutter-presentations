import 'package:flutter/material.dart';
import 'package:shared_ui/shared_ui.dart';

// TODO: Remove

class Tesssssst extends StatelessWidget {
  const Tesssssst({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Center(
        child: SizedBox(
          height: 300,
          width: 900,
          child: Align(
            child: const Snippet(
              child: Align(
                child: Placeholder(
                  fallbackHeight: 300,
                  fallbackWidth: 900,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
