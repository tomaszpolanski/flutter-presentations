import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class BadSlivers extends StatelessWidget {
  const BadSlivers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List.generate(1000, (index) => index.toString());
    return Center(
      child: SizedBox(
        width: 400,
        height: 700,
        child: AppFrame(
          title: const Text('Bad'),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    for (final item in items)
                      ListTile(
                        title: Text(
                          'Item number $item',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSliverList extends StatelessWidget {
  const CustomSliverList(this.items, {Key? key}) : super(key: key);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
          title: Text(
            'Item number ${items[index]}',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        childCount: items.length,
      ),
    );
  }
}