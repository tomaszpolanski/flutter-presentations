import 'package:flutter_presentations/shared/presentation_controller.dart';

class PageStepper<T> {
  final List<T> steps;
  final PresentationController controller;
  T _currentStep;
  final List<StepTransition> _transitions = <StepTransition>[];

  PageStepper({this.controller, this.steps}) : _currentStep = steps.first;

  void addStepTransition(
    T currentStep,
    T nextStep,
    void Function() transition,
  ) {
    _transitions.add(StepTransition(
      currentStep: currentStep,
      nextStep: nextStep,
      transition: transition,
    ));
  }

  void next() {
    final nextStep = _getNextStep(_currentStep);
    if (nextStep != null) {
      _currentStep = _tryTransition(current: _currentStep, next: nextStep);
    } else {
      controller.next();
    }
  }

  void previous() {
    final nextStep = _getPreviousStep(_currentStep);
    if (nextStep != null) {
      _currentStep = _tryTransition(current: _currentStep, next: nextStep);
    } else {
      controller.previous();
    }
  }

  T _tryTransition({T current, T next}) {
    final transition = _transitions.firstWhere((transition) =>
        transition.currentStep == _currentStep && transition.nextStep == next);
    if (transition != null) {
      transition.transition();
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
}

class StepTransition<T> {
  final T currentStep;
  final T nextStep;
  final void Function() transition;

  StepTransition({
    this.currentStep,
    this.nextStep,
    this.transition,
  });
}
