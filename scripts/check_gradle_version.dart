// Usage: dart check_gradle_version.dart

import 'dart:io';

// ignore_for_file: avoid_print
void main(List<String> args) async {

  final version = await _getVersion();
  print('Gradle version: $version%');

  // if (coverage < minCoverage) {
  //   print('Invalid coverage: $coverageString% < $minCoverage% (minimum)');
  //   exitCode = 1;
  //   throw InvalidCoverageException();
  // } else {
  //   exitCode = 0;
  // }
}

Future<String> _getVersion() async {
  final versionResult = await Process.run('./gradlew', ['--version']);
  final versionString = versionResult.stdout as String;
  final versionLine = versionString
      .split("\n")
      .where((element) => element.contains("Gradle"))
      .first;
  final version = versionLine
      .split(' ')
      .map((e) => e.trim())
      .last;
  return version;
}
