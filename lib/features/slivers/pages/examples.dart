import 'package:flutter/material.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';

class SimpleDemo extends StatefulWidget {
  final PresentationController controller;

  const SimpleDemo({Key key, @required this.controller}) : super(key: key);

  @override
  SimpleDemoState createState() {
    return new SimpleDemoState();
  }
}

class SimpleDemoState extends State<SimpleDemo> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    widget.controller.addListener(_next);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_next);
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_controller.position.maxScrollExtent == _controller.offset) {
      widget.controller.next();
    } else {
      _controller.animateTo(
        _controller.offset + context.size.height,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        new SliverAppBar(
          floating: true,
          snap: true,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: new Text(
            'Sliver Examples',
            style: Theme.of(context).textTheme.display1.copyWith(
                  color: const Color(0xFF6AA84F),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        new SliverGrid(
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: 4.0,
          ),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: new Text(
                  'grid item $index',
                  style: Theme.of(context).textTheme.title,
                ),
              );
            },
            childCount: 20,
          ),
        ),
        new SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text(
                  'list item $index',
                  style: Theme.of(context).textTheme.title,
                ),
              );
            },
            childCount: 10,
          ),
        ),
        new SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: new SliverList(
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return new Container(
                padding:
                    new EdgeInsets.symmetric(vertical: index.toDouble() * 2),
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text(
                  'list item $index',
                  style: Theme.of(context).textTheme.title,
                ),
              );
            }, childCount: 10),
          ),
        ),
        new SliverToBoxAdapter(
          child: new Center(
            child: new Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.yellowAccent,
              child: new Text(
                'SliverToBoxAdapter',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
        ),
        new SliverFillViewport(
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Card(
                color: Colors.yellowAccent,
                child: new Center(
                  child: new Text(
                    'Fill Viewport $index',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              );
            },
            childCount: 2,
          ),
        ),
      ],
    );
  }
}
