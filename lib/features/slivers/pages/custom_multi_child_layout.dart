import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class CustomMultiChildLayoutExample extends StatelessWidget {
  const CustomMultiChildLayoutExample({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PresentationPage(
      title: const Text(
        'CustomMultiChildLayout',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: CustomMultiChildLayout(
          delegate: _Layout(),
          children: <Widget>[
            LayoutId(
              id: Colors.red,
              child: Container(
                width: 40,
                height: 40,
                color: Colors.red,
              ),
            ),
            LayoutId(
              id: Colors.blue,
              child: Container(
                width: 40,
                height: 75,
                color: Colors.blue,
              ),
            ),
            LayoutId(
              id: Colors.orange,
              child: Container(
                width: 300,
                height: 15,
                color: Colors.orange,
              ),
            ),
            LayoutId(
              id: Colors.green,
              child: Container(
                width: 50,
                height: 100,
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
    var offset = const Offset(0, 0);
    var itemSize = layoutChild(Colors.blue, const BoxConstraints());
    positionChild(Colors.blue, offset);

    offset += Offset(itemSize.width, itemSize.height);
    itemSize = layoutChild(Colors.red, const BoxConstraints());
    positionChild(Colors.red, offset);

    offset += Offset(itemSize.width, itemSize.height);
    itemSize = layoutChild(Colors.orange, const BoxConstraints());
    positionChild(Colors.orange, offset);

    offset += Offset(itemSize.width, itemSize.height);
    itemSize = layoutChild(Colors.green, const BoxConstraints());
    positionChild(Colors.green, offset);
  }

  @override
  bool shouldRelayout(_Layout oldDelegate) => true;
}
