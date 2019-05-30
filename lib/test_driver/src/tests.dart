import 'package:args/args.dart';

const url = 'url';
const screenshots = 'screenshots';

ArgParser testParser = ArgParser()
  ..addOption(
    url,
    abbr: url[0],
    help: 'Url for dartVmServiceUrl',
  )
  ..addFlag(
    screenshots,
    abbr: screenshots[0],
    help: 'Use screenshots',
  );
