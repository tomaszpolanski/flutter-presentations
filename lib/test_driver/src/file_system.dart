import 'dart:io';

String platformPath(String path) {
  return Platform.isWindows ? path.replaceAll('/', '\\') : path;
}

bool exists(String path) {
  if (path != null) {
    return File(path).existsSync();
  } else {
    return false;
  }
}
