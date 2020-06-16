import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/slivers/bar.dart';
import 'package:flutter_presentations/features/slivers/custom_appbar_delegate.dart';
import 'package:presentation/presentation.dart';

class ImplementingHeader extends StatefulWidget {
  const ImplementingHeader({Key key, @required this.controller})
      : super(key: key);

  final PresentationController controller;

  @override
  ImplementingHeaderState createState() => ImplementingHeaderState();
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
    return Material(
      color: Colors.white,
      child: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: CustomAppBarDelegate(
              expandedHeight: 200,
              flexibleSpace: const Bar(
                start: Colors.red,
                end: Colors.blue,
              ),
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
        ],
      ),
    );
  }
}
