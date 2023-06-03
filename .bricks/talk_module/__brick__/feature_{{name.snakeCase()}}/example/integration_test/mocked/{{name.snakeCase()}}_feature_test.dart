import 'package:feature_{{name.snakeCase()}}/feature_{{name.snakeCase()}}.dart';
import 'package:feature_{{name.snakeCase()}}_example/main.dart';
import 'package:klar_api_client/klar_api_client.dart';
import 'package:klar_dependencies/klar_dependencies.dart';
import 'package:klar_gherkin/klar_gherkin.dart';
import 'package:klar_test_app_base/klar_test_app_base.dart';
import 'package:{{name.snakeCase()}}_page_objects/page_objects.dart';

final pageObject = {{name.pascalCase()}}PageObject();

void main() {
  Feature('{{name.pascalCase()}}', [
    Scenario('The user sees the initial page')
      ..when(
        I_launch_the_app(
          TestApp(
            injections: testCreators,
            overrides: overrides([
              Successful{{name.pascalCase()}}Override(),
            ]),
            child: const {{name.pascalCase()}}Screen(),
          ),
        ),
      )
      ..then(pageObject.check{{name.pascalCase()}}Page())

  ]).evaluate();
}

List<SingletonInjectionOverride<dynamic>> overrides(
  List<FakeResponseProducer> producers,
) =>
    [
      SingletonInjectionOverride<HttpClient>(
        (resolver, creator) => FakeUiTestClient(
        [
          ...producers,
          ...default{{name.pascalCase()}}Overrides,
        ],
        logger: resolver.resolve(),
        ),
      ),
    ];
