import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

// ignore: avoid_relative_lib_imports
import '../../shared_ui/lib/src/data/module.dart';

void main() {
  final rootFolder = Directory('.');

  final modules = rootFolder
      .listSync(recursive: true)
      .whereType<Directory>()
      .where(
        (d) => d
            .listSync()
            .whereType<File>()
            .any((f) => path.basename(f.path) == 'pubspec.yaml'),
      )
      .where(
        (d) => !d.path.contains('ephemeral') && !d.path.contains('.bricks'),
      )
      .toList()
    ..sort((d1, d2) => d1.path.compareTo(d2.path));

  stdout.writeln('Module Count ${modules.length}');
  final root = from(modules);

  final _json = json.encode(root.toJson());
  stdout.writeln(_json);
}

Module from(List<Directory> modules) {
  final names = modules
      .map((m) => m.path)
      .map((p) => p.replaceAll('./', ''))
      .map((path) => path.split('/'));

  final m = <String, dynamic>{};
  for (final n in names) {
    _fromPath(n, m);
  }
  return _from('klar (${names.length})', m);
}

void _fromPath(List<String> modules, Map<String, dynamic> map) {
  final name = modules.first;
  if (map.containsKey(name)) {
    final m = map[name];
    _fromPath(modules.skip(1).toList(), m);
  } else {
    map[name] = <String, dynamic>{};
  }
}

Module _from(String name, Map<String, dynamic> map) {
  final children =
      map.entries.map((module) => _from(module.key, module.value)).toList();
  return Module(
    name: name,
    modules: children,
  );
}
