import 'package:flutter/material.dart';
import 'package:presentation/effects.dart';

class SectionPage extends StatelessWidget {
  const SectionPage(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ParallaxWidget(
                translationFactor: 150,
                child: Container(
                  color: Theme.of(context).textTheme.titleLarge!.color,
                  height: 8,
                  width: 100,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  const ImagePage(
    this.asset, {
    super.key,
    required this.package,
    this.child,
    this.alignment = AlignmentDirectional.topCenter,
  });

  final String asset;
  final String package;
  final AlignmentGeometry alignment;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final _child = child;
    return Stack(
      fit: StackFit.expand,
      children: [
        ParallaxImage(
          asset,
          package: package,
        ),
        if (_child != null)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Align(
                alignment: alignment,
                child: ParallaxWidget(
                  child: _child,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class SummaryPage extends StatelessWidget {
  const SummaryPage({
    super.key,
    required this.title,
    required this.subtitle,
    this.background,
  });

  final String title;
  final String subtitle;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return SummaryWidgetPage(
      title: Text(title),
      subtitle: Text(subtitle),
      background: background,
    );
  }
}

class SummaryWidgetPage extends StatelessWidget {
  const SummaryWidgetPage({
    super.key,
    required this.title,
    required this.subtitle,
    this.background,
  });

  final Widget title;
  final Widget subtitle;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background ?? Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ParallaxWidget(
                    translationFactor: 150,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Theme.of(context).textTheme.titleLarge!.color,
                        height: 8,
                        width: 100,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: DefaultTextStyle.merge(
                    style: Theme.of(context).textTheme.titleLarge,
                    child: title,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.end,
                child: subtitle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
