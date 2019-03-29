import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// A class that can be used to compute visibility information about
/// the current page.
class PageVisibilityResolver {
  const PageVisibilityResolver({
    ScrollMetrics metrics,
    double viewPortFraction,
  })  : _pageMetrics = metrics,
        _viewPortFraction = viewPortFraction;

  final ScrollMetrics _pageMetrics;
  final double _viewPortFraction;

  /// Calculates visibility information for the page at [pageIndex].
  /// Used inside PageViews' itemBuilder, but can be also used in a
  /// simple PageView that simply has an array of children passed to it.
  PageVisibility resolvePageVisibility(int pageIndex) {
    final double pagePosition = _calculatePagePosition(pageIndex);
    final double visiblePageFraction =
        _calculateVisiblePageFraction(pageIndex, pagePosition);

    return PageVisibility(
      visibleFraction: visiblePageFraction,
      pagePosition: pagePosition,
    );
  }

  double _calculateVisiblePageFraction(int index, double pagePosition) =>
      pagePosition > -1.0 && pagePosition <= 1.0
          ? 1.0 - pagePosition.abs()
          : 0.0;

  double _calculatePagePosition(int index) {
    final double viewPortFraction = _viewPortFraction ?? 1.0;
    final double pageViewWidth =
        (_pageMetrics?.viewportDimension ?? 1.0) * viewPortFraction;
    final double pageX = pageViewWidth * index;
    final double scrollX = _pageMetrics?.pixels ?? 0.0;
    final double pagePosition = (pageX - scrollX) / pageViewWidth;
    final double safePagePosition = !pagePosition.isNaN ? pagePosition : 0.0;

    if (safePagePosition > 1.0) {
      return 1.0;
    } else if (safePagePosition < -1.0) {
      return -1.0;
    }

    return safePagePosition;
  }
}

/// A class that contains visibility information about the current page.
class PageVisibility {
  const PageVisibility({
    @required this.visibleFraction,
    @required this.pagePosition,
  });

  /// How much of the page is currently visible, between 0.0 and 1.0.
  ///
  /// For example, if only the half of the page is visible, the
  /// value of this is going to be 0.5.
  ///
  /// This doesn't contain information about where the page is
  /// disappearing to or appearing from. For that, see [pagePosition].
  final double visibleFraction;

  /// Tells the position of this page, relative to being visible in
  /// a "non-dragging" position, between -1.0 and 1.0.
  ///
  /// For example, if the page is fully visible, this value equals 0.0.
  ///
  /// If the page is fully out of view on the right, this value is
  /// going to be 1.0.
  ///
  /// Likewise, if the page is fully out of view, on the left, this
  /// value is going to be -1.0.
  final double pagePosition;
}

class ScrollNotifier extends StatefulWidget {
  const ScrollNotifier({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _ScrollNotifierState createState() => _ScrollNotifierState();
}

class _ScrollNotifierState extends State<ScrollNotifier> {
  ScrollMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        setState(() => metrics = notification.metrics);
      },
      child: ScrollSettings(
        metrics: metrics,
        child: widget.child,
      ),
    );
  }
}

class ScrollSettings extends InheritedWidget {
  const ScrollSettings({
    Key key,
    @required this.metrics,
    @required Widget child,
  }) : super(key: key, child: child);

  final ScrollMetrics metrics;

  static ScrollMetrics of(BuildContext context) {
    final ScrollSettings widget =
        context.inheritFromWidgetOfExactType(ScrollSettings);
    return widget?.metrics;
  }

  @override
  bool updateShouldNotify(ScrollSettings oldWidget) =>
      metrics != oldWidget.metrics;
}
