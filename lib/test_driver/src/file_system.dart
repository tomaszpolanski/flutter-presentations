import 'dart:io';

String platformPath(String path) =>
    Platform.isWindows ? path.replaceAll('/', r'\') : path;

bool exists(String path) => path != null && File(path).existsSync();
