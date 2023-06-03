import 'package:mocktail/mocktail.dart';
import 'package:{{root.snakeCase()}}/{{root.snakeCase()}}.dart';

mixin {{mixin.pascalCase()}}BuilderMixin {
  final {{mixin.pascalCase()}} {{mixin.camelCase()}} = _Mock{{mixin.pascalCase()}}();

  void arrange{{mixin.pascalCase()}}() {
    // TODO
  }
}

class _Mock{{mixin.pascalCase()}} extends Mock implements {{mixin.pascalCase()}} {}
