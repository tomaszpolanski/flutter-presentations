import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';

class NullSafety extends StatelessWidget {
  const NullSafety({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Content(
      subtitle: '🚧 avoid ❗ 🚧',
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({this.subtitle, Key? key}) : super(key: key);

  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    if (subtitle != null) {
      return SummaryPage(
        title: 'Null Safety',
        subtitle: subtitle!,
      );
    } else {
      return const SectionPage('Null Safety');
    }
  }
}

// ignore: unused_element
class _ContentRefactored extends StatelessWidget {
  const _ContentRefactored({this.subtitle, Key? key}) : super(key: key);

  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final s = subtitle;
    if (s != null) {
      return SummaryPage(
        title: 'Null Safety',
        subtitle: s,
      );
    } else {
      return const SectionPage('Null Safety');
    }
  }
}
