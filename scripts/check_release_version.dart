import 'dart:convert';
import 'dart:io';

// ignore_for_file: avoid_print
void main(List<String> args) async {
  // it could come with the prefix 'refs/tags/'
  final releaseVersion = args[0].replaceAll("refs/tags/", "").trim();
  print('Release version: $releaseVersion');

  final pkgVersion = await _getPackageVersion();
  print('Package version: $pkgVersion');

  if (releaseVersion != pkgVersion) {
    print('Invalid Release version: $releaseVersion != $pkgVersion');
    exitCode = 1;
    throw InvalidVersionException();
  } else {
    exitCode = 0;
  }
}

Future<String> _getPackageVersion() async {
  final file = File('pubspec.yaml');
  final lines = await file
      .openRead()
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .toList();

  return lines
      .firstWhere((element) => element.startsWith("version"))
      .split(":")[1]
      .trim();
}

class InvalidVersionException implements Exception {}
