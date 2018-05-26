import 'package:flutter/material.dart';

class Sliver1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 100.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: const Text('Demo'),
            ),
          ),
          new SliverGrid(
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150.0,
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
            }, childCount: 10),
          ),
          new SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: new SliverFixedExtentList(
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
              }, childCount: 10),
            ),
          ),
          new SliverToBoxAdapter(
            child: const Text("Hi"),
          ),
          new SliverToBoxAdapter(
            child: const Text("Hi2"),
          ),
          new SliverFillViewport(
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new Card(
                  color: Colors.yellowAccent,
                  child: new Text("Little old me $index"),
                );
              },
              childCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
