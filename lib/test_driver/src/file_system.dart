import 'dart:io';

String platformPath(String path) =>
    Platform.isWindows ? path.replaceAll('/', '\\') : path;

bool exists(String path) => path != null && File(path).existsSync();
