import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:talk_but_does_it_scale/src/data/module.dart';

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

  for (final m in modules) {
    print(m.path);
  }
  print('Count ${modules.length}');
  final root = from(modules);

  const encoder = JsonEncoder();
  final prettyprint = encoder.convert(root.toJson());
  print(prettyprint);
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
  return _from('klar', m);
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
