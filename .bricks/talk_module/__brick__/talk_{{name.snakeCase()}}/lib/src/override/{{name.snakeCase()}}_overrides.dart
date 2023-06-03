import 'package:klar_api_client/klar_api_client.dart';
import 'package:uri/uri.dart';

// ignore_for_file: invalid_use_of_visible_for_testing_member

class Successful{{name.pascalCase()}}Override extends SimpleFakeObjectResponseProducer {
  Successful{{name.pascalCase()}}Override()
      : super(
          parser: UriParser(UriTemplate('/{{name.paramCase()}}/api/v1')),
          method: 'POST',
          response: '',
        );
}

class Failing{{name.pascalCase()}}Override extends SimpleFakeObjectResponseProducer {
  Failing{{name.pascalCase()}}Override()
      : super.from(
          FakeResponse(500, null),
          parser: UriParser(UriTemplate('/{{name.paramCase()}}/api/v1')),
          method: 'POST',
        );
}

final default{{name.pascalCase()}}Overrides = [
  Successful{{name.pascalCase()}}Override(),
];
