import 'package:feature_{{name.snakeCase()}}/src/data/{{name.snakeCase()}}_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klar_api_client/klar_api_client.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late _MockApiClient client;
  late {{name.pascalCase()}}Api api;

  setUp(() {
    client = _MockApiClient();
    api = Real{{name.pascalCase()}}Api(
      configuration: TestApiModels.configuration(),
      client: client,
    );

    when(
      () => client.send<void, void, void>(
        any(),
        any(),
        authenticate: any(named: 'authenticate'),
        additionalHeaders: any(named: 'additionalHeaders'),
        deserializer: any(named: 'deserializer'),
        errorCodeMapper: any(named: 'errorCodeMapper'),
      ),
    ).thenAnswer((_) async => const SuccessResult<void, void>(data: null));
  });

  setUpAll(() {
    registerFallbackValue(HttpMethod.get);
    registerFallbackValue(Uri.parse(''));
  });


  test('is successful', () async {
    final result = await api.request();

    expect(result, isA<SuccessResult>());
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

class _MockApiClient extends Mock implements ApiClient {}
