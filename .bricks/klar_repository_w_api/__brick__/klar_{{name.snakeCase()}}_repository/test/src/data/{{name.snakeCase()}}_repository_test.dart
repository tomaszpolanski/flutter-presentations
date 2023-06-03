import 'package:klar_api_client/klar_api_client.dart';
import 'package:klar_{{name.snakeCase()}}_repository/src/data/{{name.snakeCase()}}_api.dart';
import 'package:klar_{{name.snakeCase()}}_repository/src/data/{{name.snakeCase()}}_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() {
  late {{name.pascalCase()}}Api api;
  late Real{{name.pascalCase()}}Repository repository;
  late _ArrangeBuilder builder;

  setUp(() {
    api = _Mock{{name.pascalCase()}}Api();

    builder = _ArrangeBuilder(api: api);

    repository = Real{{name.pascalCase()}}Repository(api: builder.api);
  });

  test('is created', () async {
    final result = await repository.current;

    expect(result, const SuccessResult<void, void>(data: null));
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

class _ArrangeBuilder {
  _ArrangeBuilder({
    {{name.pascalCase()}}Api? api,
  }) : api = api ?? _Mock{{name.pascalCase()}}Api();

  final {{name.pascalCase()}}Api api;
}

class _Mock{{name.pascalCase()}}Api extends Mock implements {{name.pascalCase()}}Api {}
