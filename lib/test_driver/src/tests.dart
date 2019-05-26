import 'package:args/args.dart';

const url = 'url';

ArgParser testParser = ArgParser()
  ..addOption(
    url,
    abbr: url[0],
    help: 'Url for dartVmServiceUrl',
  );
