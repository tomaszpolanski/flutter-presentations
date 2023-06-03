import 'package:feature_{{name.snakeCase()}}/feature_{{name.snakeCase()}}.dart';
import 'package:flutter/material.dart';
import 'package:klar_api_client/klar_api_client.dart';
import 'package:klar_clock/klar_clock.dart';
import 'package:klar_clock_test/klar_clock_test.dart';
import 'package:klar_dependencies/klar_dependencies.dart';
import 'package:klar_test_app_base/klar_test_app_base.dart';
import 'package:klar_l10n/klar_l10n.dart';
import 'package:klar_translations/klar_translations.dart';
import 'package:flutter/services.dart';
import 'package:klar_error_reporting/klar_error_reporting.dart';
import 'package:klar_remote_config/klar_remote_config.dart';

void main() {
  runApp(
    TestApp(
      injections: testCreators,
      child: const {{name.pascalCase()}}Screen(),
    ),
  );
}

final List<SingletonInjection> testCreators = [
  SingletonInjection<ApiConfiguration>(
    // ignore: invalid_use_of_visible_for_testing_member
    (resolver) => TestApiModels.configuration(),
  ),
  SingletonInjection<Clock>(
    (resolver) => FakeClock(),
  ),
  SingletonInjection<ApiClient>(
    (resolver) => RealApiClient(
      errorReporter: resolver.resolve(),
      httpRequestCreator: resolver.resolve(),
      reportingFilter: resolver.resolve(),
    ),
  ),
  SingletonInjection<{{name.pascalCase()}}Api>(
    (resolver) => Real{{name.pascalCase()}}Api(
      client: resolver.resolve(),
      configuration: resolver.resolve(),
    ),
  ),
  SingletonInjection<LocalizationRepository>(
    (resolver) => LocalLocalizationRepository(
    bundle: TranslationBundle(rootBundle),
    ),
  ),
 SingletonInjection<RemoteReporter>(
    (resolver) => PrinterErrorReporter(debugPrint),
  ),
  SingletonInjection<ApiClientLogger>(
    (resolver) => defaultTestProxyLogger,
  ),
  SingletonInjection<HttpClient>(
    (resolver) => FakeUiTestClient(
      [],
      logger: resolver.resolve(),
    ),
  ),
  SingletonInjection<NetworkRequestProxy>(
    (resolver) => const ReleaseNetworkRequestProxy(),
  ),
  SingletonInjection<HttpRequestCreator>(
    (resolver) => RealHttpRequestCreator(
      httpClient: resolver.resolve(),
      remoteReporter: resolver.resolve(),
      networkRequestProxy: resolver.resolve(),
      interceptors: [],
    ),
  ),
  SingletonInjection<ApiClientErrorReportingFilter>(
    (resolver) => const ApiClientErrorReportingFilter(),
  ),
  SingletonInjection<Config>(
    (resolver) => Config.defaultConfig(),
  ),
];
