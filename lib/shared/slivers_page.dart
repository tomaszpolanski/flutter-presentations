import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({
    Key key,
    @required this.title,
    this.controller,
    @required this.slivers,
  }) : super(key: key);
  final Widget title;
  final ScrollController controller;
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: DefaultTextStyle(
            style: Theme.of(context).textTheme.headline4.copyWith(
                color: const Color(0xFF6AA84F), fontWeight: FontWeight.bold),
            child: title,
          ),
        ),
        ...slivers,
      ],
    );
  }
}
