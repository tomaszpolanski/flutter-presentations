import 'package:flutter/material.dart';
import 'package:flutter_presentations/shared/slivers_page.dart';
import 'package:presentation/presentation_controller.dart';

class SliverTypesPage extends StatefulWidget {
  const SliverTypesPage({Key key, @required this.controller}) : super(key: key);

  final PresentationController controller;

  @override
  SliverTypesPageState createState() => SliverTypesPageState();
}

class SliverTypesPageState extends State<SliverTypesPage> {
  // Can you spot the typos? :)
  static const _kMostUsed = const [
    'SilverList',
    'SliverFixedExtentList',
    'SilverGrid',
    'SliverAppBar',
    'SliverPersistentHeader',
    'SliverFillViewport',
    'SliverToBoxAdapter',
    'SliverPadding',
  ];

  static const _kTheRest = const [
    'SliverPrototypeExtentList',
    'SliverFillRemaining',
    'RenderSliverHelpers (mixin)',
    'RenderSliverMultiBoxAdaptor (abstract)',
    'RenderSliverFixedExtentBoxAdaptor (abstract)',
    'RenderSliverFillViewport',
    'RenderSliverFixedExtentList',
    'RenderSliverGrid',
    'RenderSliverList',
    'RenderSliverPadding',
    'RenderSliverPersistentHeader (abstract)',
    'RenderSliverFloatingPersistentHeader',
    'RenderSliverFloatingPinnedPersistentHeader',
    'RenderSliverPinnedPersistentHeader',
    'RenderSliverScrollingPersistentHeader',
    'RenderSliverSingleBoxAdapter (abstract)',
    'RenderSliverFillRemaining',
    'RenderSliverToBoxAdapter',
  ];
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
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    } else {
      if (0.0 == _controller.offset) {
        widget.controller.previousSlide();
      } else {
        _controller.animateTo(
          _controller.offset - context.size.height,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    }
  }

  IndexedWidgetBuilder _sliverTypeDelegate(List<String> data) {
    return (BuildContext context, int index) {
      return new Card(
        child: new InkWell(
          highlightColor: Colors.teal,
          onTap: () {},
          child: new Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            alignment: Alignment.center,
            child: new Text(
              data[index],
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.black),
            ),
          ),
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final aspectRatio = size.width / size.height;
    return new SliverPage(
      title: new Text('Sliver Types'),
      controller: _controller,
      slivers: [
        new SliverToBoxAdapter(
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              'Most Used',
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        new SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: new SliverGrid(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: aspectRatio < 1.0 ? 1 : 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 4.0,
            ),
            delegate: new SliverChildBuilderDelegate(
              _sliverTypeDelegate(_kMostUsed),
              childCount: _kMostUsed.length,
            ),
          ),
        ),
        new SliverToBoxAdapter(
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              'And the Rest',
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        new SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: new SliverGrid(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: aspectRatio < 1.0 ? 1 : 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 4.0,
            ),
            delegate: new SliverChildBuilderDelegate(
              _sliverTypeDelegate(_kTheRest),
              childCount: _kTheRest.length,
            ),
          ),
        ),
      ],
    );
  }
}
