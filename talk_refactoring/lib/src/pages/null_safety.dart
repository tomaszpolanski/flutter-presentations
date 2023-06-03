import 'package:flutter/material.dart';
import 'package:shared_pages/shared_pages.dart';

class NullSafety extends StatelessWidget {
  const NullSafety({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Content(
      subtitle: '🚧 avoid ❗ 🚧',
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({this.subtitle, super.key});

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
  const _ContentRefactored({this.subtitle, super.key});

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
