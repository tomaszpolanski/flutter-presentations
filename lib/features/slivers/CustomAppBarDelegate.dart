import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/slivers/Bar.dart';
import 'package:meta/meta.dart';

class CustomAppBarDelegate extends SliverPersistentHeaderDelegate {
  CustomAppBarDelegate({
    @required this.flexibleSpace,
    @required this.expandedHeight,
  });

  final Widget flexibleSpace;
  final double expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  double get maxExtent =>
      math.max((expandedHeight ?? kToolbarHeight), minExtent);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Bar.createSettings(
      minExtent: minExtent,
      maxExtent: maxExtent,
      currentExtent: math.max(minExtent, maxExtent - shrinkOffset),
      child: flexibleSpace,
    );
  }

  @override
  bool shouldRebuild(covariant CustomAppBarDelegate oldDelegate) {
    return flexibleSpace != oldDelegate.flexibleSpace;
  }
}
