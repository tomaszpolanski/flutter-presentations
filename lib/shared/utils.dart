import 'package:meta/meta.dart';

Iterable<T> join<T>({
  @required T separator,
  @required Iterable<T> children,
}) sync* {
  final iterator = children.iterator;
  if (iterator.moveNext()) {
    yield iterator.current;
    while (iterator.moveNext()) {
      yield separator;
      yield iterator.current;
    }
  }
}
