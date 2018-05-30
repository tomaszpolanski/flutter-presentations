import 'package:flutter/material.dart';
import 'package:flutter_presentations/shared/presentation_page.dart';

class CustomMultiChildLayoutExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new PresentationPage(
      title: const Text('CustomMultiChildLayout'),
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new CustomMultiChildLayout(
          delegate: new _Layout(),
          children: <Widget>[
            new LayoutId(
                id: '2',
                child: new Container(
                  width: 40.0,
                  height: 40.0,
                  color: Colors.red,
                )),
            new LayoutId(
                id: '1',
                child: new Container(
                  width: 40.0,
                  height: 75.0,
                  color: Colors.blue,
                )),
            new LayoutId(
                id: '3',
                child: new Container(
                  width: 300.0,
                  height: 15.0,
                  color: Colors.orange,
                )),
            new LayoutId(
                id: '4',
                child: new Container(
                  width: 50.0,
                  height: 100.0,
                  color: Colors.green,
                )),
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
    var itemSize = layoutChild('1', new BoxConstraints());
    positionChild('1', offset);

    offset += new Offset(itemSize.width, itemSize.height);
    itemSize = layoutChild('2', new BoxConstraints());
    positionChild('2', offset);

    offset += new Offset(itemSize.width, itemSize.height);
    itemSize = layoutChild('3', new BoxConstraints());
    positionChild('3', offset);

    offset += new Offset(itemSize.width, itemSize.height);
    itemSize = layoutChild('4', new BoxConstraints());
    positionChild('4', offset);
  }

  @override
  bool shouldRelayout(_Layout oldDelegate) => true;
}
