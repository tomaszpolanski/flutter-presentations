import 'package:flutter/material.dart';
import 'package:flutter_presentations/shared/presentation_page.dart';

class CustomMultiChildLayoutExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new PresentationPage(
      title: const Text(
        'CustomMultiChildLayout',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new CustomMultiChildLayout(
          delegate: new _Layout(),
          children: <Widget>[
            new LayoutId(
              id: Colors.red,
              child: new Container(
                width: 40.0,
                height: 40.0,
                color: Colors.red,
              ),
            ),
            new LayoutId(
              id: Colors.blue,
              child: new Container(
                width: 40.0,
                height: 75.0,
                color: Colors.blue,
              ),
            ),
            new LayoutId(
              id: Colors.orange,
              child: new Container(
                width: 300.0,
                height: 15.0,
                color: Colors.orange,
              ),
            ),
            new LayoutId(
              id: Colors.green,
              child: new Container(
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
    var offset = new Offset(0.0, 0.0);
    var itemSize = layoutChild(Colors.blue, new BoxConstraints());
    positionChild(Colors.blue, offset);

    offset += new Offset(itemSize.width, itemSize.height);
    itemSize = layoutChild(Colors.red, new BoxConstraints());
    positionChild(Colors.red, offset);

    offset += new Offset(itemSize.width, itemSize.height);
    itemSize = layoutChild(Colors.orange, new BoxConstraints());
    positionChild(Colors.orange, offset);

    offset += new Offset(itemSize.width, itemSize.height);
    itemSize = layoutChild(Colors.green, new BoxConstraints());
    positionChild(Colors.green, offset);
  }

  @override
  bool shouldRelayout(_Layout oldDelegate) => true;
}
