import 'package:flutter/material.dart';

class ClipperRect extends CustomClipper<Rect> {
  const ClipperRect(this.relativeRect);

  final Rect relativeRect;

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      size.width * relativeRect.left,
      size.height * relativeRect.top,
      size.width * relativeRect.right,
      size.height * relativeRect.bottom,
    );
  }

  @override
  bool shouldReclip(ClipperRect oldClipper) => true;
}
