import 'package:klar_api_client/klar_api_client.dart';

abstract class {{name.pascalCase()}}Api {}

class Real{{name.pascalCase()}}Api implements {{name.pascalCase()}}Api {
  Real{{name.pascalCase()}}Api({
    required ApiClient client,
    required ApiConfiguration configuration,
  }) : _client = client, _configuration = configuration;

  // ignore: unused_field
  final ApiClient _client;

  // ignore: unused_field
  final ApiConfiguration _configuration;
}
