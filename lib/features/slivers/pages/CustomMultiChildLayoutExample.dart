import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class CustomMultiChildLayoutExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PresentationPage(
      title: const Text(
        'CustomMultiChildLayout',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomMultiChildLayout(
          delegate: _Layout(),
          children: <Widget>[
            LayoutId(
              id: Colors.red,
              child: Container(
                width: 40.0,
                height: 40.0,
                color: Colors.red,
              ),
            ),
            LayoutId(
              id: Colors.blue,
              child: Container(
                width: 40.0,
                height: 75.0,
                color: Colors.blue,
              ),
            ),
            LayoutId(
              id: Colors.orange,
              child: Container(
                width: 300.0,
                height: 15.0,
                color: Colors.orange,
              ),
            ),
            LayoutId(
              id: Colors.green,
              child: Container(
                width: 50.0,
                height: 100.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Layout extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    var offset = Offset(0.0, 0.0);
    var itemSize = layoutChild(Colors.blue, BoxConstraints());
    positionChild(Colors.blue, offset);

    offset += Offset(itemSize.width, itemSize.height);
    itemSize = layoutChild(Colors.red, BoxConstraints());
    positionChild(Colors.red, offset);

    offset += Offset(itemSize.width, itemSize.height);
    itemSize = layoutChild(Colors.orange, BoxConstraints());
    positionChild(Colors.orange, offset);

    offset += Offset(itemSize.width, itemSize.height);
    itemSize = layoutChild(Colors.green, BoxConstraints());
    positionChild(Colors.green, offset);
  }

  @override
  bool shouldRelayout(_Layout oldDelegate) => true;
}
