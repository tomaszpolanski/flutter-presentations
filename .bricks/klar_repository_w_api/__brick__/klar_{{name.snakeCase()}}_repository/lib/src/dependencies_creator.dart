import 'package:klar_{{name.snakeCase()}}_repository/src/data/{{name.snakeCase()}}_api.dart';
import 'package:klar_{{name.snakeCase()}}_repository/src/data/{{name.snakeCase()}}_repository.dart';
import 'package:klar_dependencies_base/klar_dependencies_base.dart';

class {{name.pascalCase()}}DependenciesCreator {
  const {{name.pascalCase()}}DependenciesCreator._();

  static List<Injection> get create => [
        SingletonInjection<{{name.pascalCase()}}Api>(
          (resolver) => Real{{name.pascalCase()}}Api(
            client: resolver.resolve(),
            configuration: resolver.resolve(),
          ),
        ),
        SingletonInjection<{{name.pascalCase()}}Repository>(
          (resolver) => Real{{name.pascalCase()}}Repository(
            api: resolver.resolve(),
          ),
        ),
      ];
}
