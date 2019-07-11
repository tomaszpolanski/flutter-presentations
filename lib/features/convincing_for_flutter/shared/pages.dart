import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:presentation/effects.dart';

class SectionPage extends StatelessWidget {
  const SectionPage(this.text, {Key key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GTheme.green,
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
                  color: Colors.white,
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
              style: GTheme.big.copyWith(color: Colors.white),
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
    Key key,
    this.child,
    this.alignment = AlignmentDirectional.topCenter,
  }) : super(key: key);

  final String asset;
  final AlignmentGeometry alignment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ParallaxImage(asset),
        if (child != null)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Align(
                alignment: alignment,
                child: ParallaxWidget(
                  child: child,
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
    Key key,
    this.title,
    this.subtitle,
    this.background,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
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
                      color: Colors.white,
                      height: 8,
                      width: 100,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Text(
                  title,
                  style: GTheme.big.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              subtitle,
              textAlign: TextAlign.end,
              style: GTheme.big.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
