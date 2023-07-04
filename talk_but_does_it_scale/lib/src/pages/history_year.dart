import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_theme/shared_theme.dart';
import 'package:shared_ui/shared_ui.dart';

class YearStats extends StatefulWidget {
  const YearStats(
    this.controller, {
    super.key,
    required this.developerCount,
    required this.dartFileCount,
    required this.testFileCount,
    required this.date,
  })  : assert(developerCount >= 0),
        assert(dartFileCount >= 0),
        assert(testFileCount >= 0);

  final int developerCount;
  final int dartFileCount;
  final int testFileCount;
  final DateTime date;

  final PresentationController controller;

  @override
  State<YearStats> createState() => _YearStatsState();
}

enum _Step { devs, files, tests, next }

class _YearStatsState extends State<YearStats>
    with SingleTickerProviderStateMixin {
  late PageStepper<_Step> _stateController;
  bool _showDartFiles = false;
  bool _showTestFiles = false;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.devs,
        toStep: _Step.files,
        forward: () => setState(() {
          _showDartFiles = true;
        }),
        reverse: () => setState(() {
          _showDartFiles = false;
        }),
      )
      ..add(
        fromStep: _Step.files,
        toStep: _Step.tests,
        forward: () => setState(() {
          _showTestFiles = true;
        }),
        reverse: () => setState(() {
          _showTestFiles = false;
        }),
      )
      ..add(
        fromStep: _Step.tests,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..build();
  }

  @override
  void dispose() {
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TitledPage(
      title: Text('${widget.date.year}'),
      child: DefaultTextStyle.merge(
        style: GTheme.big.copyWith(fontSize: 80),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _Stage('${widget.developerCount} 👨‍💻', visible: true),
              _Stage(
                '${widget.dartFileCount} dart files',
                visible: _showDartFiles,
              ),
              _Stage(
                '${widget.testFileCount} test files',
                visible: _showTestFiles,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Stage extends StatelessWidget {
  const _Stage(
    this.data, {
    super.key,
    required this.visible,
    this.style,
  });

  final String data;
  final bool visible;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return FadeInVisibility(
      visible: visible,
      child: Text(
        data,
        style: style ?? const TextStyle(color: GTheme.flutter3),
      ),
    );
  }
}
