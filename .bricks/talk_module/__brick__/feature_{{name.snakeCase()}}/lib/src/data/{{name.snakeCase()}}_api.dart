import 'package:klar_api_client/klar_api_client.dart';

abstract class {{name.pascalCase()}}Api {
  Future<Result<void, void>> request();
}

class Real{{name.pascalCase()}}Api implements {{name.pascalCase()}}Api {
  const Real{{name.pascalCase()}}Api({
    required this.configuration,
    required this.client,
  });

  final ApiConfiguration configuration;
  final ApiClient client;

  @override
  Future<Result<void, void>> request() => client.send<void, void, void>(
        HttpMethod.post,
        Uri.parse('${configuration.baseUrl}/{{name.paramCase()}}/api/v1/'),
        authenticate: true,
      );
}
