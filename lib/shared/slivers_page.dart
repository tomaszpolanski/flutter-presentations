import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  final Widget title;
  final List<Widget> slivers;

  const SliverPage({
    Key key,
    @required this.title,
    @required this.slivers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        new SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: new DefaultTextStyle(
            style: Theme.of(context).textTheme.display1.copyWith(
                color: const Color(0xFF6AA84F), fontWeight: FontWeight.bold),
            child: title,
          ),
        ),
      ]..addAll(slivers),
    );
  }
}
