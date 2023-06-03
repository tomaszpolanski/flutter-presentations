import 'package:klar_{{name.snakeCase()}}/src/{{name.snakeCase()}}.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('is created', () {
    expect(const {{name.pascalCase()}}('test'), isNotNull);
  });

  // Only needed when sharding tests.
  // When there are not enoughs tests to be sharded the tests are reported as failed.
  // Please remove after creating the module and valid tests.
  List.generate(100, (index) => index).forEach(
    (index) => test(
      'dummy $index test for sharding. Please remove!',
      () {},
      skip: true,
    ),
  );
}
