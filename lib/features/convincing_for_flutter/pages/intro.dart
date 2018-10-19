import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        new Align(
          alignment: Alignment.centerLeft,
          child: new Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'Convincing your company to Flutter',
                  style: Theme.of(context).textTheme.display2.copyWith(
                      color: const Color(0xFF6AA84F),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        new Align(
          alignment: Alignment.bottomRight,
          child: new Padding(
            padding: const EdgeInsets.only(right: 18.0, bottom: 18.0),
            child: new DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text(
                    'Tomek Polański',
                    style: new TextStyle(color: Colors.black),
                  ),
                  new Text(
                    'GROUPON',
                    style: new TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PopularityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/popularity.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}


/// Keyboard test page for the example application.
class KeyboardTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KeyboardTestPageState();
  }
}

class _KeyboardTestPageState extends State<KeyboardTestPage> {
  final List<String> _messages = [];

  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: new Text('Keyboard events test'),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              })),
      body: new RawKeyboardListener(
        focusNode: _focusNode,
        onKey: onKeyEvent,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _messages.map((m) => new Text(m)).toList())),
        ),
      ),
    );
  }

  void onKeyEvent(RawKeyEvent event) {
    bool isKeyDown;
    switch (event.runtimeType) {
      case RawKeyDownEvent:
        isKeyDown = true;
        break;
      case RawKeyUpEvent:
        isKeyDown = false;
        break;
      default:
        throw new Exception('Unexpected runtimeType of RawKeyEvent');
    }

    int keyCode;
    switch (event.data.runtimeType) {
      case RawKeyEventDataAndroid:
        final RawKeyEventDataAndroid data = event.data;
        keyCode = data.keyCode;
        break;
      default:
        throw new Exception('Unsupported platform');
    }

    _addMessage('${isKeyDown ? 'KeyDown' : 'KeyUp'}: $keyCode');
  }

  void _addMessage(String message) {
    setState(() {
      _messages.add(message);
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      );
    });
  }
}
