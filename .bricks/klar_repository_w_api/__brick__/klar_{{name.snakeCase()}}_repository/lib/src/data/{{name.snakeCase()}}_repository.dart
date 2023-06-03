import 'package:klar_api_client/klar_api_client.dart';
import 'package:klar_repository_base/klar_repository_base.dart';
import 'package:klar_{{name.snakeCase()}}_repository/src/data/{{name.snakeCase()}}_api.dart';

abstract class {{name.pascalCase()}}Repository
    implements RepositoryInterface<Result<void, void>> {}

class Real{{name.pascalCase()}}Repository extends InMemoryRepository<Result<void, void>>
    implements {{name.pascalCase()}}Repository {
  Real{{name.pascalCase()}}Repository({required {{name.pascalCase()}}Api api}) : _api = api;

  // ignore: unused_field
  final {{name.pascalCase()}}Api _api;

  @override
  Future<Result<void, void>> retrieve() async =>
      const SuccessResult<void, void>(data: null);
}
