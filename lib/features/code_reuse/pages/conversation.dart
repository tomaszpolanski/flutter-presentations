import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presentations/features/convincing_for_flutter/shared/groupon_theme.dart';
import 'package:presentation/presentation.dart';

class Conversation extends StatefulWidget {
  const Conversation({Key key, this.controller}) : super(key: key);
  final PresentationController controller;

  @override
  _ConversationState createState() => _ConversationState();
}

enum _Step {
  init,
  norbert,
  salih,
  rafal,
  haha,
  next,
}

class _ConversationState extends State<Conversation>
    with SingleTickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.norbert,
        forward: () => _controller.animateTo(0.25),
        reverse: () => _controller.animateBack(0),
      )
      ..add(
        fromStep: _Step.norbert,
        toStep: _Step.salih,
        forward: () => _controller.animateTo(0.5),
        reverse: () => _controller.animateBack(0.25),
      )
      ..add(
        fromStep: _Step.salih,
        toStep: _Step.rafal,
        forward: () => _controller.animateTo(0.75),
        reverse: () => _controller.animateBack(0.5),
      )
      ..add(
        fromStep: _Step.rafal,
        toStep: _Step.haha,
        forward: () => _controller.animateTo(1),
        reverse: () => _controller.animateBack(0.75),
      )
      ..add(
        fromStep: _Step.haha,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..build();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 900,
          child: Column(
            children: [
              _SlideIn(
                animation: _controller,
                curve: const Interval(0, 0.25, curve: Curves.ease),
                slideInDirection: TextDirection.ltr,
                child: const _Message(
                  avatar: 'assets/norbert.jpg',
                  user: Text('Norbert'),
                  child: Text(
                    "In the end, state management is all the same, whether it's mobx/bloc or redux.\n"
                    'All they are doing is separating logic from UI code for the sake reusability/readability.\n'
                    "I honestly don't see a difference between mobx and bloc besides some syntax sugar",
                  ),
                ),
              ),
              _SlideIn(
                animation: _controller,
                curve: const Interval(0.25, 0.5, curve: Curves.ease),
                slideInDirection: TextDirection.rtl,
                child: const _Message(
                  avatar: 'assets/salih.jpg',
                  user: Text('salih'),
                  child: Text(
                    'For me, the important point of view is actually why people prefer that.\n'
                    "Is it because it's easier or because it's just closer to what they did before, learning curve etc...",
                  ),
                ),
              ),
              _SlideIn(
                animation: _controller,
                curve: const Interval(0.5, 0.75, curve: Curves.ease),
                slideInDirection: TextDirection.ltr,
                child: _Message(
                  avatar: 'assets/rafal.jpg',
                  user: const Text('Rafal'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        '“don’t necessarily need state management besides stateful widgets”',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.grey),
                      ),
                      Text('heresy! (joke)'),
                    ],
                  ),
                ),
              ),
              _SlideIn(
                animation: _controller,
                curve: const Interval(0.75, 1, curve: Curves.ease),
                slideInDirection: TextDirection.rtl,
                child: const _Message(
                  avatar: 'assets/norbert.jpg',
                  user: Text('Norbert'),
                  child: Text('haha 😂'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SlideIn extends StatelessWidget {
  const _SlideIn({
    Key key,
    @required this.animation,
    @required this.curve,
    @required this.slideInDirection,
    @required this.child,
  }) : super(key: key);
  final Animation<double> animation;
  final Curve curve;
  final TextDirection slideInDirection;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WrappedAnimatedBuilder<double>(
      animation: CurvedAnimation(
        parent: animation,
        curve: curve,
      ),
      builder: (_, animation, child) {
        return FadeTransition(
          opacity: animation,
          child: Transform.translate(
            offset: Offset(
                (slideInDirection == TextDirection.ltr ? -1 : 1) *
                    40 *
                    (1 - animation.value),
                0),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    Key key,
    @required this.avatar,
    @required this.user,
    @required this.child,
  }) : super(key: key);

  final String avatar;
  final Widget user;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 120,
          width: 120,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: AssetImage(avatar),
            ),
          ),
        ),
        Expanded(
          child: DefaultTextStyle.merge(
            style: GTheme.small.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextStyle.merge(
                  style: GTheme.small.copyWith(
                    color: Colors.black,
                  ),
                  child: user,
                ),
                child,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
