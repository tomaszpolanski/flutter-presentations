import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class SimpleDemo extends StatefulWidget {
  const SimpleDemo({Key key, @required this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  SimpleDemoState createState() => SimpleDemoState();
}

class SimpleDemoState extends State<SimpleDemo> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    widget.controller.addListener(_handlePageAction);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handlePageAction);
    _controller.dispose();
    super.dispose();
  }

  void _handlePageAction(PageAction action) {
    if (action == PageAction.next) {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        widget.controller.nextSlide();
      } else {
        _controller.animateTo(
          _controller.offset + context.size.height,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    } else {
      if (0.0 == _controller.offset) {
        widget.controller.previousSlide();
      } else {
        _controller.animateTo(
          _controller.offset - context.size.height,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          snap: true,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Sliver Examples',
            style: Theme.of(context).textTheme.headline4.copyWith(
                  color: const Color(0xFF6AA84F),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            childAspectRatio: 4,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text(
                  'grid item $index',
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            },
            childCount: 20,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text(
                  'list item $index',
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            },
            childCount: 10,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: index.toDouble() * 2),
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text(
                  'list item $index',
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            }, childCount: 10),
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.yellowAccent,
              child: Text(
                'SliverToBoxAdapter',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
        SliverFillViewport(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                color: Colors.yellowAccent,
                child: Center(
                  child: Text(
                    'Fill Viewport $index',
                    style: Theme.of(context).textTheme.headline6,
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
