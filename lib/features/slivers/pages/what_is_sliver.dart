import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class WhatIsSliver extends StatelessWidget {
  const WhatIsSliver({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PresentationPage(
      title: const Text('What is a Sliver?'),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                children: const [
                  SingleList(),
                  Text('List'),
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      border: Border.all(),
                    ),
                    child: Column(
                      children: const [
                        SingleList(sizeFactor: 0.5),
                        SingleList(sizeFactor: 0.5),
                        SingleList(sizeFactor: 0.5, count: 2),
                      ],
                    ),
                  ),
                  const Text('Sliver'),
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
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(),
      ),
      child: Column(
        children: List.generate(
          count,
          (_) => Padding(
            padding: const EdgeInsets.all(2),
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
