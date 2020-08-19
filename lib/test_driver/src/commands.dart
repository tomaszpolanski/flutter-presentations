import 'dart:io';

class Commands {
  Flutter get flutter => const Flutter._();

  Tests get tests => const Tests._();
}

class Tests {
  const Tests._();

  String testRunner() {
    return Platform.isWindows ? 'test_runner.bat' : './test_runner.sh';
  }

  String appRunner() {
    return Platform.isWindows ? 'test_app_runner.bat' : './test_app_runner.sh';
  }
}

class Flutter {
  const Flutter._();

  String run() {
    return 'flutter run -d $_device -v';
  }

  String attach(String debugUri) {
    return 'flutter attach -d $_device --debug-uri $debugUri';
  }

  String dart(String file, [List<String> arguments]) {
    return 'dart $file ${arguments != null ? arguments.join(' ') : ''}';
  }

  String get _device {
    if (Platform.isWindows) {
      return 'windows';
    } else if (Platform.isLinux) {
      return 'linux';
    } else {
      return 'macos';
    }
  }
}
