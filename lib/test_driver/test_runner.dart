import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:meta/meta.dart';
import 'package:process_run/shell.dart';
import 'package:rxdart/rxdart.dart';

import 'src/commands.dart';
import 'src/file_system.dart';

const file = 'file';
const directory = 'directory';
const language = 'language';
const screenshots = 'screenshots';
const help = 'help';

Future<void> main(List<String> paths) async {
  final parser = createParser();
  final result = parser.parse(paths);
  if (result[help] == true) {
    print(parser.usage); // ignore: avoid_print
    return;
  }

  Directory('build').createSync(recursive: true);
  final makeScreenshot = result[screenshots] == true;
  if (makeScreenshot) {
    final dir = Directory(screenshots);

    if (dir.existsSync()) {
      dir.deleteSync(recursive: true);
    }
  }

  if (result[file] != null) {
    await setUp(() async {
      if (exists(result[file])) {
        await test(
          testFile: result[file],
          makeScreenshot: makeScreenshot,
        );
      } else {
        stderr.writeln('Specified file "${result[file]}" does not exist');
        exitCode = 1;
      }
    });
  } else if (result[directory] != null) {
    await setUp(() async {
      for (final file in await _tests(result[directory])) {
        await test(
          testFile: file,
          makeScreenshot: makeScreenshot,
        );
      }
    });
  }
}

Future<void> setUp(Future<void> Function() test) async {
  const main = 'lib/main.dart';
  const mainCopy = 'lib/main_copy.dart';
  if (exists(main)) {
    await File(main).rename(mainCopy);
  }

  try {
    await test();
  } finally {
    if (exists(mainCopy)) {
      await File(mainCopy).rename(main);
    } else {
      stderr.writeln('Was not able to restore main as the copy does not exist');
      exitCode = 1;
    }
  }
}

Future<List<String>> _tests(String directoryPath) => Directory(directoryPath)
    .list(recursive: true)
    .where((file) => file.uri.path.endsWith('_test.dart'))
    .asyncMap((uri) => uri.path)
    .toList();

ArgParser createParser() {
  return ArgParser()
    ..addOption(
      file,
      abbr: file[0],
      help: 'Run single test file',
    )
    ..addOption(
      directory,
      abbr: directory[0],
      defaultsTo: 'test_driver',
      help: 'Run all the tests in the directory recursively',
    )
    ..addOption(
      language,
      abbr: language[0],
      defaultsTo: 'en',
      help: 'System language, supported languages:',
    )
    ..addFlag(
      screenshots,
      abbr: screenshots[0],
      help: 'Enables screenshots during test run',
    )
    ..addFlag(
      help,
      abbr: help[0],
      help: 'Display this help message',
      negatable: false,
    );
}

const _main = 'lib/main.dart';

Future<void> test({
  @required String testFile,
  @required bool makeScreenshot,
}) async {
  assert(testFile != null);

  final completer = Completer<String>();

  final StreamController<List<int>> output = StreamController();
  final PublishSubject<String> input = PublishSubject();
  output.stream.transform(utf8.decoder).listen((data) async {
    final match = RegExp('is available at: (http://.*/)').firstMatch(data);
    if (match != null) {
      completer.complete(match.group(1));
    }
  });

  final mainFile = testFile.replaceFirst('_test.dart', '.dart');

  await File(mainFile).copy(_main);

  // ignore: unawaited_futures
  Shell(
    stdout: output,
    stdin: input.map(utf8.encode),
  ).run(Commands().flutter.run()).then((_) {
    input.close();
    output.close();
  });

  final url = await completer.future;

  await Shell().run(Commands().flutter.dart(testFile, [
    '-u',
    url,
    if (makeScreenshot) '-s',
  ]));

  input.add('q');
}
