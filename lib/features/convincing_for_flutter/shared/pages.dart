import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/effects.dart';

class SectionPage extends StatelessWidget {
  const SectionPage(this.text, {Key key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
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
                  color: Theme.of(context).textTheme.headline6.color,
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
              style: Theme.of(context).textTheme.headline6,
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
    @required this.title,
    @required this.subtitle,
    this.background,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Color background;

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
    Key key,
    @required this.title,
    @required this.subtitle,
    this.background,
  }) : super(key: key);

  final Widget title;
  final Widget subtitle;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background ?? Theme.of(context).accentColor,
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
                      color: Theme.of(context).textTheme.headline6.color,
                      height: 8,
                      width: 100,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: DefaultTextStyle.merge(
                  style: Theme.of(context).textTheme.headline6,
                  child: title,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: DefaultTextStyle.merge(
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.end,
              child: subtitle,
            ),
          )
        ],
      ),
    );
  }
}
