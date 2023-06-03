import 'package:mason/mason.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

void run(HookContext context) {
  context.vars = {
    ...context.vars,
    'root': p.basename(Directory.current.path),
  };
}
