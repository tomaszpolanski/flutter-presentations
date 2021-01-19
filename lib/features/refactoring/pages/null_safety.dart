import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/pages.dart';

class NullSafety extends StatelessWidget {
  const NullSafety({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _BeforeContent(
      subtitle: '🚧 avoid ❗ 🚧',
    );
  }
}

class _BeforeContent extends StatelessWidget {
  const _BeforeContent({this.subtitle, Key? key}) : super(key: key);

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
class _AfterContent extends StatelessWidget {
  const _AfterContent({this.subtitle, Key? key}) : super(key: key);

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
