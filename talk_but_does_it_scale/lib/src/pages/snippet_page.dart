import 'package:flutter/material.dart';

import 'package:shared_ui/shared_ui.dart';
import 'package:shared_pages/shared_pages.dart';

class SnippetPage extends StatelessWidget {
  const SnippetPage({
    super.key,
    required this.title,
    required this.child,
  });

  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TiteledPage(
      title: title,
      // Should be only used for graphs
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Snippet(
            child: child,
          ),
        ),
      ),
    );
  }
}
