import 'package:animation_cheat_page/shared/material_import.dart';

Iterable<InlineSpan> splitMapJoin(
  String data,
  Pattern pattern, {
  InlineSpan Function(Match match) onMatch,
  Iterable<InlineSpan> Function(String nonMatch) onNonMatch,
}) sync* {
  if (pattern is! Pattern) {
    throw ArgumentError('$pattern is not a Pattern');
  }

  int startIndex = 0;
  for (final match in pattern.allMatches(data)) {
    yield* onNonMatch(data.substring(startIndex, match.start));
    yield onMatch(match);
    startIndex = match.end;
  }
  yield* onNonMatch(data.substring(startIndex));
}
