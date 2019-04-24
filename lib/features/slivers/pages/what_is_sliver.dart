import 'package:flutter/material.dart';
import 'package:presentation/presentation_page.dart';

class WhatIsSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new PresentationPage(
      title: new Text('What is a Sliver?'),
      child: new Row(
        children: <Widget>[
          new Flexible(
            flex: 1,
            child: new Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: new Column(
                children: <Widget>[
                  new SingleList(),
                  new Text('List'),
                ],
              ),
            ),
          ),
          new Flexible(
            flex: 1,
            child: new Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: new Column(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: new BoxDecoration(
                        color: Colors.purple,
                        border: new Border.all(color: Colors.black)),
                    child: new Column(
                      children: <Widget>[
                        new SingleList(sizeFactor: 0.5),
                        new SingleList(sizeFactor: 0.5),
                        new SingleList(sizeFactor: 0.5, count: 2),
                      ],
                    ),
                  ),
                  new Text('Sliver'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SingleList extends StatelessWidget {
  const SingleList({
    Key key,
    this.sizeFactor = 1.0,
    this.count = 3,
  }) : super(key: key);
  final double sizeFactor;
  final int count;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(8.0),
      decoration: new BoxDecoration(
          color: Colors.green, border: new Border.all(color: Colors.black)),
      child: new Column(
        children: new List.generate(
          count,
          (_) => new Padding(
                padding: const EdgeInsets.all(2.0),
                child: new Container(
                  height: 30.0 * sizeFactor,
                  color: Colors.red,
                ),
              ),
        ),
      ),
    );
  }
}
