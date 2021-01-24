import 'package:flutter/material.dart' hide Image;
import 'package:flutter/material.dart' as material;
import 'package:presentation/presentation.dart';

class Image extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  Image.asset(
    this.name, {
    Key? key,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  final String name;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final index = PageViewSettings.of(context).index;
    final bernie = index > 3;
    return material.Image.asset(
      name.replaceAll('.jpg', bernie ? '-bernie.jpg' : '.jpg'),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
