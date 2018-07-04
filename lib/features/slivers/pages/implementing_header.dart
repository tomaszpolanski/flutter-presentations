import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/slivers/Bar.dart';
import 'package:flutter_presentations/features/slivers/CustomAppBarDelegate.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';

class ImplementingHeader extends StatefulWidget {
  final PresentationController controller;

  const ImplementingHeader({Key key, @required this.controller})
      : super(key: key);

  @override
  ImplementingHeaderState createState() {
    return new ImplementingHeaderState();
  }
}

class ImplementingHeaderState extends State<ImplementingHeader> {
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
        widget.controller.next();
      } else {
        _controller.animateTo(
          _controller.offset + context.size.height,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    } else {
      if (0.0 == _controller.offset) {
        widget.controller.previous();
      } else {
        _controller.animateTo(
          _controller.offset - context.size.height,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          new SliverPersistentHeader(
            delegate: new CustomAppBarDelegate(
              expandedHeight: 200.0,
              flexibleSpace: new Bar(
                start: Colors.red,
                end: Colors.blue,
              ),
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
        ],
      ),
    );
  }
}
