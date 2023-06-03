import 'package:klar_api_client/klar_api_client.dart';
import 'package:klar_{{name.snakeCase()}}_repository/src/data/{{name.snakeCase()}}_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() {
  late ApiClient client;
  late {{name.pascalCase()}}Api api;
  // ignore: unused_local_variable
  late _ArrangeBuilder builder;

  setUp(() {
    client = _MockApiClient();
    builder = _ArrangeBuilder(client: client);

    api = Real{{name.pascalCase()}}Api(
      client: client,
      configuration: TestApiModels.configuration(),
    );
  });

  test('is created', () async {
    expect(api, isA<Real{{name.pascalCase()}}Api>());
  });
}

class _ArrangeBuilder {
  _ArrangeBuilder({
    ApiClient? client,
  }) : client = client ?? _MockApiClient();

  final ApiClient client;
}

class _MockApiClient extends Mock implements ApiClient {}
