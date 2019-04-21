import 'package:flutter/foundation.dart';
import 'package:flutter_presentations/shared/presentation_controller.dart';

class PageStepper<T> extends Listenable {
  PageStepper({this.controller, this.steps}) : _currentStep = steps.first;

  final List<T> steps;
  final PresentationController controller;
  T _currentStep;
  final List<StepTransition> _transitions = <StepTransition>[];
  VoidCallback _listenable;

  void addStep(
    T currentStep,
    T nextStep,
    VoidCallback transition,
  ) {
    _transitions.add(StepTransition(
      currentStep: currentStep,
      nextStep: nextStep,
      transition: transition,
    ));
  }

  void add({
    @required T fromStep,
    @required T toStep,
    @required VoidCallback forward,
    VoidCallback reverse,
  }) {
    assert(fromStep != null);
    assert(toStep != null);
    assert(forward != null);
    _transitions.add(StepTransition(
      currentStep: fromStep,
      nextStep: toStep,
      transition: forward,
    ));
    if (reverse != null) {
      _transitions.add(StepTransition(
        currentStep: toStep,
        nextStep: fromStep,
        transition: reverse,
      ));
    }
  }

  void next() {
    final nextStep = _getNextStep(_currentStep);
    if (nextStep != null) {
      _currentStep = _tryTransition(current: _currentStep, next: nextStep);
    } else {
      controller.nextSlide();
    }
  }

  void previous() {
    final nextStep = _getPreviousStep(_currentStep);
    if (nextStep != null) {
      _currentStep = _tryTransition(current: _currentStep, next: nextStep);
    } else {
      controller.previousSlide();
    }
  }

  T _tryTransition({@required T current, @required T next}) {
    final transition = _transitions.firstWhere((transition) =>
        transition.currentStep == _currentStep && transition.nextStep == next);

    if (transition != null) {
      print('From: ${transition.currentStep}, to: ${transition.nextStep}');
      transition.transition();
      if (_listenable != null) {
        _listenable();
      }
      return next;
    } else {
      print("Transition from $_currentStep to $next doesn't exist!");
      return _currentStep;
    }
  }

  void build() {
    controller.addListener(_handlePageAction);
  }

  void dispose() {
    controller.removeListener(_handlePageAction);
    _transitions.clear();
  }

  void _handlePageAction(PageAction action) {
    if (action == PageAction.next) {
      next();
    } else {
      previous();
    }
  }

  T _getNextStep(T current) {
    final currentIndex = steps.indexOf(_currentStep);
    return currentIndex + 1 < steps.length ? steps[currentIndex + 1] : null;
  }

  T _getPreviousStep(T current) {
    final currentIndex = steps.indexOf(_currentStep);
    return currentIndex - 1 >= 0 ? steps[currentIndex - 1] : null;
  }

  @override
  void addListener(VoidCallback listener) {
    _listenable = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    if (_listenable == listener) {
      _listenable = null;
    }
  }
}

class StepTransition<T> {
  const StepTransition({
    this.currentStep,
    this.nextStep,
    this.transition,
  });

  final T currentStep;
  final T nextStep;
  final VoidCallback transition;
}
