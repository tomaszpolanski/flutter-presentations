import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class WhatIsSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PresentationPage(
      title: Text('What is a Sliver?'),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Column(
                children: <Widget>[
                  SingleList(),
                  Text('List'),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        border: Border.all(color: Colors.black)),
                    child: Column(
                      children: <Widget>[
                        SingleList(sizeFactor: 0.5),
                        SingleList(sizeFactor: 0.5),
                        SingleList(sizeFactor: 0.5, count: 2),
                      ],
                    ),
                  ),
                  Text('Sliver'),
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
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.green, border: Border.all(color: Colors.black)),
      child: Column(
        children: List.generate(
          count,
          (_) => Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 30.0 * sizeFactor,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
