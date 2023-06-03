# Acceptance Tests

Test scripts are located in [features](/features) and [integrations](/integrations) directories.
They can run on physical iOS or Android devices, iOS simulator or Android emulator and Linux.

## E2E UI Test Script

The tests are useful for evaluating system under test as a whole to simulate real user scenarios.
Tests are organized similar to [Gherkin](https://cucumber.io/docs/gherkin/reference/) structure, but as Dart functions and classes instead of text files.

A script consists of a Feature. A feature has one or more scenarios. Each scenario has multiple steps. Step types are: Given, When and Then.

An example script:

```dart
void main() {
  Feature('Login', [
    Scenario('User can log in')
      ..when(I_launch_the_app(/* TestApp */))
      ..and(I_type('Rockstar123'))
      ..and(I_tap_on('loginButton'))
      ..then(I_expect_to_see('balance')),
  ]).evaluate();
}
```

All step definitions are defined in [scenario_steps.dart](/utilities/scenario_steps.dart) file.
Since feature file is a Dart file, on an IDE supporting Dart (Intellij, Android Studio, VScode, etc),
it is possible to use automatic code completion and access quick documentation view when creating scripts.

## Integration Test

Tests are organized similar to Unit Tests.  
However, they are less separated (more content is a single test) due to their longer startup, execution and teardown time.

The tests are designed to test the edges of our system integrating with external dependencies (like databases).
We are not able to do it in other `test` directory as those test are not run on desired host system (Android, iOS, ...).

NOTE: We are using `testWidgets()` instead of `test()` only `testWidgets()` reports to `IntegrationTestWidgetsFlutterBinding`.

## Executing tests

### Local execution

In order to run tests locally, following components are needed:

- [Flutter](https://flutter.dev/docs/get-started/install)
- For executing tests on iOS devices or simulator: [XCode](https://developer.apple.com/download/)
- For executing tests on Android devices or emulator: [Android Studio or Command line tools](https://developer.android.com/studio)
- For executing tests on Linux please install [enable Linux](https://flutter.dev/desktop) the dependencies that are listed in the [Dockerfile](tools/docker/Dockerfile)
- Workaround for macOS: For executing tests on macOS please [enable macOS](https://flutter.dev/desktop).

Activating the `klar_ui_tests`

```bash
dart pub global activate --source path <PATH TO klar_ui_tests>
```

After launching an emulator or a simulator or connecting to a physical device or on a desktop system, execute `$ run_test` in `example` directory.
