import 'package:flutter/material.dart';

class IncludeFlutter extends StatefulWidget {
  @override
  _IncludeFlutterState createState() => _IncludeFlutterState();
}

class _IncludeFlutterState extends State<IncludeFlutter>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
